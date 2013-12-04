axlCmdRegister( "test" 'test)

procedure( test()

visibleLayers = axlVisibleGet()	;original visiable layers
axlClearSelSet()
;axlVisibleDesign(nil)
axlVisibleLayer("PACKAGE GEOMETRY/PLACE_BOUND_TOP" t)
axlSetFindFilter(?enabled "shapes" ?onButtons "shapes")
axlAddSelectAll()
lshape = axlGetSelSet()


let((mypopup dbid_symbol)
        if(axlOKToProceed() then
                axlClearSelSet()
                axlSetFindFilter(?enabled '("NOALL" "SHAPES") ?onButtons '("SHAPES"))
                mypopup = axlUIPopupDefine(nil list(list("Done" 'test_done) list("Cancel" 'test_cancel)))
                axlUIPopupSet(mypopup)
                stop = t
                while(stop 
                        axlClearSelSet()
                        dbid_symbol = axlGetSelSet(axlSingleSelectBox())
                        if(dbid_symbol then
                                axlHighlightObject(dbid_symbol t)
                                println(dbid_symbol~>name)
                        else
                                println(dbid_symbol~>name)
                        )
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
        axlFinishEnterFun()
)
)

procedure( test_cancel()
let(()
        stop = nil
        axlCancelEnterFun()
)
)
