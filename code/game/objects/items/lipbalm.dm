/obj/item/lipbalm
	name = "lip balm stick"
	desc = "A blue stick of unflavoured lip balm. Useful for keeping one's lips smooth!"
	icon = 'icons/obj/toiletries.dmi'
	icon_state = "lipbalm_blue"
	inhand_icon_state = "lipbalm"
	lefthand_file = 'icons/mob/inhands/items/toiletries_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/toiletries_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	interaction_flags_click = ALLOW_RESTING|NEED_HANDS
	//grind_results = list()
	/// Is the lip balm stick opened, or closed?
	var/opened = FALSE
	/// How many times the lip balm can be used before running out.
	var/uses = 6

/obj/item/lipbalm/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)
	update_appearance(UPDATE_ICON)

/obj/item/lipbalm/update_icon_state()
	if (uses > 0)
		icon_state = "lipbalm_blue[opened ? "_open" : null]"
	else
		icon_state = "lipbalm_blue[opened ? "_empty" : null]"
	inhand_icon_state = "lipbalm[opened ? "_open" : null]"
	return ..()

/obj/item/lipbalm/vv_edit_var(vname, vval)
	. = ..()
	if(vname == NAMEOF(src, opened))
		update_appearance(UPDATE_ICON)

/obj/item/lipbalm/examine(mob/user)
	. = ..()
	. += span_notice("You can use it in hand to [opened ? "close" : "open"] the lid.")
	if(!opened)
		. += span_notice("<i>You could take the lid off to see how much balm is left.</i>")
	else
		if (uses >= 6)
			. += span_notice("<i>The top of the balm is still flat and shiny, its just fresh out of the package!</i>")
		else if (uses < 6 && uses >= 4)
			. += span_notice("<i>The top of the balm is slightly rounded and smoothed down, it still looks fairly new.</i>")
		else if (uses < 4 && uses >= 2)
			. += span_notice("<i>The top of the balm is rather smushed up and rounded, but still looks like there's balm left.</i>")
		else if (uses == 1)
			. += span_notice("<i>The plastic base is partially visible, but there's a small amount of balm left.</i>")
		else
			. += span_warning("<i>The plastic base is at the top of the tube, there's nothing left.</i>")

/obj/item/lipbalm/attack_self(mob/user)
	to_chat(user, span_notice("You [opened ? "place" : "remove"] the lid on the [src]."))
	opened = !opened
	update_appearance(UPDATE_ICON)

/obj/item/lipbalm/attack(mob/M, mob/user)
	var/mob/living/carbon/human/target_entity = M // The entity which the lip balm is being used on

	if (!ismob(target_entity))
		return
	if (!opened)
		to_chat(user, span_warning("You need to open \the [src] before you can use it!"))
		return
	else
		if (uses > 0)
			if (target_entity == user && !ishuman(target_entity)) // If you have hands, are a carbon but not human, and can pick the lip balm up.
				user.visible_message(span_notice("[user] smears \the [src] onto themself."), \
					span_notice("You smear \the [src] onto yourself."))
				uses -= 1
				update_appearance(UPDATE_ICON)
				return ..()

			if (!ishuman(target_entity)) // The concept of just smearing lip balm onto an alien seems funny.
				user.visible_message(span_warning("[user] smears \the [src] onto [target_entity]!"), \
					span_notice("You smear \the [src] onto [target_entity]."))
				uses -= 1
				// A sound when the lip balm is smeared would be nice.
				update_appearance(UPDATE_ICON)
				return ..()

			if (target_entity.is_mouth_covered())
				to_chat(user, span_warning("Remove [target_entity == user ? "your" : "[target_entity.p_their()]"] mask first!"))
				return

			if (target_entity == user)
				user.visible_message(span_notice("[user] smears \the [src] onto [user.p_their()] lips."), \
					span_notice("You smear \the [src] across your lips, applying the balm."))
				uses -= 1
				target_entity.add_mood_event("lipbalmed", /datum/mood_event/lipbalmed)
				// Sound?
				update_appearance(UPDATE_ICON)
				return ..()

			user.visible_message(span_warning("[user] starts to apply \the [src] onto [target_entity]'s lips."), \
				span_notice("You start applying \the [src] onto [target_entity]'s lips..."))
			if(!do_after(user, 2 SECONDS, target = target_entity))
				return
			user.visible_message(span_notice("[user] applies \the [src] onto [target_entity]'s lips."),\
				span_notice("You finish applying \the [src] onto [target_entity]'s lips."))
			target_entity.add_mood_event("lipbalmed", /datum/mood_event/lipbalmed)
			uses -= 1
			update_appearance(UPDATE_ICON)
			return ..()
		else
			to_chat(user, span_warning("There's no balm left in \the [src]!"))
			return

/*/obj/item/lipbalm/short
	name = "mini lip balm stick"
	desc = "A smaller stick of lip balm."
	icon_state = "lipbalm_short"
	//inhand_icon_state =
*/
