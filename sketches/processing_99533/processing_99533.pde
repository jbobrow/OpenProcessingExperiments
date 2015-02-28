
//50 Rotating Cubes
//Richard Redlon

import processing.opengl.*;

float inc = 0.1;

void setup() 
{
  noFill();
  size(600, 600, OPENGL);
}

void draw() 
{
  background(255);
  inc = inc + .01;
  pushMatrix();
  translate(width/2,height/2);
  rotateX(inc);
  rotateY(inc);
  rotateZ(inc);
  
  box(10);
  box(20);
  box(30);
  box(40);
  box(50);
  box(60);
  box(70);
  box(80);
  box(90);
  box(100);
  box(110);
  box(120);
  box(130);
  box(140);
  box(150);
  box(160);
  box(170);
  box(180);
  box(190);
  box(200);
  box(210);
  box(220);
  box(230);
  box(240);
  box(250);
  box(260);
  box(270);
  box(280);
  box(290);
  box(300);
  box(310);
  box(320);
  box(330);
  box(340);
  box(350);
  box(360);
  box(370);
  box(380);
  box(390);
  box(400);
  box(410);
  box(420);
  box(430);
  box(440);
  box(450);
  box(460);
  box(470);
  box(480);
  box(490);
  box(500);
  /*
  ellipse(0,0,10,10);
  ellipse(0,0,20,20);
  ellipse(0,0,30,30);
  ellipse(0,0,40,40);
  ellipse(0,0,50,50);
  */
  popMatrix();
  
}



