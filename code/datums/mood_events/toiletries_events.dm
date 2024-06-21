/** - Toiletries Mood Events
 * Mood events which relate to the toiletry items. (Things like lip balm)
 * They'll get applied to the user (or target) when a toilietry is used, providing a small temporary
 * mood boost to the user. Take care of yourself, and you'll generally be in better spirits.
 * (When's the last time you've had some water? Stay hydrated.)
 * In some cases though, the toiletry might incure a small negative mood penality. (Such as a species specific item.
 * Which would probably not feel pleasent if used by somebody else.)
 */
/datum/mood_event/lipbalmed
	description = "The lip balm made my lips feel much smoother."
	mood_change = 1
	timeout = 2 MINUTES
