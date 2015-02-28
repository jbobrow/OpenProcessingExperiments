
void setup(){ 
  background(255);
  size(327,453);
}
void draw(){
  polera();
  cara();
  ojom();

  
  beginShape();
  fill(0);
  smooth();
  
curveVertex(55,186);
curveVertex(37,175);
curveVertex(20,161);
curveVertex(33,184);
curveVertex(16,163);
curveVertex(8,133);
curveVertex(6,92);
curveVertex(22,48);
curveVertex(46,17);
curveVertex(77,0);
curveVertex(141,0);
curveVertex(239,2);
curveVertex(275,49);
curveVertex(294,83);
curveVertex(295,129);
curveVertex(281,184);
curveVertex(294,206);
curveVertex(287,206);
curveVertex(290,223);
curveVertex(280,225);
curveVertex(264,215);
curveVertex(249,196);
curveVertex(268,185);
curveVertex(278,169);
curveVertex(282,138);
curveVertex(277,143);
curveVertex(268,129);
curveVertex(259,128);
curveVertex(253,135);
curveVertex(261,141);
curveVertex(263,145);
curveVertex(249,139);
curveVertex(246,148);
curveVertex(254,175);
curveVertex(242,165);
curveVertex(247,191);
curveVertex(239,227);
curveVertex(229,256);
curveVertex(206,291);
curveVertex(169,318);
curveVertex(182,336);
curveVertex(176,336);
curveVertex(158,322);
curveVertex(143,326);
curveVertex(128,329);
curveVertex(102,328);
curveVertex(96,318);
curveVertex(96,298);
curveVertex(114,309);
curveVertex(136,306);
curveVertex(150,307);
curveVertex(171,298);
curveVertex(200,265);
curveVertex(221,227);
curveVertex(218,183);
curveVertex(225,161);
curveVertex(214,130);
curveVertex(197,117);
curveVertex(202,138);
curveVertex(216,159);
curveVertex(212,180);
curveVertex(198,165);
curveVertex(188,158);
curveVertex(165,156);
curveVertex(150,153);
curveVertex(139,159);
curveVertex(132,150);
curveVertex(124,153);
curveVertex(119,158);
curveVertex(122,152);
curveVertex(129,146);
curveVertex(142,144);
curveVertex(137,134);
curveVertex(126,133);
curveVertex(101,140);
curveVertex(95,134);
curveVertex(110,129);
curveVertex(123,124);
curveVertex(134,124);
curveVertex(134,109);
curveVertex(104,73);
curveVertex(73,69);
curveVertex(61,64);
curveVertex(48,69);
curveVertex(40,94);
curveVertex(38,123);
curveVertex(39,136);
curveVertex(42,142);
curveVertex(59,144);
curveVertex(73,151);
curveVertex(75,169);
curveVertex(70,188);
curveVertex(69,172);
curveVertex(63,173);
curveVertex(57,162);
curveVertex(52,168);
curveVertex(53,177);
curveVertex(43,165);
curveVertex(52,156);
curveVertex(42,155);
curveVertex(42,165);
curveVertex(56,184);
curveVertex(36,175);
curveVertex(20,180); 





 endShape(CLOSE);

 }
 
void polera(){
  beginShape();
  fill(0);
  smooth();

curveVertex(172,339);
curveVertex(181,339);
curveVertex(193,337);
curveVertex(224,319);
curveVertex(265,296);
curveVertex(293,257);
curveVertex(313,242);
curveVertex(326,248);
curveVertex(325,452);
curveVertex(138,472);
curveVertex(158,377);
curveVertex(165,360);
curveVertex(173,349);
curveVertex(170,341);
curveVertex(172,337);
curveVertex(185,339);





   endShape(CLOSE);

}


void cara(){
  beginShape();
  fill(0);
  smooth();

curveVertex(115,230);
curveVertex(96,227);
curveVertex(90,229);
curveVertex(90,231);
curveVertex(84,231);
curveVertex(72,228);
curveVertex(67,225);
curveVertex(65,220);
curveVertex(66,213);
curveVertex(60,213);
curveVertex(56,205);
curveVertex(53,197);
curveVertex(54,188);
curveVertex(56,184);
curveVertex(53,180);
curveVertex(41,163);
curveVertex(45,188);
curveVertex(47,205);
curveVertex(54,223);
curveVertex(62,240);
curveVertex(69,258);
curveVertex(77,271);
curveVertex(81,283);
curveVertex(89,300);
curveVertex(101,309);
curveVertex(117,312);
curveVertex(99,297);
curveVertex(99,288);
curveVertex(107,285);
curveVertex(118,283);
curveVertex(96,283);
curveVertex(85,275);
curveVertex(83,271);
curveVertex(86,264);
curveVertex(95,267);
curveVertex(107,265);
curveVertex(111,263);
curveVertex(124,263);
curveVertex(139,262);
curveVertex(110,261);
curveVertex(103,265);
curveVertex(94,265);
curveVertex(86,256);
curveVertex(76,255);
curveVertex(70,241);
curveVertex(71,230);
curveVertex(83,241);
curveVertex(85,236);
curveVertex(90,234);
curveVertex(94,231);
curveVertex(103,230);
curveVertex(113,231);




endShape(CLOSE);

}

void ojom(){
  beginShape();
  fill(0);
  smooth();

curveVertex(134,150);
curveVertex(144,155);
curveVertex(138,160);
curveVertex(144,159); 
curveVertex(151,154);
curveVertex(149,145);
curveVertex(138,146);
curveVertex(134,147); 

endShape(CLOSE);

}

void mousePressed(){
  println(mouseX +","+ mouseY);
}
void keyPressed(){
  saveFrame("autoretrato_bernardo.jpg");
  println("fotograma grabado");
}



