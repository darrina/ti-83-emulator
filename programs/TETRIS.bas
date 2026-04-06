PROGRAM:TETRIS
:ClrHome
:Lbl MENU
:Output(1,5,"- TETRIS -")
:Output(3,3,"Left/Right=move")
:Output(4,3,"Down=fast drop")
:Output(5,3,"Up=rotate")
:Output(7,4,"ENTER to")
:Output(8,4,"start!")
:Pause
:ClrHome
:0->SC
:0->LN
:seq(0,I,1,56)->L1
:Lbl NEWP
:5->PX
:1->PY
:int(7*rand)+1->TP
:Lbl DRAW
:ClrHome
:For(R,1,7)
:Output(R+1,4,"[")
:Output(R+1,12,"]")
:End
:Output(1,1,"SC:")
:Output(1,4,SC)
:Output(1,9,"LN:")
:Output(1,12,LN)
:For(R,1,7)
:For(C,1,7)
:If L1((R-1)*7+C)=1
:Output(R+1,C+4,"#")
:End
:End
:Output(PY+1,PX+4,"X")
:Lbl TICK
:Pause .25
:getKey->K
:If K=45
:Stop
:If K=24 and PX>1
:PX-1->PX
:If K=26 and PX<7
:PX+1->PX
:If K=34
:Then
:PY+1->PY
:PY+1->PY
:End
:PY+1->PY
:If PY>7
:Goto PLACE
:If L1((PY-1)*7+PX)=1
:Goto PLACE
:Goto DRAW
:Lbl PLACE
:If PY<=1
:Goto OVER
:1->L1((PY-1)*7+PX)
:For(R,1,7)
:1->FR
:For(C,1,7)
:If L1((R-1)*7+C)=0
:0->FR
:End
:If FR=1
:Then
:LN+1->LN
:SC+10->SC
:For(RR,R,2,-1)
:For(CC,1,7)
:L1((RR-2)*7+CC)->L1((RR-1)*7+CC)
:End
:End
:For(CC,1,7)
:0->L1(CC)
:End
:End
:End
:Goto NEWP
:Lbl OVER
:ClrHome
:Output(3,3,"GAME OVER!")
:Output(4,3,"Score:")
:Output(4,10,SC)
:Output(5,3,"Lines:")
:Output(5,10,LN)
:Output(7,3,"ENTER again")
:Pause
:ClrHome
:Goto MENU
