
color ojos = color(39, 97, 216);
void setup() 
{ 
  smooth();
  size(502,404);
  background(255,255,255);
strokeWeight(3);

} 




void draw()
{
  background(255,255,255);
  //println(mouseX,'+',mouseY);
  arc(284, 115, 60, 70, PI+QUARTER_PI, TWO_PI-QUARTER_PI);
//CUELLO
stroke(0,0,0);
arc(391, 243, 100, 50, PI+HALF_PI, TWO_PI+QUARTER_PI);
arc(391, 245, 100, 50, PI+HALF_PI, TWO_PI+QUARTER_PI);
//nariz
point(221,143);
arc(215, 109, 44, 67, PI+HALF_PI, TWO_PI+QUARTER_PI);
arc(230, 121, 23, 70, HALF_PI, PI-QUARTER_PI);
//boca
point(235,178);
//oreja
//point(410,125);
line(405,126,410,130);
line(410,130,415,137);

line(403,128,410,135);
line(410,135,410,140);
line(410,140,407,150);
line(407,150,400,160);
line(400,160,397,162);

line(383,163,390,164);


line(375,163,374,161);
//cara
line(219,82,222,93);
noFill();

//arc(212, 119, 44, 67, 0, QUARTER_PI);
line(232,161,231,175);
line(231,175,253,184);

line(233,176,233,180);
//line(233,183,234,183);

line(235,182,254,222);
line(254,222,264,225);

line(264,225,284,224);
line(284,224,296,221);
line(296,221,313,218);
line(313,218,328,212);
line(328,212,343,205);
line(238,154,243,156);

line(480,53,502 + mouseX/25,73);
line(457,104,502 + mouseX/25,117);
//cejas
line(220,74,224,78);

//arc(388, 141, 56, 75, 0, QUARTER_PI);
arc(388,140,56,75,0,HALF_PI);
arc(445, 160, 120, 60, PI, PI+QUARTER_PI);
//arc(382, 142, 23, 70, 0, HALF_PI, PI);

//oreja
arc(385, 142, 23, 70, HALF_PI, PI-QUARTER_PI);

//arc(50, 55, 70, 70, PI, PI+HALF_PI+HALF_PI+HALF_PI+HALF_PI-HALF_PI-HALF_PI-HALF_PI);
//arc(50, 55, 80, 80, PI+QUARTER_PI, TWO_PI+QUARTER_PI);
arc(293, 263, 80, 80, PI+HALF_PI, PI+PI);

//strokeWeight(2);
//ojo
//if(mousePressed){
fill(ojos);
//}
//else{
//fill(0,0,0);
//}
ellipse(284,113,16,26);
fill(0,0,0);
ellipse(280,118,5,5);
fill(255, 255, 255);
noStroke();
ellipse(292,110,5,5);
stroke(0,0,0);
//ojo



fill(ojos);
ellipse(230,109,8,23);
fill(0,0,0);
ellipse(229,114,4,6);

//linea nariz
line(230,132,222,141);
//line(230,135,222,142);
line(232,158,238,161);

/*line(222,92,217,101);
line(223,93,218,101);
line(224,94,219,101);
*/
line(225,92,220,101);
line(226,93,221,101);
line(227,94,222,101);

line(228,92,223,100);
line(229,93,224,100);
line(230,94,225,100);

line(271,100,282,98);

triangle(272,100,270,110,282,99);

line(282,98,299,105);
line(299,105,307,112);

line(282,98,299,105);
line(307,112,299,120);

line(299,120,289,125);
triangle(280,125,275,122,275,123);

line(228,123,227,133);

//pelo
line(86 + mouseX/25,14,136,0);
line(86 + mouseX/25,14,234,24);
fill(255,0,0);


line(202,23,132 + mouseX/25,81);
line(226,38,132 + mouseX/25,81);

line(140 + mouseX/25,90,199,50);
line(140 + mouseX/25,90,196,88);

line(149 + mouseX/25,100,196,89);
line(149 + mouseX/25,100,207,112);

line(207,112,171 + mouseX/25,144);
line(215,123,171 + mouseX/25,144);

line(215,123,191 + mouseX/25,190);
line(221,153,191 + mouseX/25,190);

line(226,38,188 + mouseX/25,117);
line(256,39,188 + mouseX/25,117);

line(256,38,233 + mouseX/25,120);
line(291,25,233 + mouseX/25,120);

line(291,26,256 + mouseX/25,110);
line(309,39,256 + mouseX/25,110);

line(309,39,310 + mouseX/25,163);
line(350,45,310 + mouseX/25,163);



line(352,67,322 + mouseX/25,187);
line(364,103,322 + mouseX/25,187);

line(364,103,340 + mouseX/25,233);
line(391,117,340 + mouseX/25,233);

line(391,117,380 + mouseX/25,159);
line(413,116,380 + mouseX/25,159);

line(413,116,437 + mouseX/25,177);
line(432,111,437 + mouseX/25,177);

line(432,111,458 + mouseX/25,141);
line(447,89,458 + mouseX/25,141);


//no tocar
line(465,0,502 + mouseX/25,46);
line(502 + mouseX/25,139,468,147);



line(468,147,497 + mouseX/35,185);
line(451,168,497 + mouseX/35,185);



line(451,168,454 + mouseX/25,214);
line(429,179,454 + mouseX/25,214);

line(429,179,414 + mouseX/25,220);
line(407,183,414 + mouseX/25,220);

line(407,183,394 + mouseX/25,235);
line(385,212,394 + mouseX/25,235);

line(397,195,362 + mouseX/25,240);
line(371,202,362 + mouseX/25,240);

fill(255,255,255);
noStroke();
//triangle(387,212,394,235,397,199);
stroke(0,0,0);



line(385,182,356 + mouseX/25,219);
line(356 + mouseX/25,219,373,176);



//pelo
//line(352,128,355,156);
line(337,86,341,108);
line(367,188,366,177);



if (mousePressed) {
  background(0,0,0);
  ojos = color(255,255,0);

//empieza el blanco
//fill(0,0,0);
noFill();
stroke(255,255,255);
  arc(284, 115, 60, 70, PI+QUARTER_PI, TWO_PI-QUARTER_PI);
//CUELLO
stroke(255,255,255);
//fill(0,0,0);
noFill();
arc(391, 243, 100, 50, PI+HALF_PI, TWO_PI+QUARTER_PI);
arc(391, 245, 100, 50, PI+HALF_PI, TWO_PI+QUARTER_PI);
//nariz
point(221,143);
//fill(0,0,0);
noFill();
arc(215, 109, 44, 67, PI+HALF_PI, TWO_PI+QUARTER_PI);
arc(230, 121, 23, 70, HALF_PI, PI-QUARTER_PI);
//boca
point(235,178);
//oreja
//point(410,125);
//fill(255,255,255);
noFill();
stroke(255,255,255);
//noStroke();
line(405,126,410,130);
line(410,130,415,137);
line(403,128,410,135);
line(410,135,410,140);
line(410,140,407,150);
line(407,150,400,160);
line(400,160,397,162);
stroke(255,255,255);
line(383,163,390,164);
line(375,163,374,161);
//cara
stroke(255,255,255);
line(219,82,222,93);
noFill();

//arc(212, 119, 44, 67, 0, QUARTER_PI);
stroke(255,255,255);
line(232,161,231,175);
line(231,175,253,184);
line(233,176,233,180);
//line(233,183,234,183);
stroke(255,255,255);
line(235,182,254,222);
line(254,222,264,225);
stroke(255,255,255);
line(264,225,284,224);
line(284,224,296,221);
line(296,221,313,218);
line(313,218,328,212);
line(328,212,343,205);
line(238,154,243,156);
stroke(255,255,255);
line(480,53,502 + mouseX/25,73);
line(457,104,502 + mouseX/25,117);
//cejas
//fill(0,0,0);
noFill();
stroke(255,255,255);
line(220,74,224,78);

//arc(388, 141, 56, 75, 0, QUARTER_PI);
//fill(0,0,0);
noFill();
stroke(255,255,255);
arc(388,140,56,75,0,HALF_PI);
arc(445, 160, 120, 60, PI, PI+QUARTER_PI);
//arc(382, 142, 23, 70, 0, HALF_PI, PI);

//oreja
stroke(255,255,255);
arc(385, 142, 23, 70, HALF_PI, PI-QUARTER_PI);

//arc(50, 55, 70, 70, PI, PI+HALF_PI+HALF_PI+HALF_PI+HALF_PI-HALF_PI-HALF_PI-HALF_PI);
//arc(50, 55, 80, 80, PI+QUARTER_PI, TWO_PI+QUARTER_PI);
stroke(255,255,255);
arc(293, 263, 80, 80, PI+HALF_PI, PI+PI);


fill(255,255,0);
//stroke(0,0,0);
ellipse(284,113,16,26);
fill(0,0,0);
stroke(0,0,0);
ellipse(280,118,5,5);
//fill(255, 255, 0);
stroke(255,255,255);
//ellipse(292,110,5,5);
stroke(255,255,255);

fill(ojos);
ellipse(230,109,8,23);
fill(0,0,0);
stroke(0,0,0);
ellipse(229,114,4,6);
stroke(255,255,255);

//linea nariz
line(230,132,222,141);
//line(230,135,222,142);
line(232,158,238,161);

/*line(222,92,217,101);
line(223,93,218,101);
line(224,94,219,101);
*/
line(225,92,220,101);
line(226,93,221,101);
line(227,94,222,101);

line(228,92,223,100);
line(229,93,224,100);
line(230,94,225,100);

line(271,100,282,98);
fill(255,255,255);
triangle(272,100,270,110,282,99);

line(282,98,299,105);
line(299,105,307,112);

line(282,98,299,105);
line(307,112,299,120);

line(299,120,289,125);
triangle(280,125,275,122,275,123);

line(228,123,227,133);

//pelo
stroke(255,255,255);
line(86 + mouseX/25,14,136,0);
line(86 + mouseX/25,14,234,24);
stroke(255,255,255);

stroke(255,255,255);
line(202,23,132 + mouseX/25,81);
line(226,38,132 + mouseX/25,81);
stroke(255,255,255);
line(140 + mouseX/25,90,199,50);
line(140 + mouseX/25,90,196,88);
stroke(255,255,255);
line(149 + mouseX/25,100,196,89);
line(149 + mouseX/25,100,207,112);

line(207,112,171 + mouseX/25,144);
line(215,123,171 + mouseX/25,144);

line(215,123,191 + mouseX/25,190);
line(221,153,191 + mouseX/25,190);

line(226,38,188 + mouseX/25,117);
line(256,39,188 + mouseX/25,117);

line(256,38,233 + mouseX/25,120);
line(291,25,233 + mouseX/25,120);

line(291,26,256 + mouseX/25,110);
line(309,39,256 + mouseX/25,110);

line(309,39,310 + mouseX/25,163);
line(350,45,310 + mouseX/25,163);



line(352,67,322 + mouseX/25,187);
line(364,103,322 + mouseX/25,187);

line(364,103,340 + mouseX/25,233);
line(391,117,340 + mouseX/25,233);

line(391,117,380 + mouseX/25,159);
line(413,116,380 + mouseX/25,159);

line(413,116,437 + mouseX/25,177);
line(432,111,437 + mouseX/25,177);

line(432,111,458 + mouseX/25,141);
line(447,89,458 + mouseX/25,141);


//no tocar
line(465,0,502 + mouseX/25,46);
line(502 + mouseX/25,139,468,147);



line(468,147,497 + mouseX/35,185);
line(451,168,497 + mouseX/35,185);



line(451,168,454 + mouseX/25,214);
line(429,179,454 + mouseX/25,214);

line(429,179,414 + mouseX/25,220);
line(407,183,414 + mouseX/25,220);

line(407,183,394 + mouseX/25,235);
line(385,212,394 + mouseX/25,235);

line(397,195,362 + mouseX/25,240);
line(371,202,362 + mouseX/25,240);

fill(255,255,255);

//triangle(387,212,394,235,397,199);
stroke(0,0,0);


stroke(255,255,255);
line(385,182,356 + mouseX/25,219);
line(356 + mouseX/25,219,373,176);



//pelo
//line(352,128,355,156);
line(337,86,341,108);
line(367,188,366,177);

}

}

void mouseReleased(){
   ojos = color(39, 97, 216);

}





