/obj/machinery/vending/walltoiletries
	name = "\improper Crew-Care"
	desc = "A wall-mounted toiletries dispenser, perfect for keeping oneself clean and fresh."
	//icon_state =
	//panel_type =
	//light_mask =
	density = FALSE
	tiltable = FALSE
	//product_ads =
	//product_slogans =
	vend_reply = "Stay fresh!"
	//products = list()
	//product_categories = list()
	//contraband = list()
	refill_canister = /obj/item/vending_refill/walltoiletries
	default_price = PAYCHECK_CREW * 0.7
	//

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/vending/walltoiletries, 32)

/obj/item/vending_refill/walltoiletries
	machine_name = "Crew-Care"
	icon_state = "refill_hygiene"
