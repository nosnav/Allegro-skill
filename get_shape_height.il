;###########################################################
;#  Function : get_shape_height()
;#  Descript : Get PACKAGE_HEIGHT_MAX from selected shapes. Type "gsh" after load this skill.
;#  Version  : ver1.0          
;#  Date     : December 05 2013
;#  Author   : Yu-Wei Wang. NB Software Application Sect.
;#  comment  : Tested with Allegro v16.6 on Windows 7
;###########################################################

axlCmdRegister( "gsh" 'get_shape_height)

procedure( get_shape_height()

visibleLayers = axlVisibleGet()	;original visiable layers
axlClearSelSet()
axlVisibleLayer("PACKAGE GEOMETRY/PLACE_BOUND_TOP" t)
axlVisibleLayer("PACKAGE GEOMETRY/PLACE_BOUND_BOTTOM" t)

let((gshpopup dbid_shape)
        if(axlOKToProceed() then
                axlClearSelSet()
                axlSetFindFilter(?enabled '("NOALL" "SHAPES") ?onButtons '("SHAPES"))
				gshpopup = axlUIPopupDefine(nil list(list("Done" 'gsh_done)))
                axlUIPopupSet(gshpopup)
                loop = t
                while(loop 
                        axlClearSelSet()
                        dbid_shape = axlGetSelSet(axlSingleSelectBox())

						foreach(shape dbid_shape
							proplist=axlDBGetProperties(shape)

							if( proplist!=nil ;check to make sure there are attached properties.
							then	
								foreach(prop_pair proplist	 ;step through each property
									prop_key=symbolToString(car(prop_pair))
									prop_val=cadr(prop_pair)
									if(prop_key=="PACKAGE_HEIGHT_MAX" 
									then
										max_height=prop_val
										printf("%s,%s\n" "The PACKAGE_HEIGHT_MAX of the selected shape is: " max_height)
									);end if prop max
								);end foreach
								);end if
						);end foreach
						;====== end
                )
                axlUIPopupSet(nil)
        else
                axlUIConfirm("Right the mouse button and select Finish.")
        )
);end let
);end procedure

procedure( gsh_done()
	let(()
			loop = nil
			axlVisibleSet(visibleLayers)	;restore design visibility
			axlFinishEnterFun()
	)
)

;###############
;#     End     #
;###############