axlCmdRegister( "wyw2" `_package_getheight)

;********************************************************************************

(defun _package_getheight ()
println("======= START =======")

let( (eventMask event, loop)
eventMask = list( 'PICK 'DBLPICK 'STARTDRAG)
;eventMask = list( 'PICK 'DBLPICK)
loop = t
while( loop
event = axlEnterEvent(eventMask , nil , nil)
	;when(event
	;axlUIWPrint(nil "%P" event->xy)
	;);end when
	case(event->type
		('PICK
			println("Pick event occur..."))
		('DBLPICK
			println("Double Pick event occur..."))
		('STARTDRAG
			println("STARTDRAG event occur..."))
		('DONE
			println("Done..."))
	)
);end while
);end let



println("======= END =======")
); end defun _package_getheight

;******************************************************************************
