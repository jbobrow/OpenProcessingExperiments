
void mousePressed(){
println("vertex("+mouseX+", "+mouseY+");");
}
void setup(){ 
  background(255);
  size(300,400);
}

void draw (){
espacio1();
espacio2();
polera ();
pelo ();
ojo ();
nariz ();
boca ();
lunares ();
}


void espacio1(){
 beginShape();
 fill (14,201,140);
 smooth ();
vertex(300, 235);
vertex(225, 221);
vertex(235, 0);
vertex(300, 0);
endShape (CLOSE);
}

void espacio2(){
 beginShape();
 fill (14,137,201);
 smooth ();

vertex(0, 240);
vertex(55, 240);
vertex(56, 0);
vertex(0,0 );
endShape (CLOSE);
}

void polera () {
  beginShape();
  fill(222,40,40);
  smooth();

vertex(10, 238);
vertex(69, 201);
vertex(76, 211);
vertex(96, 229);
vertex(107, 234);
vertex(126, 252);
vertex(142, 260);
vertex(155, 260);
vertex(164, 257);
vertex(178, 254);
vertex(194, 238);
vertex(203, 221);
vertex(212, 210);
vertex(217, 202);
vertex(220, 193);
vertex(238, 191);
vertex(248, 193);
vertex(269, 206);
vertex(283, 213);
vertex(300, 219);
vertex(300, 400);
vertex(0, 400);
vertex(0, 239);

 endShape(CLOSE);
}

void pelo(){
  beginShape();
  fill(0);
  smooth();
vertex (206,87);
vertex(203, 86);
vertex(201, 94);
vertex(203, 100);
vertex(193, 104);
vertex(185, 107);
vertex(188, 103);
vertex(186, 100);
vertex(182, 105);
vertex(176, 105);
vertex(168, 100);
vertex(164, 104);
vertex(168, 107);
vertex(162, 107);
vertex(158, 108);
vertex(156, 103);
vertex(150, 107);
vertex(149, 103);
vertex(152, 101);
vertex(150, 96);
vertex(150, 91);
vertex(165, 80);
vertex(175, 76);
vertex(180, 74);
vertex(188, 27);
curveVertex(57, 79);
curveVertex(55, 83);
curveVertex(69, 185);
curveVertex(63, 186);
curveVertex(68, 197);
curveVertex(55, 206);
curveVertex(55, 190);
curveVertex(50, 166);
curveVertex(41, 145);
curveVertex(29, 125);
curveVertex(18, 102);
curveVertex(11, 76);
curveVertex(11, 56);
vertex(6, 40);
vertex(15, 25);
vertex(22, 1);
vertex(22, 0);
vertex(234, 0);
vertex(235, 11);
vertex(236, 11);
vertex(241, 25);
vertex(242, 37);
vertex(240, 55);
vertex(240, 85);
vertex(241, 103);
vertex(236, 118);
vertex(234, 131);
vertex(233, 147);
curveVertex(234, 164);
curveVertex(243, 179);
curveVertex(242, 178);
curveVertex(222, 192);
curveVertex(225, 180);
curveVertex(219, 159);
curveVertex(223, 115);
curveVertex(217, 78);
curveVertex(197, 80);
endShape (CLOSE);
}

void ojo () {
  beginShape();
  fill(0);
  smooth();

curveVertex(63, 99);
curveVertex(65, 98);
curveVertex(75, 97);
curveVertex(93, 98);
curveVertex(94, 94);
curveVertex(97, 96);
curveVertex(100, 93);
curveVertex(105, 97);
curveVertex(110, 98);
curveVertex(114, 108);
curveVertex(117, 113);
curveVertex(117, 120);
curveVertex(114, 122);
curveVertex(114, 118);
curveVertex(111, 115);
curveVertex(110, 116);
curveVertex(101, 117);
curveVertex(97, 119);
curveVertex(100, 115);
curveVertex(98, 114);
curveVertex(97, 117);
curveVertex(96, 121);
curveVertex(95, 122);
curveVertex(93, 122);
curveVertex(92, 121);
curveVertex(87, 125);
curveVertex(83, 124);
curveVertex(83, 120);
curveVertex(79, 119);
curveVertex(79, 117);
curveVertex(75, 122);
curveVertex(78, 124);
curveVertex(78, 121);
curveVertex(85, 123);
curveVertex(85, 128);
curveVertex(81, 126);
curveVertex(77, 125);
curveVertex(69, 123);
curveVertex(66, 123);
curveVertex(70, 118);
curveVertex(75, 112);
curveVertex(72, 113);
curveVertex(69, 113);
curveVertex(67, 112);
curveVertex(68, 111);
curveVertex(74, 110);
curveVertex(73, 108);
curveVertex(66, 106);
curveVertex(60, 103);


endShape (CLOSE);
}

void nariz () {
  beginShape();
  fill(0);
  smooth();
vertex(123, 178);
vertex(131, 181);
vertex(142, 181);
vertex(155, 173);
vertex(166, 172);
vertex(167, 173);
vertex(159, 179);
vertex(155, 179);
vertex(146, 186);
vertex(135, 186);
vertex(117, 184);
vertex(118, 181);
vertex(123, 179);
endShape (CLOSE);
}

void boca () {
  beginShape();
  fill(0);
  smooth();
vertex(114, 207);
vertex(138, 205);
curveVertex(148, 205);
vertex(158, 201);
vertex(171, 201);
vertex(183, 198);
vertex(174, 203);
vertex(167, 207);
curveVertex(145, 215);
curveVertex(130, 212);
vertex(116, 212);
vertex(111, 209);

endShape (CLOSE);
}


void lunares (){
  fill (0);
  smooth ();
  
 ellipse (209,170, 3,3);
 ellipse (205, 183, 2, 2); 
 ellipse (217, 191, 2,2);
 ellipse (93, 192, 3, 3);
}

