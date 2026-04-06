PROGRAM:SNAKE
:ClrHome
:Lbl MENU
:Output(1,5,"- SNAKE -")
:Output(3,3,"Arrows=move")
:Output(4,3,"CLEAR=quit")
:Output(6,4,"ENTER to")
:Output(7,4,"start!")
:Pause
:ClrHome
:1->DX
:0->DY
:8->SX
:4->SY
:3->SL
:0->SC
:seq(0,I,1,30)->L1
:seq(0,I,1,30)->L2
:8->L1(1)
:7->L1(2)
:6->L1(3)
:4->L2(1)
:4->L2(2)
:4->L2(3)
:Lbl GETFOOD
:1+int(14*rand)->FX
:1+int(6*rand)->FY
:0->H
:For(I,1,SL)
:If L1(I)=FX and L2(I)=FY
:1->H
:End
:If H
:Goto GETFOOD
:Lbl LOOP
:Pause .1
:getKey->K
:If K=26 and DX<>-1
:Then
:1->DX
:0->DY
:End
:If K=24 and DX<>1
:Then
:-1->DX
:0->DY
:End
:If K=25 and DY<>1
:Then
:0->DX
:-1->DY
:End
:If K=34 and DY<>-1
:Then
:0->DX
:1->DY
:End
:If K=45
:Stop
:SX+DX->NX
:SY+DY->NY
:If NX<1 or NX>16 or NY<1 or NY>7
:Goto DEAD
:0->H
:For(I,1,SL)
:If L1(I)=NX and L2(I)=NY
:1->H
:End
:If H
:Goto DEAD
:0->ATE
:If NX=FX and NY=FY
:1->ATE
:If ATE
:Then
:SL+1->SL
:SC+10->SC
:End
:For(I,SL,2,-1)
:L1(I-1)->L1(I)
:L2(I-1)->L2(I)
:End
:NX->L1(1)
:NY->L2(1)
:NX->SX
:NY->SY
:ClrHome
:Output(FY,FX,"*")
:For(I,1,SL)
:Output(L2(I),L1(I),"O")
:End
:Output(8,1,"SC:")
:Output(8,4,SC)
:If ATE
:Goto GETFOOD
:Goto LOOP
:Lbl DEAD
:ClrHome
:Output(3,4,"GAME OVER!")
:Output(4,4,"Score:")
:Output(4,11,SC)
:Output(6,3,"ENTER again")
:Pause
:ClrHome
:Goto MENU
