
/* Alfons Echegaray
Informàtica Grup 02 2n GEDI
*/

size(1500,500); 
background(0); 


//vinocles//
fill(0,0,255); 
stroke(0); 

ellipse(500,250,410,410);

ellipse(1000,250,410,410);

//cel//
fill(#05ABEA);
  stroke(0);
  arc(500,250,410,410, -PI, 0);
  arc(1000,250,410,410, -PI, 0);
  
//nubols//
noStroke();
fill(#868690);
bezier(470, 150, 500, 135, 550,135,625,150);
bezier(470, 150, 500, 180, 550,165,625,150);
fill(#9999A5);
bezier(530, 145, 560, 140, 590,135,620,140);
bezier(530, 145, 560, 155, 590,160,620,140);

fill(#868690);
bezier(970, 150, 1000, 135, 1050,135,1125,150);
bezier(970, 150, 1000, 180, 1060,165,1130,150);
fill(#9999A5);
bezier(830, 165, 860, 155, 920,160,950,175);
bezier(830, 165, 860, 185, 910,180,950,175);

//barcos esquerra//

stroke(0);
fill(255,255,255);

bezier(550, 275, 565, 265, 555,240,555,220);
bezier(560, 270, 575, 260, 565,235,565,215);
bezier(540, 280, 555, 270, 545,245,545,225);
bezier(660, 355, 680, 340,665,280,665,250);

//barcos dreta//

bezier(1160, 270, 1175, 260, 1165,235,1165,215);
bezier(1040, 395, 1060, 370,1055,330,1045,300);
bezier(1060, 395, 1080, 380,1065,330,1065,300);

fill(#FC0324);
bezier(1000, 345, 970, 325,965,310,1005,280);
fill(255,255,255);
bezier(1000, 355, 1030, 350,1015,300,1005,265);
//boia proxima//

fill(#0604B4);
stroke(0);
ellipse(1120,400,30,20);



fill(#D15502);


beginShape();
vertex(1130,400);
vertex(1130,370);
vertex(1110,370);
vertex(1110,400);
// etc;
endShape();


ellipse(1120,370,20,10);

noStroke();
ellipse(1120,400,20,10);

fill(#0604B4);
noStroke();
ellipse(615,265,15,8);


//boies llunyanes//

fill(#D15502);
stroke(255);

beginShape();
vertex(620,255);
vertex(620,265);
vertex(610,265);
vertex(610,255);
// etc;
endShape();


ellipse(615,255,10,5);

noStroke();
ellipse(615,265,10,5);

fill(#0604B4);
noStroke();
ellipse(915,265,15,8);

fill(#D15502);

stroke(255);
beginShape();
vertex(920,255);
vertex(920,265);
vertex(910,265);
vertex(910,255);
// etc;
endShape();


ellipse(915,255,10,5);

noStroke();
ellipse(915,265,10,5);


//gaviotes//


smooth();
  stroke(0);
  fill(255);
bezier(350,180,370,160,385,160,375,170);
bezier(375,170,390,155,405,160,420,165);

bezier(390,210,410,190,425,190,415,200);
bezier(415,200,420,190,435,195,450,190);


