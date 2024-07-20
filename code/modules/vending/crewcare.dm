/obj/machinery/vending/crewcare
	name = "\improper Crew-Care"
	desc = "A wall-mounted toiletries and hygiene item dispenser, perfect for keeping oneself clean and fresh."
	icon_state = "crew-care"
	panel_type = "crew-care-panel"
	light_mask = "crew-care-light-mask"
	density = FALSE
	tiltable = FALSE
	// Only the product slogans seem to be said. Need to find out how/when an ad is played.
	product_ads = "Need to freshen up? Look no further!;Crew-Care! Caring for the crew." // TO ADD MORE ADS AND SLOGANS.
	product_slogans = "Crew-Care cares!;Look after yourself!;A clean crew is a happy crew!"
	vend_reply = "Stay fresh!"
	products = list( // TO-BE EXPANDED UPON (With categories and more items.)
		/obj/item/lipbalm = 3 // TEMPORARY FOR TESTING
	)
	//product_categories = list()
	//contraband = list()
	refill_canister = /obj/item/vending_refill/crewcare
	default_price = PAYCHECK_CREW * 0.7
	payment_department = ACCOUNT_SRV

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/vending/crewcare, 32)

/obj/item/vending_refill/crewcare
	machine_name = "Crew-Care"
	icon_state = "refill_hygiene"
