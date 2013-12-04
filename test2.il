axlCmdRegister( "test2" 'test2)

procedure( test2()

visibleLayers = axlVisibleGet()	;original visiable layers
axlClearSelSet()
;axlVisibleDesign(nil)
axlVisibleLayer("PACKAGE GEOMETRY/PLACE_BOUND_TOP" t)
axlVisibleLayer("PACKAGE GEOMETRY/PLACE_BOUND_BOTTOM" t)
;axlSetFindFilter(?enabled "shapes" ?onButtons "shapes")
;axlAddSelectAll()
;lshape = axlGetSelSet()


let((mypopup dbid_symbol)
        if(axlOKToProceed() then
                axlClearSelSet()
                axlSetFindFilter(?enabled '("NOALL" "SHAPES") ?onButtons '("SHAPES"))
                ;mypopup = axlUIPopupDefine(nil list(list("Done" 'test_done) list("Cancel" 'test_cancel)))
				mypopup = axlUIPopupDefine(nil list(list("Done" 'test_done)))
                axlUIPopupSet(mypopup)
                stop = t
                while(stop 
                        axlClearSelSet()
                        dbid_symbol = axlGetSelSet(axlSingleSelectBox())
                        ;if(dbid_symbol then
                        ;        axlHighlightObject(dbid_symbol t)
                        ;        println(dbid_symbol~>name)
                        ;else
                        ;        println(dbid_symbol~>name)
                        ;)
						;====== start
						;lshape = axlGetSelSet()

						foreach(shape dbid_symbol
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
										;printf("%s\n" max_height)
										printf("%s,%s\n" "The PACKAGE_HEIGHT_MAX of the selected shape is: " max_height)
										;poly = car(axlPolyFromDB(shape))
										;shp_area = poly->area
										;shp_area = shp_area/1000000
										;printf("%2.3f\n" shp_area)
									);end if prop max
								);end foreach
								);end if
						);end foreach
						;====== end
                )
                axlUIPopupSet(nil)
        else
                axlUIConfirm("Finish current command first.")
        )
);end let
);end procedure

procedure( test_done()
let(()
        stop = nil
		axlVisibleSet(visibleLayers)	;restore design visibility
        axlFinishEnterFun()
)
)

procedure( test_cancel()
let(()
        stop = nil
		axlVisibleSet(visibleLayers)	;restore design visibility
        axlCancelEnterFun()
)
)
