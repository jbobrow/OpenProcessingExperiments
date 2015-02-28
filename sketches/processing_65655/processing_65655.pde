
//Kelly Chu . DESMA 28 . Workshop 6 Motion
//This program is an animated take on one of my digital illustrations.
//In the program, the arms rotate back and forth similar to the way the human
//body works while the head hovers up and down to give the girl a more
//natural/less static movement. The triangles, which serve as a "body,"
//rotate continuously to mimic rotating gears. Ultimately, the goal was
//to incorporate a mechanical feel to my originally static illustration.

PImage bg;
PImage tri;
PImage rightarm;
PImage leftarm;
PImage head;
PImage elines;

//right arm
float angle;
float angleDirection = 1;
float speed = 0.005;

//left arm
float angle2;
float angleDirection2 = 1;
float speed2 = 0.01;

//triangle
float x;
float y;
float angle3;
float speed3 = 0;

//head
float angle5 =0.0;
float offset = 4;
float scalar = 70;
 
 
void setup() {
  size(450, 600);
  smooth();
  
  bg = loadImage("bg.png");
  tri = loadImage("triangles.png");
  rightarm = loadImage("rightarm.png");
  leftarm = loadImage("leftarm.png");
  head = loadImage("head.png");
  elines = loadImage("lines.png");

}


 
void draw() {
  
  //background
  imageMode(CORNER);
  pushMatrix();
  image(bg, 0, 0, width, height);
  translate(40, 250);
  
  //triangles
  imageMode(CENTER);
  translate(100, 130); 
  rotate(angle3);
  image(tri, 0, 0, 230, 330);
  angle3 += 0.01;
  popMatrix();
  
  //lines
  imageMode(CORNER);
  pushMatrix();
  translate(233, -90);
  float y2 = offset + sin(angle) * scalar;
  image(elines, 0, y2, 320, 320);
  popMatrix();
  
  //right arm
  pushMatrix();
  translate(50, 260);
  rotate(angle);
  image(rightarm, 0, 0, 350, 350);
  popMatrix();
  
   angle += speed * angleDirection;
  if ((angle > .5) || (angle < 0)) {
    angleDirection *= -1;
  }
  
  //left arm
  pushMatrix();
  translate(190, 290);
  rotate(angle2);
  image(leftarm, 0, 0, 250, 250);
  popMatrix();
  
  angle2 += speed2 * angleDirection2;
  if ((angle2 > .01) || (angle2 < -1.2)) {
    angleDirection2 *= -1;
  }
  
  //head
  pushMatrix();
  translate(-5, 40);
  float y1 = offset + sin(angle) * scalar;
  image(head, 0, y1, 330, 330);
  popMatrix();
}

