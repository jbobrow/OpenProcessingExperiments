
float i;
float j;
float k;
float l;
float m;
float easing =0.05;
PImage img;

void setup() {
  size(1000, 800);
  img = loadImage("space bg.jpg");
}

void draw() {

  smooth();
  image(img, 0, 0); 
  robot(20,0,0);
  robot(40,310,0);
  robot(20,300,310);
  robot(40,0,310);

}

void robot(float antenna,int xx, int yy){
  ///HEAD
  stroke(0);
  strokeWeight(4);
  line(mouseX+xx+60, mouseY+yy-130, mouseX+xx+60, mouseY+yy-130-antenna);
  strokeWeight(1);
  fill(16, 78, 139);
  ellipse(mouseX+xx+60, mouseY+yy-130-antenna, 15, 15);
  noFill();
  fill(70, 130, 180); //fill head blue
  strokeWeight(3);
  quad(mouseX+xx-70, mouseY+yy-130, mouseX+xx+70, mouseY+yy-130, mouseX+xx+70, mouseY+yy-30, mouseX+xx-70, mouseY+yy-30);
  fill(0);
  ellipse(mouseX+xx-50, mouseY+yy-90, 10, 10);
  ellipse(mouseX+xx+50, mouseY+yy-90, 10, 10);
  fill(255);
  strokeWeight(2);
  quad(mouseX+xx-40, mouseY+yy-70, mouseX+xx+40, mouseY+yy-70, mouseX+xx+40, mouseY+yy-50, mouseX+xx-40, mouseY+yy-50);

  //TEETH
  fill(198, 226, 255, 255);
  for (int x=0;x<=60;x+=20) {
    quad(mouseX+xx+x-30, mouseY+yy-70, mouseX+xx+x-20, mouseY+yy-70, mouseX+xx+x-20, mouseY+yy-50, mouseX+xx+x-30, mouseY+yy-50);
  }
  fill(255);

  ///BODY

  fill(16, 78, 139); //blue body
  strokeWeight(3);

  quad(mouseX+xx-70, mouseY+yy-30, mouseX+xx+70, mouseY+yy-30, mouseX+xx+50, mouseY+yy+170, mouseX+xx-50, mouseY+yy+170);
  noFill();
  strokeWeight(2);

  fill(255, 0, 0); //BOW TIE
  ellipse(mouseX+xx, mouseY+yy, 15, 15);
  triangle(mouseX+xx-190+160, mouseY+yy-230+220, mouseX+xx-190+182.5, mouseY+yy-230+230, mouseX+xx-190+160, mouseY+yy-230+240);
  triangle(mouseX+xx-190+220, mouseY+yy-230+220, mouseX+xx-190+220, mouseY+yy-230+240, mouseX+xx-190+197.5, mouseY+yy-230+230);
  fill(255);

  fill(198, 226, 255, 255); //door blue
  quad(mouseX+xx-190+140, mouseY+yy-230+260, mouseX+xx-190+240, mouseY+yy-230+260, mouseX+xx-190+230, mouseY+yy-230+360, mouseX+xx-190+150, mouseY+yy-230+360);
  noFill();
  fill(0);
  ellipse(mouseX+xx-190+220, mouseY+yy-230+300, 10, 10);

  fill(255, 0, 0);

  for (int a=0; a<=60; a+=20) {
    ellipse(mouseX+xx-30+a, mouseY+yy+150, 5, 10);
  }

  fill(255);

  ///LEFT ARM


  if (mousePressed == true) {
    pushMatrix();
    strokeWeight(10);
    line(mouseX+xx-190+100, mouseY+yy, mouseX+xx-190+80-50, mouseY+yy-230+340-50);
    strokeWeight(2);
    fill(96, 123, 139);
    ellipse(mouseX+xx-190+110, mouseY+yy-230+225, 60, 60);
    translate(-50, -50);
    fill(108, 123, 139);
    strokeWeight(2);
    arc(mouseX+xx-190+75, mouseY+yy-230+375, 50, 50, radians(95), radians(380));
    line(mouseX+xx-190+75, mouseY+yy-230+375, mouseX+xx-190+98.49, mouseY+yy-230+383.55);
    line(mouseX+xx-190+77.18, mouseY+yy-230+350.09, mouseX+xx-190+72.82, mouseY+yy-230+399.9);
    fill(16, 78, 139);
    ellipse(mouseX+xx-190+80, mouseY+yy-230+340, 30, 30);
    fill(255);
    popMatrix();
  }
  else {
    strokeWeight(10);
    line(mouseX+xx-190+100, mouseY+yy, mouseX+xx-190+80, mouseY+yy-230+340); 
    strokeWeight(2);
    fill(96, 123, 139);
    ellipse(mouseX+xx-190+110, mouseY+yy-230+225, 60, 60);
    fill(108, 123, 139);
    strokeWeight(2);
    arc(mouseX+xx-190+75, mouseY+yy-230+375, 50, 50, radians(95), radians(380));
    line(mouseX+xx-190+75, mouseY+yy-230+375, mouseX+xx-190+98.49, mouseY+yy-230+383.55);
    line(mouseX+xx-190+77.18, mouseY+yy-230+350.09, mouseX+xx-190+72.82, mouseY+yy-230+399.9);
    fill(16, 78, 139);
    ellipse(mouseX+xx-190+80, mouseY+yy-230+340, 30, 30);
    fill(255);
  }



  //RIGHT ARM

  if (mousePressed == true) {
    pushMatrix();
    strokeWeight(10);
    line(mouseX+xx-190+270, mouseY+yy-230+225, mouseX+xx-190+300+50, mouseY+yy-230+340-50);
    translate(50,-50);
    strokeWeight(3);
    fill(108, 123, 139);
    strokeWeight(2);
    arc(mouseX+xx-190+305, mouseY+yy-230+375, 50, 50, radians(160), radians(445));
    line(mouseX+xx-190+305, mouseY+yy-230+375, mouseX+xx-190+281.5, mouseY+yy-230+383.5);
    line(mouseX+xx-190+302.82, mouseY+yy-230+350.1, mouseX+xx-190+307.17, mouseY+yy-230+399.9);
    fill(16, 78, 139);
    ellipse(mouseX+xx-190+300, mouseY+yy-230+340, 30, 30);
    fill(255);
    popMatrix();
    fill(96, 123, 139);
    ellipse(mouseX+xx-190+270, mouseY+yy-230+225, 60, 60);
  }
  else {
    strokeWeight(10);
    line(mouseX+xx-190+270, mouseY+yy-230+225, mouseX+xx-190+300, mouseY+yy-230+340);
    strokeWeight(1);
    strokeWeight(3);
    fill(108, 123, 139);
    strokeWeight(2);
    arc(mouseX+xx-190+305, mouseY+yy-230+375, 50, 50, radians(160), radians(445));
    line(mouseX+xx-190+305, mouseY+yy-230+375, mouseX+xx-190+281.5, mouseY+yy-230+383.5);
    line(mouseX+xx-190+302.82, mouseY+yy-230+350.1, mouseX+xx-190+307.17, mouseY+yy-230+399.9);
    fill(96, 123, 139);
    ellipse(mouseX+xx-190+270, mouseY+yy-230+225, 60, 60);
    fill(16, 78, 139);
    ellipse(mouseX+xx-190+300, mouseY+yy-230+340, 30, 30);
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

  ellipse(i+xx, mouseY+yy+190, 120, 10);
  ellipse(j+xx, mouseY+yy+215, 110, 10);
  ellipse(k+xx, mouseY+yy+240, 100, 10);
  ellipse(l+xx, mouseY+yy+265, 90, 10);
  ellipse(m+xx, mouseY+yy+290, 80, 10);

}



