
void setup() {
  size(400, 400);
  background(255, 255, 255);
  smooth();
}

void draw() {

  //shapes
  hat();
  mainHead();
  shape2();
  shape3();
  shape4();
  littleTeeth();
  ears();
  
  
  //Eyes
  int r = 45;
  noStroke();
  fill(83, 106, 59);
  ellipse(100, 100, r, r);
  ellipse(300, 100, r, r);
  ellipse(152, 136, r*.88, r*.88);
  ellipse(248, 136, r*.88, r*.88);
  fill(0);
  int r2 = 10;
  ellipse(152,136,r2,r2);
  ellipse(248,136,r2,r2);
  
  ellipse(100,100,r2,r2);
  ellipse(300,100,r2,r2);
}


// SHAPES //////////////
void mainHead() {
  fill(131, 255, 0, 50);
  noStroke();
  beginShape();
  curveVertex(200, 50);
  curveVertex(200, 50);
  curveVertex(117, 56);
  curveVertex(99, 100);
  curveVertex(107, 133);
  curveVertex(137, 201);
  curveVertex(200, 215);
  curveVertex(263, 201);
  curveVertex(293, 133);
  curveVertex(301, 100);
  curveVertex(283, 56);
  curveVertex(200, 50);
  curveVertex(200, 50);
  endShape();
}

void shape2() {
  fill(102, 211, 2, 50);
  noStroke();
  beginShape();
  curveVertex(200, 130);
  curveVertex(200, 130);
  curveVertex(154, 136);
  curveVertex(91, 174);
  curveVertex(94, 233);
  curveVertex(158, 283);
  curveVertex(200, 300);
  curveVertex(242, 283);
  curveVertex(305, 233);
  curveVertex(301, 174);
  curveVertex(246, 136);
  curveVertex(200, 130);
  curveVertex(200, 130);
  endShape();
}

void shape3() {
  fill(163, 247, 10, 50);
  noStroke();
  ellipse(200, 264, 100, 60);
}

void shape4() {
  fill(93, 165, 18, 50);
  noStroke();
  beginShape();
  curveVertex(157, 226);
  curveVertex(157, 226);
  curveVertex(135, 223);
  curveVertex(108, 245);
  curveVertex(82, 297);
  curveVertex(106, 349);
  curveVertex(142, 336);
  curveVertex(144, 303);
  curveVertex(133, 279);
  curveVertex(152, 239);
  curveVertex(157, 226);
  curveVertex(157, 226);
  endShape();

  beginShape();
  curveVertex(243, 226);
  curveVertex(243, 226);
  curveVertex(265, 223);
  curveVertex(292, 245);
  curveVertex(318, 297);
  curveVertex(294, 349);
  curveVertex(258, 336);
  curveVertex(256, 303);
  curveVertex(267, 279);
  curveVertex(248, 239);
  curveVertex(243, 226);
  curveVertex(243, 226);
  endShape();
}

void littleTeeth() {
  ellipse(200, 292, 10, 40);
  ellipse(169, 291, 10, 40);
  ellipse(231, 291, 10, 40);
}

void ears() {
  fill(129, 216, 37, 50);
  noStroke();

  beginShape();
  curveVertex(100, 174);
  curveVertex(100, 174);
  curveVertex(80, 139);
  curveVertex(43, 165); 
  curveVertex(64, 189);
  curveVertex(62, 229);
  curveVertex(27, 261);
  curveVertex(62, 271);
  curveVertex(94, 214);
  curveVertex(100, 174);
  curveVertex(100, 174);
  endShape();
  
    beginShape();
  curveVertex(300, 174);
  curveVertex(300, 174);
  curveVertex(340, 139);
  curveVertex(377, 165); 
  curveVertex(336, 189);
  curveVertex(338, 229);
  curveVertex(373, 261);
  curveVertex(338, 271);
  curveVertex(306, 214);
  curveVertex(300, 174);
  curveVertex(300, 174);
  endShape();
}

void hat(){
  fill(4,138,144,100);
  int numHats = 23;
  int xCoor = 70;
  int widthHat = 400;
  for(int i = 0; i < numHats; i++){
    ellipse(200,xCoor,widthHat,5);
    xCoor -=3;
    widthHat = int(widthHat*.88);
  }
}
