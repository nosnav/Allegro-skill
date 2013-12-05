;###########################################################
;#  Function : get_symbol_height()
;#  Descript : Get the 'height' property of the attached text from the selected symbol. Type "symbolh" after load this skill.
;#  Version  : 1.0          
;#  Date     : December 05 2013
;#  Author   : Yu-Wei Wang. NB Software Application Sect.
;#  comment  : Tested with Allegro v16.6 on Windows 7
;###########################################################

axlCmdRegister( "symbolh" 'symbolh)

(defun symbolh ()
"Print text of selected objects"
mypopup = axlUIPopupDefine( nil (list (list "Done" 'axlFinishEnterFun) (list "Cancel" 'axlCancelEnterFun)))
axlUIPopupSet( mypopup)
axlSetFindFilter( ?enabled list("noall") ?onButtons "noall")
axlSetFindFilter( ?enabled list("symbols") ?onButtons "symbols")
axlOpenFindFilter()
(while (axlSelect)
	progn(
		alltext = axlDBGetAttachedText(car(axlGetSelSet()))
		foreach(thistext alltext
			strings_of_H = parseQuotedString(thistext->text ":")
			if(car(strings_of_H)=="H"
				printf( "The height of the selected symbol is : '%s'\n", thistext->text)
			)
		)
	)
)
axlCloseFindFilter())

;###############
;#     End     #
;###############