PROGRAM:PONG
:ClrHome
:Lbl MENU
:Output(1,5,"- PONG -")
:Output(3,3,"Up/Down=move")
:Output(4,3,"CLEAR=quit")
:Output(5,3,"Score to 7")
:Output(7,4,"ENTER to")
:Output(8,4,"start!")
:Pause
:ClrHome
:0->PS
:0->CS
:9->BX
:4->BY
:1->BDX
:1->BDY
:4->PY
:4->CY
:Lbl GLOOP
:Pause .06
:getKey->K
:If K=25 and PY>1
:PY-1->PY
:If K=34 and PY<8
:PY+1->PY
:If K=45
:Stop
:BX+BDX->BX
:BY+BDY->BY
:If BY<1
:Then
:1->BY
:-1*BDY->BDY
:End
:If BY>8
:Then
:8->BY
:-1*BDY->BDY
:End
:If BX<=2 and abs(BY-PY)<=1
:Then
:-1*BDX->BDX
:3->BX
:End
:If BX>=15 and abs(BY-CY)<=1
:Then
:-1*BDX->BDX
:14->BX
:End
:If BX<1
:Then
:CS+1->CS
:9->BX
:4->BY
:1->BDX
:End
:If BX>16
:Then
:PS+1->PS
:9->BX
:4->BY
:-1->BDX
:End
:If abs(CY-BY)>1
:Then
:If BY<CY
:CY-1->CY
:If BY>CY
:CY+1->CY
:End
:ClrHome
:Output(PY,1,"[")
:If PY>1
:Output(PY-1,1,"|")
:If PY<8
:Output(PY+1,1,"|")
:Output(CY,16,"]")
:If CY>1
:Output(CY-1,16,"|")
:If CY<8
:Output(CY+1,16,"|")
:Output(BY,BX,"o")
:Output(1,5,"YOU")
:Output(1,9,PS)
:Output(1,11,"CPU")
:Output(1,15,CS)
:If PS=7 or CS=7
:Goto WIN
:Goto GLOOP
:Lbl WIN
:ClrHome
:Output(3,4,"GAME OVER!")
:If PS=7
:Output(5,4,"YOU  WIN!")
:If CS=7
:Output(5,4,"CPU  WINS!")
:Output(7,3,"ENTER=restart")
:Pause
:ClrHome
:Goto MENU
