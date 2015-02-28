
float i;
float j;
float k;
float l;
float m;
float easing =0.05;
float antenna = 20;
PImage img;

void setup() {
  size(1000, 800);
  img = loadImage("space bg.jpg");
}

void draw() {

  smooth();
  image(img, 0, 0); 
  stroke(0);

  ///HEAD
  strokeWeight(4);
  line(mouseX+60, mouseY-130, mouseX+60, mouseY-130-antenna);
  strokeWeight(1);
  fill(16, 78, 139);
  ellipse(mouseX+60, mouseY-130-antenna, 15, 15);
  noFill();
  fill(70, 130, 180); //fill head blue
  strokeWeight(3);
  quad(mouseX-70, mouseY-130, mouseX+70, mouseY-130, mouseX+70, mouseY-30, mouseX-70, mouseY-30);
  fill(0);
  ellipse(mouseX-50, mouseY-90, 10, 10);
  ellipse(mouseX+50, mouseY-90, 10, 10);
  fill(255);
  strokeWeight(2);
  quad(mouseX-40, mouseY-70, mouseX+40, mouseY-70, mouseX+40, mouseY-50, mouseX-40, mouseY-50);

  //TEETH
  fill(198, 226, 255, 255);
  for (int x=0;x<=60;x+=20) {
    quad(mouseX+x-30, mouseY-70, mouseX+x-20, mouseY-70, mouseX+x-20, mouseY-50, mouseX+x-30, mouseY-50);
  }
  fill(255);

  ///BODY

  fill(16, 78, 139); //blue body
  strokeWeight(3);

  quad(mouseX-70, mouseY-30, mouseX+70, mouseY-30, mouseX+50, mouseY+170, mouseX-50, mouseY+170);
  noFill();
  strokeWeight(2);

  fill(255, 0, 0); //BOW TIE
  ellipse(mouseX, mouseY, 15, 15);
  triangle(mouseX-190+160, mouseY-230+220, mouseX-190+182.5, mouseY-230+230, mouseX-190+160, mouseY-230+240);
  triangle(mouseX-190+220, mouseY-230+220, mouseX-190+220, mouseY-230+240, mouseX-190+197.5, mouseY-230+230);
  fill(255);

  fill(198, 226, 255, 255); //door blue
  quad(mouseX-190+140, mouseY-230+260, mouseX-190+240, mouseY-230+260, mouseX-190+230, mouseY-230+360, mouseX-190+150, mouseY-230+360);
  noFill();
  fill(0);
  ellipse(mouseX-190+220, mouseY-230+300, 10, 10);

  fill(255, 0, 0);

  for (int a=0; a<=60; a+=20) {
    ellipse(mouseX-30+a, mouseY+150, 5, 10);
  }

  fill(255);

  ///LEFT ARM


  if (mousePressed == true) {
    pushMatrix();
    strokeWeight(10);
    line(mouseX-190+100, mouseY, mouseX-190+80-50, mouseY-230+340-50);
    strokeWeight(2);
    fill(96, 123, 139);
    ellipse(mouseX-190+110, mouseY-230+225, 60, 60);
    translate(-50, -50);
    fill(108, 123, 139);
    strokeWeight(2);
    arc(mouseX-190+75, mouseY-230+375, 50, 50, radians(95), radians(380));
    line(mouseX-190+75, mouseY-230+375, mouseX-190+98.49, mouseY-230+383.55);
    line(mouseX-190+77.18, mouseY-230+350.09, mouseX-190+72.82, mouseY-230+399.9);
    fill(16, 78, 139);
    ellipse(mouseX-190+80, mouseY-230+340, 30, 30);
    fill(255);
    popMatrix();
  }
  else {
    strokeWeight(10);
    line(mouseX-190+100, mouseY, mouseX-190+80, mouseY-230+340); 
    strokeWeight(2);
    fill(96, 123, 139);
    ellipse(mouseX-190+110, mouseY-230+225, 60, 60);
    fill(108, 123, 139);
    strokeWeight(2);
    arc(mouseX-190+75, mouseY-230+375, 50, 50, radians(95), radians(380));
    line(mouseX-190+75, mouseY-230+375, mouseX-190+98.49, mouseY-230+383.55);
    line(mouseX-190+77.18, mouseY-230+350.09, mouseX-190+72.82, mouseY-230+399.9);
    fill(16, 78, 139);
    ellipse(mouseX-190+80, mouseY-230+340, 30, 30);
    fill(255);
  }



  //RIGHT ARM

  if (mousePressed == true) {
    pushMatrix();
    strokeWeight(10);
    line(mouseX-190+270, mouseY-230+225, mouseX-190+300+50, mouseY-230+340-50);
    translate(50,-50);
    strokeWeight(3);
    fill(108, 123, 139);
    strokeWeight(2);
    arc(mouseX-190+305, mouseY-230+375, 50, 50, radians(160), radians(445));
    line(mouseX-190+305, mouseY-230+375, mouseX-190+281.5, mouseY-230+383.5);
    line(mouseX-190+302.82, mouseY-230+350.1, mouseX-190+307.17, mouseY-230+399.9);
    fill(16, 78, 139);
    ellipse(mouseX-190+300, mouseY-230+340, 30, 30);
    fill(255);
    popMatrix();
    fill(96, 123, 139);
    ellipse(mouseX-190+270, mouseY-230+225, 60, 60);
  }
  else {
    strokeWeight(10);
    line(mouseX-190+270, mouseY-230+225, mouseX-190+300, mouseY-230+340);
    strokeWeight(1);
    strokeWeight(3);
    fill(108, 123, 139);
    strokeWeight(2);
    arc(mouseX-190+305, mouseY-230+375, 50, 50, radians(160), radians(445));
    line(mouseX-190+305, mouseY-230+375, mouseX-190+281.5, mouseY-230+383.5);
    line(mouseX-190+302.82, mouseY-230+350.1, mouseX-190+307.17, mouseY-230+399.9);
    fill(96, 123, 139);
    ellipse(mouseX-190+270, mouseY-230+225, 60, 60);
    fill(16, 78, 139);
    ellipse(mouseX-190+300, mouseY-230+340, 30, 30);
    fill(255);
  }
  ///TAIL

  i += (mouseX-i)*5*easing;
  j += (mouseX-j)*4*easing;
  k += (mouseX-k)*3*easing;
  l += (mouseX-l)*2*easing;
  m += (mouseX-m)*easing;

  stroke(255,0,0,110);
  noFill();
  strokeWeight(7);

  ellipse(i, mouseY+190, 120, 10);
  ellipse(j, mouseY+215, 110, 10);
  ellipse(k, mouseY+240, 100, 10);
  ellipse(l, mouseY+265, 90, 10);
  ellipse(m, mouseY+290, 80, 10);

//  fill(0,0);
//  ellipse(i, mouseY+190, 90, 10);
//  ellipse(j, mouseY+215, 80, 10);
//  ellipse(k, mouseY+240, 70, 10);
//  ellipse(l, mouseY+265, 60, 10);
//  ellipse(m, mouseY+290, 50, 10);
}




