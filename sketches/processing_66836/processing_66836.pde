
PFont myFont;
String title="London";
String Olympictitle="LONDON OLYMPIC";
int Cyclex=67;
int Cycley=340;
//AnimationTopleftCycle//
float threeCycle_angle = 0.0;
float threeCycle_speed = 0.1;
float x = 20.0; // Initial x-coordinate
float y = 10.0; // Initial y-coordinate
float targetX = 100.0; // Destination x-coordinate
float targetY = 165.0; // Destination y-coordinate
float easing = 0.05;

void setup() {
  //creating font/////////
  myFont=loadFont("myFont02.vlw");
  size(400, 600);
  smooth();
  background(0);
}

//topLeft shape creating//
void topLeft() {
  //topLeft white shape
  noStroke();
  fill(221, 219, 219);
  beginShape();
  vertex(120, 169);
  vertex(177, 200);
  vertex(165, 234);
  vertex(181, 234);
  vertex(200, 275);
  vertex(106, 275);
  vertex(125, 222);
  vertex(104, 212);
  endShape(CLOSE);

  fill(228, 86, 54);
  stroke(255);
  beginShape();
  vertex(121, 176);
  vertex(171, 205);
  vertex(160, 238);
  vertex(179, 238);
  vertex(195, 273);
  vertex(109, 278);
  vertex(127, 220);
  vertex(106, 210);
  endShape();
}


//topRight shape creating//
void topRight() {
  //topRight white shape
  fill(221, 219, 219);
  beginShape();
  vertex(198, 175);
  vertex(206, 183);
  vertex(240, 157);
  vertex(289, 213);
  vertex(221, 279);
  vertex(168, 227);
  vertex(198, 175);
  vertex(206, 183);
  endShape(CLOSE);

  fill(228, 86, 54);
  beginShape();
  vertex(231, 161);
  vertex(286, 213);
  vertex(261, 257);
  vertex(252, 247);
  vertex(222, 275);
  vertex(168, 223);
  vertex(194, 179);
  vertex(203, 189);
  endShape(CLOSE);
}
//btLeft shape creating//
void btLeft() {
  //btLeft white shape
  fill(221, 219, 219);
  beginShape();
  vertex(113, 286);
  vertex(161, 271);
  vertex(187, 302);
  vertex(174, 351);
  vertex(116, 363);
  vertex(133, 312);
  endShape(CLOSE);

  fill(228, 86, 54);
  beginShape();
  vertex(118, 291);
  vertex(161, 278);
  vertex(184, 302);
  vertex(171, 353);
  vertex(125, 365);
  vertex(139, 312);
  endShape(CLOSE);
}
//md shape creating//
void md() {
  fill(228, 86, 54);
  beginShape();
  vertex(194, 275);
  vertex(223, 278);
  vertex(216, 302);
  vertex(188, 298);
  endShape(CLOSE);
}
//btRight shape creating//
void btRight() {
  //btRight white shape
  fill(221, 219, 219);
  beginShape();
  vertex(256, 258);
  vertex(284, 312);
  vertex(248, 332);
  vertex(286, 364);
  vertex(227, 369);
  vertex(177, 324);
  vertex(230, 297);
  vertex(221, 282);
  endShape(CLOSE);

  fill(228, 86, 54);
  beginShape();
  vertex(225, 278);
  vertex(255, 260);
  vertex(282, 306);
  vertex(248, 329);
  vertex(287, 356);
  vertex(233, 365);
  vertex(184, 325);
  vertex(236, 297);
  endShape(CLOSE);
}
//Olympic Cycle Creating//
void Olympic(int x, int y) {
  noFill();
  strokeWeight(2);
  ellipse(x, y, 22, 22);
  ellipse(x+27, y, 22, 22);
  ellipse(x+27+27, y, 22, 22);
  ellipse(x+13, y+11, 22, 22);
  ellipse(x+13+27, y+11, 22, 22);
}
//ThreeCycle runing function//
void ThreeCycleRuning (int Cyclex, int Cycley) {

  threeCycle_angle = threeCycle_angle + threeCycle_speed;
  ellipse(Cyclex + (sin(threeCycle_angle + PI) * 5), Cycley-55-55, 55, 55);
  ellipse(Cyclex + (sin(threeCycle_angle + HALF_PI) * 5), Cycley-55, 55, 55);
  ellipse(Cyclex + (sin(threeCycle_angle + QUARTER_PI) * 5), Cycley, 55, 55);
  //OtherTwo Cycle on the side//
  ellipse(Cyclex + (sin(threeCycle_angle + QUARTER_PI) * 2)+280, Cycley-45-45, 45, 45);
  ellipse(Cyclex + (sin(threeCycle_angle + QUARTER_PI) * 2)+280, Cycley-40, 45, 45);
}



void draw() {
    //animationTopleft//
  fill(0, 10);
  rect(0, 0, width, height);
  float d = dist(x, y, targetX, targetY);
  if (d > 1.0) {
    x += (targetX - x) * easing;
    y += (targetY - y) * easing;
  }
  fill(228, 86, 54);
  ellipse(x, y, 65, 65);
  
  btLeft();
  topLeft();
  topRight();

  md();
  btRight();
  Olympic(201, 215);
  fill(255, 255, 255);
  textFont(myFont, 13);
  text(title, 125, 265);
  textFont(myFont, 28);
  text(Olympictitle, 72, 430);
  fill(0, 12);
  rect(0, 0, width, height);
  ThreeCycleRuning(55, 340);

}
