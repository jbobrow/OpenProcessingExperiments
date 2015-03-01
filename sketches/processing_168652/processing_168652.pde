
void setup() {
    size (500, 600);  
    background (0, 255, 255);
      
}  

void draw () {
  println (mouseX +  "," + mouseY);
  
  //cara
  stroke (0, 0, 0);
  fill (222, 138, 56);
  ellipse (250, 340, 350, 450);
  
  //orella esquerra
  stroke(0, 0, 0);
  fill(222, 138, 56);
  beginShape(); 
  curveVertex (77, 299);
  curveVertex (77, 299);
  curveVertex (55, 307);
  curveVertex (58, 358);
  curveVertex (78, 387);
  curveVertex (78, 387);
  endShape();
  //oida
  stroke(0);
  fill(222, 138, 56);
  arc(69, 345, 15, 15, PI+QUARTER_PI, TWO_PI);
  
  //orella dreta
  stroke(0, 0, 0);
  fill(222, 138, 56);
  beginShape();
  curveVertex (423,297);
  curveVertex (423, 297);
  curveVertex (443, 303);
  curveVertex (439, 357);
  curveVertex (422, 385);
  curveVertex (422, 385);
  endShape();
  //oida
  stroke(0);
  fill(222, 138, 56);
  arc(431, 344, 15, 15, PI+QUARTER_PI, TWO_PI);
  
  //ull esquerra
  stroke(0);
  fill(255, 255, 255);
  ellipse(182, 309, 73, 36);
  stroke(160,82,45 );
  fill(160,82,45 );
  ellipse(182,309, 25, 20);
  //pupila esquerra
  stroke(0);
  fill(0);
  ellipse(182, 309, 10, 10);
  //cella esquerra
  stroke(0);
  fill (0);
  rect(149, 274, 70, 7);
  triangle(204, 263, 203, 273, 218, 273);
  
  //ull dret
  stroke(0);
  fill(255, 255, 255);
  ellipse(325, 311, 73, 36);
  stroke(160,82,45 );
  fill(160,82,45 );
  ellipse(325, 311, 25, 20);
  //pupila dreta
  stroke(0);
  fill(0);
  ellipse(325, 311, 10, 10);
  //cella dreta
  stroke(0);
  fill(0);
  rect(288, 273, 70, 7);
  triangle(304, 264, 304, 273, 289, 273);
  
  //nas
  noFill();
  stroke(0);
  arc(259, 378, 60, 26, 0, PI, OPEN); 
  
  //boca
  stroke(0);
  fill(0);
  line(220, 458, 292, 461);
  
  //cabell
  stroke(0);
  fill(0);
  rect(135, 137, 210, 80);
  triangle(113, 137, 111, 226, 182, 198);
  triangle(131, 111, 117, 157, 156,155);
  triangle(135, 157,103, 175, 152, 190);
  triangle(196, 74, 177, 136, 220, 136);
  triangle(175, 98, 168, 138, 182, 134); 
  triangle(182, 104, 177, 125, 186,119);
  triangle(160, 82, 160, 140, 172, 138);
  triangle(146, 100, 139, 137, 154, 139);
  triangle(156, 114, 150, 140, 165, 138);
  triangle(131, 182, 100, 210, 139, 213);
  triangle(122, 163, 97, 203, 136, 203);
  triangle(104, 210, 88, 252, 128,203);
  triangle(88, 255, 80, 288, 92, 259);
  triangle(110, 226, 87, 254, 97, 263);
  triangle(221, 89, 208, 138, 232, 86);
  triangle(240, 62, 201, 135, 241, 143);
  triangle(239,74, 236, 119, 278, 124);
  triangle(270, 31, 268, 117, 309, 118);
  triangle(301, 11, 295, 121, 346, 124);
  rect(236, 114, 110, 30);
  triangle(354, 174, 340, 221, 371, 234);
  triangle(340, 136, 341, 200, 389, 199);
  triangle(254, 53, 255, 112, 273, 111);
  triangle(353, 138, 354, 160, 369, 168);
  triangle(339, 62, 340, 152, 369, 151);
  triangle(366, 178, 377, 216, 407, 220);
  triangle(370, 185, 387, 185, 391, 209);
  triangle(354, 137, 354, 161, 379, 152);
  triangle(361, 152, 364, 174, 388, 168);
  triangle(368, 168, 369, 189, 402, 186);
  triangle(383, 214, 397, 216, 411, 245);
  triangle(413, 248, 421, 288, 400, 248);
  triangle(380, 216, 399, 248, 413, 248);
  triangle(407, 242, 395, 239, 364, 188);
  triangle(358, 198, 383, 203, 390, 241);
  triangle(189, 194, 191, 224, 260, 179);
  triangle(108, 224, 132, 213, 117, 241);
  stroke (222, 138, 56);
  fill (222, 138, 56);
  triangle(307, 179, 296, 219, 314, 219);
  triangle(294, 216, 285, 186, 282, 224);
  triangle(294, 194, 285, 227, 307, 225);
  triangle(330, 193, 311, 217, 336, 220);
  triangle(343, 199, 334, 219, 378, 239);
  triangle(282, 217, 260, 180, 258, 224);
  triangle(201, 218, 260, 179, 259, 220);
  triangle(133, 219, 182, 193, 189, 219);
  
  
  
}  



