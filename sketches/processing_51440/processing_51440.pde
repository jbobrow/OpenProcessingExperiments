
/*------------------------------------------*/ void setup () {
/*----------Generals------------*/
size(400,400);
background(250);
rectMode(CENTER);
ellipseMode(CENTER);
smooth();

/*----------Content------------*/

}/*closing 'void setup'*/

/*------------------------------------------*/ void draw () {
/*----------Generals------------*/
background(255,255,255);
smooth();

/*----------Background Content------------*/
/*B&W*/
/*HR:W->B*/ noStroke(); fill(0,0,0,mouseX); rect(210,5,400,10); 
/*HR:B->W BG*/ noStroke(); fill(0,0,0); rect(205,15,390,10);
/*HR:B->W*/ noStroke(); fill(250,250,250,mouseX); rect(205,15,390,10);

/*VR:W->B*/ noStroke(); fill(0,0,0,mouseY); rect(5,205,10,410);
/*VR:B->W BG*/ noStroke(); fill(0,0,0); rect(15,210,10,400);
/*VR:B->W*/ noStroke(); fill(250,250,250,mouseY); rect(15,210,10,400);

/*Blue*/
/*HR:Blu->DBlu BG*/ noStroke(); fill(0,75,255); rect(210,25,380,10);
/*HR:Blu->DBlu*/ noStroke(); fill(0,23,80,mouseX); rect(210,25,380,10); 
/*HR:DBlu->Blu BG*/ noStroke(); fill(0,23,80); rect(215,35,380,10);
/*HR:DBlu->Blu*/ noStroke(); fill(0,75,255,mouseX); rect(215,35,380,10); 

/*VR:B->DB BG*/ noStroke(); fill(0,75,255); rect(25,215,10,390);
/*VR:B->DB*/ noStroke(); fill(0,23,80,mouseY); rect(25,215,10,390);
/*VR:DB->B BG*/ noStroke(); fill(0,23,80); rect(35,220,10,380);
/*VR:DB->B*/ noStroke(); fill(0,75,255,mouseY); rect(35,220,10,380);

/*Purple*/
/*HR:P->DP BG*/ noStroke(); fill(124,0,182); rect(220,45,360,10);
/*HR:P->DP*/ noStroke(); fill(55,0,80, mouseX); rect(220,45,360,10);
/*HR:DP->P BG*/ noStroke(); fill(55,0,80); rect(225,55,350,10);
/*HR:DP->P*/ noStroke(); fill(124,0,182,mouseX); rect(225,55,350,10); 

/*VR:P->DP BG*/ noStroke(); fill(124,0,182); rect(45,225,10,370);
/*VR:P->DP*/ noStroke(); fill(55,0,80,mouseY); rect(45,225,10,370);
/*VR:DP->D BG*/ noStroke(); fill(55,0,80); rect(55,230,10,360);
/*VR:DP->D*/ noStroke(); fill(124,0,182,mouseY); rect(55,230,10,360);

/*Red*/
/*HR:R->DR BG*/ noStroke(); fill(255,0,0); rect(235,65,330,10);
/*HR:R-DR*/ noStroke(); fill(82,0,0, mouseX); rect(235,65,330,10);
/*HR:DR->R BG*/ noStroke(); fill(82,0,0); rect(240,75,320,10);
/*HR:DR->R*/ noStroke(); fill(255,0,0, mouseX); rect(240,75,320,10);

/*VR:R->DR BG*/ noStroke(); fill(255,0,0); rect(65,235,10,350);
/*VR:R->DR*/ noStroke(); fill(82,0,0, mouseY); rect(65,235,10,350);
/*VR:DR->R BG*/ noStroke(); fill(82,0,0); rect(75,240,10,340);
/*VR:DR->R*/ noStroke(); fill(255,0,0,mouseY); rect(75,240,10,340);

/*Orange*/
/*HO:O->DO BG*/ noStroke(); fill(255,138,0); rect(240,85,320,10);
/*HR:O-DO*/ noStroke(); fill(82,0,0, mouseX); rect(240,85,320,10);
/*HR:DO->O BG*/ noStroke(); fill(82,0,0); rect(245,95,310,10);
/*HR:DO->O*/ noStroke(); fill(255,138,0, mouseX); rect(245,95,310,10);

/*VR:O->DO BG*/ noStroke(); fill(255,138,0); rect(85,245,10,330);
/*VR:O->DO*/ noStroke(); fill(82,0,0,mouseY); rect(85,245,10,330);
/*VR:DO->O BG*/ noStroke(); fill(82,0,0); rect(95,250,10,320);
/*VR:DO->O*/ noStroke(); fill(255,138,0,mouseY); rect(95,250,10,320);

/*Yellow*/
/*HR:Y->DY BG*/ noStroke(); fill(255,198,0); rect(250,105,300,10);
/*HR:Y-DY*/ noStroke(); fill(63,49,0, mouseX); rect(250,105,300,10);
/*HR:DY->Y BG*/ noStroke(); fill(63,49,0); rect(255,115,290,10);
/*HR:DY->Y*/ noStroke(); fill(255,198,0, mouseX); rect(255,115,290,10);

/*VR:Y->DY BG*/ noStroke(); fill(255,198,0); rect(105,255,10,310);
/*VR:Y->DY*/ noStroke(); fill(63,49,0,mouseY); rect(105,255,10,310);
/*VR:DY->Y BG*/ noStroke(); fill(63,49,0); rect(115,260,10,300);
/*VR:DY->Y*/ noStroke(); fill(255,198,0,mouseY); rect(115,260,10,300);

/*Green*/
/*HR:G->DG BG*/ noStroke(); fill(35,185,0); rect(260,125,280,10);
/*HR:G-DG*/ noStroke(); fill(9,46,0, mouseX); rect(260,125,280,10);
/*HR:DG->G BG*/ noStroke(); fill(9,46,0); rect(265,135,270,10);
/*HR:DG->G*/ noStroke(); fill(35,185,0, mouseX); rect(265,135,270,10);

/*VR:G->DG BG*/ noStroke(); fill(35,185,0); rect(125,265,10,290);
/*VR:G->DG*/ noStroke(); fill(9,46,0,mouseY); rect(125,265,10,290);
/*VR:DG->G BG*/ noStroke(); fill(9,46,0); rect(135,270,10,280);
/*VR:DG->G*/ noStroke(); fill(35,185,0,mouseY); rect(135,270,10,280);

/*LightBlue*/
/*HR:LB->DLB BG*/ noStroke(); fill(0,174,255); rect(270,145,260,10);
/*HR:LB-DLB*/ noStroke(); fill(0,45,66, mouseX); rect(270,145,260,10);
/*HR:DLB->LB BG*/ noStroke(); fill(0,45,66); rect(275,155,250,10);
/*HR:DLB->LB*/ noStroke(); fill(0,174,255, mouseX); rect(275,155,250,10);

/*VR:LB->DLB BG*/ noStroke(); fill(0,174,255); rect(145,275,10,270);
/*VR:LB->DLB*/ noStroke(); fill(0,45,66,mouseY); rect(145,275,10,270);
/*VR:DLB->LB BG*/ noStroke(); fill(0,45,66); rect(155,280,10,260);
/*VR:DLB->LB*/ noStroke(); fill(0,174,255,mouseY); rect(155,280,10,260);

/*LightPurple*/
/*HR:LP->DLP BG*/ noStroke(); fill(168,0,255); rect(280,165,240,10);
/*HR:LP-DLP*/ noStroke(); fill(80,0,121, mouseX); rect(280,165,240,10);
/*HR:DLP->LP BG*/ noStroke(); fill(80,0,121); rect(285,175,230,10);
/*HR:DLP->LP*/ noStroke(); fill(168,0,255, mouseX); rect(285,175,230,10);

/*VR:LP->DLP BG*/ noStroke(); fill(168,0,255); rect(165,285,10,250);
/*VR:LP->DLP*/ noStroke(); fill(80,0,121,mouseY); rect(165,285,10,250);
/*VR:DLP->LP BG*/ noStroke(); fill(80,0,121); rect(175,290,10,240);
/*VR:DLP->LP*/ noStroke(); fill(168,0,255,mouseY); rect(175,290,10,240);

/*Pink*/
/*HR:P->DLP BG*/ noStroke(); fill(255,0,156); rect(290,185,220,10);
/*HR:P-DLP*/ noStroke(); fill(77,0,47, mouseX); rect(290,185,220,10);
/*HR:DP->P BG*/ noStroke(); fill(77,0,47); rect(295,195,210,10);
/*HR:DP->P*/ noStroke(); fill(255,0,156, mouseX); rect(295,195,210,10);

/*VR:P->DP BG*/ noStroke(); fill(255,0,156); rect(185,295,10,230);
/*VR:P->DP*/ noStroke(); fill(77,0,47,mouseY); rect(185,295,10,230);
/*VR:DP->P BG*/ noStroke(); fill(77,0,47); rect(195,300,10,220);
/*VR:DP->P*/ noStroke(); fill(255,0,156,mouseY); rect(195,300,10,220);

/*LightOrange*/
/*HR:LO->DLO BG*/ noStroke(); fill(255,156,0); rect(300,205,200,10);
/*HR:LO-DLO*/ noStroke(); fill(86,53,0, mouseX); rect(300,205,200,10);
/*HR:DLO->LO BG*/ noStroke(); fill(86,53,0); rect(305,215,190,10);
/*HR:DLP->P*/ noStroke(); fill(255,156,0, mouseX); rect(305,215,190,10);

/*VR:PLO->DLO BG*/ noStroke(); fill(255,156,0); rect(205,305,10,210);
/*VR:LO->DLO*/ noStroke(); fill(86,53,0,mouseY); rect(205,305,10,210);
/*VR:DLO->LO BG*/ noStroke(); fill(86,53,0); rect(215,310,10,200);
/*VR:DLO->LO*/ noStroke(); fill(255,156,0,mouseY); rect(215,310,10,200);

/*LightYellow*/
/*HR:LY->DLY BG*/ noStroke(); fill(255,240,0); rect(310,225,180,10);
/*HR:LY-DLY*/ noStroke(); fill(66,62,0, mouseX); rect(310,225,180,10);
/*HR:DLY->LY BG*/ noStroke(); fill(66,62,0); rect(315,235,170,10);
/*HR:DLY->Y*/ noStroke(); fill(255,240,0, mouseX); rect(315,235,170,10);

/*VR:LY->DLY BG*/ noStroke(); fill(255,240,0); rect(225,315,10,190);
/*VR:LY->DLY*/ noStroke(); fill(66,62,0,mouseY); rect(225,315,10,190);
/*VR:DLY->LY BG*/ noStroke(); fill(66,62,0); rect(235,320,10,180);
/*VR:DLY->LY*/ noStroke(); fill(255,240,0,mouseY); rect(235,320,10,180);

/*NeonGreen*/
/*HR:NG->DNG BG*/ noStroke(); fill(157,238,0); rect(320,245,160,10);
/*HR:NG-DNG*/ noStroke(); fill(44,67,0, mouseX); rect(320,245,160,10);
/*HR:DNG->NG BG*/ noStroke(); fill(44,67,0); rect(325,255,150,10);
/*HR:DNG->NG*/ noStroke(); fill(157,238,0, mouseX); rect(325,255,150,10);

/*VR:NG->DNG BG*/ noStroke(); fill(157,238,0); rect(245,325,10,170);
/*VR:NG->DNG*/ noStroke(); fill(44,67,0,mouseY); rect(245,325,10,170);
/*VR:DNG->NG BG*/ noStroke(); fill(44,67,0); rect(255,330,10,160);
/*VR:DNG->NG*/ noStroke(); fill(157,238,0,mouseY); rect(255,330,10,160);

/*SkyBlue*/
/*HR:SB->DSB BG*/ noStroke(); fill(0,252,255); rect(330,265,140,10);
/*HR:SB-DSB*/ noStroke(); fill(0,61,62, mouseX); rect(330,265,140,10);
/*HR:DSB->SB BG*/ noStroke(); fill(0,61,62); rect(335,275,130,10);
/*HR:DSB->SB*/ noStroke(); fill(0,252,255, mouseX); rect(335,275,130,10);

/*VR:SB->DSB BG*/ noStroke(); fill(0,252,255); rect(265,335,10,150);
/*VR:SB-DSB*/ noStroke(); fill(0,61,62,mouseY); rect(265,335,10,150);
/*VR:DSB->SB BG*/ noStroke(); fill(0,61,62); rect(275,340,10,140);
/*VR:DSB->SB*/ noStroke(); fill(0,252,255,mouseY); rect(275,340,10,140);

/*LightViolet*/
/*HR:SB->DSB BG*/ noStroke(); fill(219,52,255); rect(340,285,120,10);
/*HR:SB-DSB*/ noStroke(); fill(84,24,97, mouseX); rect(340,285,120,10);
/*HR:DSB->SB BG*/ noStroke(); fill(84,24,97); rect(345,295,110,10);
/*HR:DSB->SB*/ noStroke(); fill(219,52,255, mouseX); rect(345,295,110,10);

/*VR:LV->DLV BG*/ noStroke(); fill(219,52,255); rect(285,345,10,130);
/*VR:LV->DLV*/ noStroke(); fill(84,24,97,mouseY); rect(285,345,10,130);
/*VR:DLV->LV BG*/ noStroke(); fill(84,24,97); rect(295,350,10,120);
/*VR:DLV->LV*/ noStroke(); fill(219,52,255,mouseY); rect(295,350,10,120);

/*Salmon*/
/*HR:S->DS BG*/ noStroke(); fill(255,113,146); rect(350,305,100,10);
/*HR:S-DS*/ noStroke(); fill(105,33,50, mouseX); rect(350,305,100,10);
/*HR:DS->S BG*/ noStroke(); fill(105,33,50); rect(355,315,90,10);
/*HR:DS->S*/ noStroke(); fill(255,113,146, mouseX); rect(355,315,90,10);

/*VR:LV->DLV BG*/ noStroke(); fill(255,113,146); rect(305,355,10,110);
/*VR:LV->DLV*/ noStroke(); fill(105,33,50,mouseY); rect(305,355,10,110);
/*VR:DLV->LV BG*/ noStroke(); fill(105,33,50); rect(315,360,10,100);
/*VR:DLV->LV*/ noStroke(); fill(255,113,146,mouseY); rect(315,360,10,100);

/*PaleOrange*/
/*HR:PY->DPY BG*/ noStroke(); fill(255,192,101); rect(360,325,80,10);
/*HR:PY-DPY*/ noStroke(); fill(55,41,20, mouseX); rect(360,325,80,10);
/*HR:DPY->PY BG*/ noStroke(); fill(55,41,20); rect(365,335,70,10);
/*HR:DPY->PY*/ noStroke(); fill(255,192,101, mouseX); rect(365,335,70,10);

/*VR:LV->DLV BG*/ noStroke(); fill(255,192,101); rect(325,365,10,90);
/*VR:LV->DLV*/ noStroke(); fill(55,41,20,mouseY); rect(325,365,10,90);
/*VR:DLV->LV BG*/ noStroke(); fill(55,41,20); rect(335,370,10,80);
/*VR:DLV->LV*/ noStroke(); fill(255,192,101,mouseY); rect(335,370,10,80);


/*PaleYellow*/
/*HR:PG->DPG BG*/ noStroke(); fill(255,250,116); rect(370,345,60,10);
/*HR:PG-DPG*/ noStroke(); fill(56,57,25, mouseX); rect(370,345,60,10);
/*HR:DPG->PG BG*/ noStroke(); fill(56,57,25); rect(375,355,50,10);
/*HR:DPG->PG*/ noStroke(); fill(255,250,116, mouseX); rect(375,355,50,10);

/*VR:LV->DLV BG*/ noStroke(); fill(255,250,116); rect(345,385,10,70);
/*VR:LV->DLV*/ noStroke(); fill(56,57,25,mouseY); rect(345,385,10,70);
/*VR:DLV->LV BG*/ noStroke(); fill(56,57,25); rect(355,390,10,60);
/*VR:DLV->LV*/ noStroke(); fill(255,250,116,mouseY); rect(355,390,10,60);

/*PaleGreen*/
/*HR:BG->DBG BG*/ noStroke(); fill(146,255,126); rect(380,365,40,10);
/*HR:BG-DBG*/ noStroke(); fill(31,59,26, mouseX); rect(380,365,40,10);
/*HR:DBG->BG BG*/ noStroke(); fill(31,59,26); rect(385,375,30,10);
/*HR:DBG->BG*/ noStroke(); fill(146,255,126, mouseX); rect(385,375,30,10);

/*VR:LV->DLV BG*/ noStroke(); fill(146,255,126); rect(365,395,10,50);
/*VR:LV->DLV*/ noStroke(); fill(31,59,26,mouseY); rect(365,395,10,50);
/*VR:DLV->LV BG*/ noStroke(); fill(31,59,26); rect(375,400,10,40);
/*VR:DLV->LV*/ noStroke(); fill(146,255,126,mouseY); rect(375,400,10,40);

/*BlueGray*/
/*HR:BV->DBV BG*/ noStroke(); fill(93,145,165); rect(390,385,20,10);
/*HR:BV-DBV*/ noStroke(); fill(38,60,68, mouseX); rect(390,385,20,10);
/*HR:DBV->BV BG*/ noStroke(); fill(38,60,68); rect(395,395,10,10);
/*HR:DBV->BV*/ noStroke(); fill(93,145,165, mouseX); rect(395,395,10,10);

/*VR:LV->DLV BG*/ noStroke(); fill(93,145,165); rect(385,405,10,30);
/*VR:LV->DLV*/ noStroke(); fill(38,60,68,mouseY); rect(385,405,10,30);

/*----------Other Content------------*/

/*Bubble*/ noStroke(); fill(mouseX/2,mouseY/2,5,50);ellipse (mouseX,mouseY,mouseY,mouseX);

}/*closing 'void draw'*/

/*-------------------------------------------*/ void mousePressed() {
//-------------Generals--------------//
smooth();

//------------Content----------------//
background(mouseX,mouseY,mouseX);

}/*closing 'mousePressed'*/

/*-------------------------------------------*/ void keyPressed() {
//-------------Generals--------------//
smooth();

//------------Content----------------//
background(mouseY,mouseX,mouseY);

}/*closing 'mousePressed'*/

