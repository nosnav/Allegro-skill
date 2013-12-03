;;; Dec 03, 2013
;Type "getheight" the start program.

axlCmdRegister( "getheight" `_package_getheight)

;********************************************************************************
(defun _package_getheight ()
println("======= START =======")

max = "PACKAGE_HEIGHT_MAX"
;
; Open each symbol by name
;

;axlOpenDesign(?design shapename ?mode "wf" )
;fprintf(outlog "%s read in for area/max_height extraction...\n" shapename)

visibleLayers = axlVisibleGet()	;original visiable layers
axlClearSelSet()
;axlVisibleDesign(nil)
axlVisibleLayer("PACKAGE GEOMETRY/PLACE_BOUND_TOP" t)
axlSetFindFilter(?enabled "shapes" ?onButtons "shapes")
axlAddSelectAll()
lshape = axlGetSelSet()

foreach(shape lshape
	proplist=axlDBGetProperties(shape)

	if( proplist!=nil ;check to make sure there are attached properties.
	then	
		foreach(prop_pair proplist	 ;step through each property
			prop_key=symbolToString(car(prop_pair))
			prop_val=cadr(prop_pair)
			if(prop_key=="PACKAGE_HEIGHT_MAX" 
			then
				;max_height=atof(car(parseString(prop_val)))/1000
				max_height=prop_val
				'printf("%s\n" max_height)
				printf("%s,%s\n" "The height of the shape is: " max_height)
				poly = car(axlPolyFromDB(shape))
				shp_area = poly->area
				shp_area = shp_area/1000000
				;printf("%2.3f\n" shp_area)
			);end if prop max
		);end foreach
		);end if
);end foreach

axlVisibleSet(visibleLayers)	;restore design visibility

;curshapename = axlCurrentDesign()
;axlClearSelSet()
;axlVisibleDesign(nil)
;axlVisibleLayer("PIN/TOP" t)
;axlVisibleUpdate(t)
;axlSetFindFilter(?enabled "PINS" ?onButtons "PINS")
;axlAddSelectAll()
;pincnt = axlGetSelSetCount()
;fprintf(sepupdate "%s,%2.3f,%2.3f,%n\n" curshapename shp_area max_height pincnt)
;axlClearSelSet()


println("======= END =======")
); end defun _package_getheight

;******************************************************************************
