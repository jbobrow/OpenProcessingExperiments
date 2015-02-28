
size(640,480);
smooth();
background(255,255,255);

//blue background
noStroke();
fill(20,40,110);
ellipse(800,-200,1500,900);

//parralel lines
stroke(1);
fill(255,255,255);
beginShape();
vertex(80,480);
vertex(349,0);
vertex(399,0);
vertex(130,480);
endShape(CLOSE);

//bigshape (red)
//globals
int x=270;
int y=200;
float slope=(308-447)/(261-274);

fill(200,0,20);
noStroke();

beginShape();
vertex(x,y);
vertex(265,265);
vertex(279,265);
vertex(282,266);
vertex(284,260);
vertex(292,260);
vertex(292,263);
vertex(308,265);
vertex(309,261);
vertex(448,274);//end long bottom edge
vertex(447,286);
vertex(519,294);
vertex(519,298);
vertex(495,298);
vertex(494,307);
vertex(532,310);
vertex(532,307);
vertex(546,307);
vertex(547,297);
vertex(555,297);
vertex(556,278);
vertex(581,281);
vertex(585,238);
vertex(593,238);
vertex(596,192);//top right corner
vertex(567,189);
vertex(564,200);
vertex(546,200);
vertex(545,190);
vertex(509,187);
vertex(509,194);
vertex(502,193);
vertex(502,185);
vertex(494,185);
vertex(492,191);
vertex(484,191);
vertex(482,209);
vertex(445,205);
vertex(445,213);//halfway top
vertex(402,211);

vertex(401,225);
vertex(288,214);
vertex(290,200);
vertex(270,200);
endShape(CLOSE);

//big shape (black)
fill(0,0,0);

float x2=155;
float y2=175;
float xtrans=x2-x;
float ytrans=x2-x;

pushMatrix();
translate(140,-150);
rotate(radians(55));

beginShape();
vertex(270,200);
vertex(265,265);
vertex(279,265);
vertex(282,266);
vertex(284,260);
vertex(292,260);
vertex(292,263);
vertex(308,265);
vertex(309,261);
vertex(448,274);//end long bottom edge
vertex(447,286);
vertex(519,294);
vertex(519,298);
vertex(495,298);
vertex(494,307);
vertex(532,310);
vertex(532,307);
vertex(546,307);
vertex(547,297);
vertex(555,297);
vertex(556,278);
vertex(581,281);
vertex(585,238);
vertex(593,238);
vertex(596,192);//top right corner
vertex(567,189);
vertex(564,200);
vertex(546,200);
vertex(545,190);
vertex(509,187);
vertex(509,194);
vertex(502,193);
vertex(502,185);
vertex(494,185);
vertex(492,191);
vertex(484,191);
vertex(482,209);
vertex(445,205);
vertex(445,213);//halfway top
vertex(402,211);
vertex(401,225);
vertex(288,214);
vertex(290,200);
vertex(270,200);
endShape(CLOSE);
popMatrix();



//white outline
fill(255,255,255);
stroke(1);
beginShape();//stem
vertex(423,28);
vertex(466,48);
vertex(490,0);
vertex(440,0);
endShape(CLOSE);

beginShape();//topstopper
vertex(408,35);
vertex(465,68);
vertex(474,51);
vertex(417,19);
endShape(CLOSE);


//decoration
beginShape();//outline
vertex(455,9);
vertex(484,25);
vertex(475,38);
vertex(446,24);
endShape(CLOSE);

beginShape();//bisector
vertex(457,30);
vertex(464,13);
vertex(467,14);
vertex(460,31);
endShape(CLOSE);

beginShape();//corner rec
vertex(473,19);
vertex(467,28);
vertex(477,34);
vertex(484,25);
endShape(CLOSE);


pushMatrix ();
rotate(radians(90));
translate(-20,-650);


//bottomrihgt
fill(0,0,0);
stroke(0);
beginShape();//stem
vertex(423,28);
vertex(466,48);
vertex(490,0);
vertex(440,0);
endShape(CLOSE);

