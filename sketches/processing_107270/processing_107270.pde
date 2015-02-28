
/* @pjs preload="background.jpg"; */
 
PShape hair;
int leftArmX;
int leftArmY;
int rightArmX;
int rightArmY;
PImage backgroundImage;
 
void setup() {
  size(1200, 500);
  hair = loadShape("hair.svg");
  leftArmX = 260;
  leftArmY = 251;
  rightArmX = 460;
  rightArmY = 251;
  backgroundImage = loadImage("background.jpg");
  background(backgroundImage);
};
 
void draw() {
   
  /*  pants  */
  noStroke();
  fill(60 ,102 ,156);
  rectMode(CENTER);
  rect(400, 700, 150, 400);
   
  /*  line  */
  stroke(0, 80);
  line(400, 500, 400, 600);
   
  /*  top of body/ shirt  */
  noStroke();
  fill(114 ,195 ,168);
  arc(400, 255, 200, 30, PI, 2*PI, RADIUS);
   
  /*  main body top rectangle  */
  noStroke();
  fill(114 ,195 ,168);
  rectMode(CENTER);
  rect(400, 265, 200, 30);
   
  /*  main body middle rectangle  */
  noStroke();
  fill(114 ,195 ,168);
  rectMode(CENTER);
  rect(400, 370, 150, 225);
   
  /*  main body top triangle  */
  noStroke();
  fill(114 ,195 ,168);
  rectMode(CENTER);
  triangle(300, 277, 500, 277, 400, 500);
   
  /*  main body bottom triangle  */
  noStroke();
  fill(114 ,195 ,168);
  rectMode(CENTER);
  triangle(320, 500, 480, 500, 400, 277);
   
  /*  left hand  */
  fill(249,237,209);
  noStroke();
  ellipse(276, 500, 40, 50);
   
  /*  left hand fingers  */
  fill(249,237,209);
  noStroke();
  ellipse(284, 518, 40, 20);
   
   /*  right hand  */
  fill(249,237,209);
  noStroke();
  ellipse(526, 500, 40, 50);
   
  /*  right hand fingers  */
  fill(249,237,209);
  noStroke();
  ellipse(518, 518, 40, 20);
   
  /*  top left arm  */
  noStroke();
  fill(114 ,195 ,168);
  translate(leftArmX,leftArmY);
  beginShape();
  vertex(40, 0);
  vertex(80, 20);
  vertex(40, 250);
  vertex(0, 220);
  endShape();
  translate(-(leftArmX),-(leftArmY));
   
   
  /*  top right arm  */
  noStroke();
  fill(114 ,195 ,168);
  translate(rightArmX,rightArmY);
  beginShape();
  vertex(0,20);
  vertex(40, 0);
  vertex(80, 220);
  vertex(40, 250);
  endShape();
  translate(-(rightArmX),-(rightArmY));
   
  /*  neck  */
  fill(249,237,209);
  noStroke();
  ellipse(400, 238, 50, 50);
   
  /*  dark top of neck  */
  fill(215,192,144,90);
  noStroke();
  ellipse(400, 228, 60, 50);
   
  /*  head  */
  fill(249,237,209);
  noStroke();
  ellipse(400, 200, 100, 100);
   
  /*  mouth  */
  fill(255,0,0,80);
  noStroke();
  arc(400, 200, 50, 50, 0, PI, RADIUS);
   
  /*  tongue  */
  fill(155,41,41);
  ellipse(400, 220, 27, 9);
   
  /*  teeth  */
  fill(255);
  noStroke();
  arc(400, 200, 50, 20, 0, PI, RADIUS);
   
  /*  nose  */
  noStroke();
  fill(215,192,144,100);
  arc(400, 185, 15, 15, PI, 2*PI, RADIUS);
   
  /*  black above eye  */
  fill(0);
  arc(380, 173, 25, 25, PI, 2*PI, RADIUS);
  arc(420, 173, 25, 25, PI, 2*PI, RADIUS);
   
  /*  white of eyes  */
  fill(255);
  noStroke();
  arc(380, 175, 25, 25, PI, 2*PI, RADIUS);
  arc(420, 175, 25, 25, PI, 2*PI, RADIUS);
   
  /*  pupils  */
  fill(0);
  arc(380, 175, 10, 10, PI, 2*PI, RADIUS);
  arc(420, 175, 10, 10, PI, 2*PI, RADIUS);
   
  /*  lip  */
  noStroke();
  fill(215,192,144,50);
  arc(400, 200, 50, 7, PI, 2*PI, RADIUS);
   
  /*  under lip  */
  noStroke();
  fill(215,192,144,100);
  arc(400, 230, 15, 7, 0, PI, RADIUS);
   
  /*  ears  */
  noStroke();
  fill(249,237,209,100);
  ellipse(358, 205, 30, 30);
  ellipse(442, 205, 30, 30);
   
  /*  hair  */
  shape(hair, 330, 40, 160, 200);
   
};


