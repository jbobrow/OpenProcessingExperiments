
void setup() {
  size(480, 480);
  background(138, 205, 245);
  smooth();
}

void draw() {

  noStroke();
  fill(137, 77, 66);
  quad(150, 330, 325, 330, 333, 400, 145, 425);
  //top of neck
  noStroke();
  fill(230, 193, 169);
  quad(333, 399, 145, 424, 143, 460, 340, 460);
  triangle(143, 460, 340, 460, 250, 500);
  //rest of neck

  

  noStroke();
  fill(230, 193, 169);
  quad(115, 150, 365, 150, 310, 390, 165, 390);
  //general plane of front of face

  noStroke();
  fill(137, 77, 66);
  triangle(170, 390, 150, 330, 147, 390);
  triangle(165, 390, 185, 390, 149, 340);
  //left jaw
  triangle(305, 390, 324, 330, 330, 390);
  triangle(306, 390, 292, 390, 324, 340);
  //right jaw

  noStroke();
  fill(209, 151, 141);
  quad(202, 350, 242, 350, 242, 345, 237, 340);
  quad(242, 350, 242, 345, 247, 340, 282, 350);
  triangle(225, 350, 238, 353, 251, 350);
  //top lip
  noStroke();
  fill(252, 183, 179);
  quad(202, 350, 219, 360, 259, 360, 282, 350);
  //bottom lip

  noStroke();
  fill(214, 165, 140);
  triangle(245, 320, 248, 210, 265, 305);
  //shadow on nose
  noFill();
  stroke(113, 87, 74);
  strokeWeight(2);
  curve(200, 318, 220, 308, 230, 313, 235, 330); 
  //left nose hole
  curve(275, 325, 255, 313, 264, 307, 245, 330);
  //right nose hole
  stroke(113, 87, 74, 90);
  curve(225, 318, 210, 305, 213, 313, 230, 300);
  //left nostril
  curve(255, 318, 274, 304, 270, 313, 250, 300);
  //right nostril

  noStroke();
  fill(255, 255, 255);
  ellipse(185, 229, 50, 25);
  //left eyeball
  ellipse(295, 229, 50, 25);
  //right eyeball

  fill(88, 59, 45);
  ellipse(185, 228, 20, 20);
  fill(124, 84, 64);
  ellipse(185, 228, 16, 16);
  //left iris
  fill(88, 59, 45);
  ellipse(295, 228, 20, 20);
  fill(124, 84, 64);
  ellipse(295, 228, 16, 16);
  //right iris

  fill(0, 0, 0);
  ellipse(185, 228, 8, 8);
  //left pupil
  ellipse(295, 228, 8, 8);
  //right pupil

  noStroke();
  fill(175, 115, 85);
  quad(185, 217, 213, 226, 188, 211, 160, 222);
  //left eyelid
  quad(268, 226, 295, 217, 323, 224, 295, 211);
  //right eyelid

  stroke(70, 49, 38);
  strokeWeight(7);
  strokeJoin(ROUND);
  noFill();
  curve(240, 239, 220, 205, 160, 192, 140, 260);
  //left eyebrow
  arc(295, 216, 70, 55, PI+(PI/4), TWO_PI-(PI/4));
  //right eyebrow

  noStroke();
  fill(230, 193, 169);
  quad(128, 200, 108, 222, 125, 278, 144, 285);
  //left ear
  quad(350, 200, 367, 222, 350, 278, 330, 285);
  //right ear

  fill(70, 49, 38);
  noStroke();
  //quad(114, 145, 124, 200, 140, 205, 135, 147);
  beginShape();
  vertex(114, 150);
  vertex(124, 200);
  vertex(140, 205);
  vertex(135, 180);
  vertex(150, 160);
  vertex(165, 180);
  vertex(248, 160);
  vertex(255, 170);
  vertex(258, 168);
  vertex(263, 153);
  vertex(270, 160);
  vertex(275, 161);
  vertex(285, 153);
  vertex(300, 170);
  vertex(320, 165);
  vertex(330, 154);
  vertex(345, 180);
  vertex(340, 205);
  vertex(355, 202);
  vertex(365, 150);
  vertex(350, 110);
  vertex(300, 70);
  vertex(170, 70);
  vertex(120, 110);
  endShape(CLOSE);
  //hair

  noStroke();
  fill(148, 97, 119);
  triangle(143, 440, -25, 480, 480, 550);
  triangle(340, 440, 500, 480, 0, 550);
  //shirt
  
  
}