fill(63,83,124);
beginShape();//topstopper
vertex(408,35);
vertex(465,68);
vertex(474,51);
vertex(417,19);
endShape(CLOSE);


//decoration
fill(200,17,31);
beginShape();//outline
vertex(455,9);
vertex(484,25);
vertex(475,38);
vertex(446,24);
endShape(CLOSE);

fill(161,89,129);
beginShape();//bisector
vertex(457,30);
vertex(464,13);
vertex(467,14);
vertex(460,31);
endShape(CLOSE);

fill(63,83,124);
beginShape();//corner rec
vertex(473,19);
vertex(467,28);
vertex(477,34);
vertex(484,25);
endShape(CLOSE);

popMatrix();


////////////top left/////////////////////

pushMatrix ();
translate(525,50);
rotate(radians(180));



fill(63,83,124);
stroke(0);
beginShape();//stem
vertex(423,28);
vertex(455,49);
vertex(550,-70);
vertex(540,-120);
endShape(CLOSE);

fill(0,0,0);
beginShape();//topstopper
vertex(408,35);
vertex(465,68);
vertex(474,51);
vertex(417,19);
endShape(CLOSE);


//decoration
fill(0,0,0);
beginShape();//outline
vertex(455,9);
vertex(484,25);
vertex(475,38);
vertex(446,24);
endShape(CLOSE);

fill(255,255,255);
beginShape();//bisector
vertex(457,30);
vertex(464,13);
vertex(467,14);
vertex(460,31);
endShape(CLOSE);

fill(205,0,2);
beginShape();//corner rec
vertex(473,19);
vertex(467,28);
vertex(477,34);
vertex(484,25);
endShape(CLOSE);


popMatrix();

fill(255,255,255);
stroke(0);
beginShape();//white side piece 
vertex(0,150);
vertex(30,110);
vertex(40,124);
vertex(0,180);
endShape(CLOSE);

//////end top left////


noStroke(); 

fill(141,155,200);
beginShape();//blue rec
vertex(82,412);
vertex(140,385);
vertex(148,403);
vertex(90,430);
endShape(CLOSE);


fill(0,0,0);
beginShape();//blacksquare
vertex(48,425);
vertex(64,425);
vertex(64,445);
vertex(48,445);
endShape(CLOSE);

stroke(208,0,23);
line(59,434,68,434);
noStroke();



//blackdeco
beginShape();
vertex(66,351);
vertex(77,364);
vertex(54,385);
vertex(42,371);
endShape(CLOSE);

fill(141,155,200);
beginShape();//little blue
vertex(44,379);
vertex(56,369);
vertex(63,377);
vertex(54,385);
endShape(CLOSE);

fill(200,0,20);
//red bisector
beginShape();
vertex(56,360);
vertex(59,357);
vertex(70,370);
vertex(67,373);
endShape(CLOSE);
//////////////////////end black deco/////////
fill(208,0,23);
rect(22,320,24,78);//red rect

///////////////////blue blob//////

pushMatrix();
rotate(radians(50));
translate(0,130);
fill(141,155,200);
rect(200,0,40,50);
fill(69,100,146);
rect(205,15,20,70);
fill(59,76,102);
rect(200,10,10,70);
fill(19,21,46);
rect(190,15,10,70);
rect(140,0,40,70);
fill(59,76,102);
rect(150,15,40,70);
popMatrix();

///////////////////end blue blob////////


//////3d////////////
fill(0);//black face
beginShape();
vertex(335,0);
vertex(372,21);
vertex(372,78);
vertex(335,60);
endShape(CLOSE);

fill(116,143,164);
beginShape();
vertex(335,0);
vertex(372,21);
vertex(386,0);
endShape(CLOSE);



//darkblue side
fill(19,21,46);
beginShape();
vertex(372,21);
vertex(385,0);
vertex(420,0);
vertex(372,78);
endShape();

//red front
fill(169,17,14);
beginShape();
vertex(323,20);
vertex(317,33);
vertex(376,65);
vertex(383,52);
endShape();

