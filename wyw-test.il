;;; Dec 03, 2013
;Type "getheight" the start program.

axlCmdRegister( "getheight2" `_package_getheight)

;********************************************************************************
(defun _package_getheight2 ()
println("======= START =======")

;for( i 1 3 println( "hello" ))

;max = "PACKAGE_HEIGHT_MAX"
;min = "PACKAGE_HEIGHT_MIN"

visibleLayers = axlVisibleGet()	;original visiable layers
;println("xxxxxxxxxx")
;foreach(i visibleLayers println(i))
;println("xxxxxxxxxx")

axlVisibleLayer("PACKAGE GEOMETRY/PLACE_BOUND_TOP" t)		;
axlVisibleLayer("PACKAGE GEOMETRY/PLACE_BOUND_BOTTOM" t)	;

;println("xxxxxxxxxx")
;foreach(i visibleLayers println(i))
;println("xxxxxxxxxx")

axlClearSelSet()
axlSetFindFilter(?enabled list("noall" "shapes")
	?onButtons list("noall" "shapes"))
axlAddSelectAll()
shape_list = axlGetSelSet()
axlVisibleSet(visibleLayers)	;restore design visibility
axlVisibleUpdate(t)
axlClearSelSet()

;foreach(shape_db shape_list								;go thru layout pin list

	;padstack_db = shape_db->definition					;Extract PadstackID from pinID
	
	;printf(shape_db->name)
	
	;pad_name=padstack_db->name						;Extract Padstack Name from PadstackID
	;padstacklist[pad_name]=pad_name					;add to padstacklist table
	;printf(pad_name)
	;Drillsize = padstack_db->drillDiameter				;Extract Drill Diameter from PadstackID
	;drillsizelist[Drillsize]=Drillsize					;add to drillsizelist table
	
;);end foreach



;axlVisibleSet(visibleLayers) ; reset visibleLayers
println("======= END =======")
); end defun _package_getheight

;******************************************************************************
