
float xPos=width/2;
float xDir=1;
float yPos=1;

PImage img;
void setup() {
  size (450,450);
  rectMode(CENTER);
  imageMode(CENTER);
  img=loadImage("circuitboard.jpg");
  tint(29,191,21);
}

void draw() {
  background(200);
  translate(width/2,height/2);
  image(img,0,0);
  pushMatrix();
  xPos=xPos+xDir;
  translate(xPos,yPos);
  if (xPos>width/3.25)
    {
      xDir=-1;
    }
  if (xPos<-width/3.25) {
   xDir=1;
}
  buildRobot(0,0,100,125);
  popMatrix();
}

void buildRobot(float xpos, float ypos, int xw, int yh) {
  fill(204,64,0);
  ellipse(xpos-xw/4,ypos-yh/1.15,xw/2.5,yh/4);//left ellipse
  ellipse(xpos+xw/4.15,ypos-yh/1.15,xw/2.5,yh/4);//right ellipse
  fill(64,128,255);
  rect(xpos,ypos,xw,yh);//body
  rect(xpos,ypos-yh/1.15,xw/1.5,yh/2);//head
  line(xpos-xw/2.25,ypos-yh/1.15,xpos-xw/1.25,ypos-yh*1.2);//left antenna
  line(xpos+xw/2.25,ypos-yh/1.15,xpos+xw/1.25,ypos-yh*1.15);//right antenna
  rect(xpos-xw/1.4,ypos,xw/5,yh/1.1);//left arm
  rect(xpos+xw/1.4,ypos,xw/5,yh/1.1);//right arm
  rect(xpos-xw/4.5,ypos+yh,xw/4.5,yh);//left leg
  rect(xpos+xw/4.5,ypos+yh,xw/4.5,yh);//right leg
  fill(240);
  rect(xpos-xw/7,ypos-yh/1.05,xw/5.75,yh/7);//left eye
  rect(xpos+xw/7,ypos-yh/1.05,xw/5.75,yh/7);//right eye
  fill(random(255));
  rect(xpos,ypos-yh/1.375,xw/2.5,yh/25);//mouth
  fill(204,64,0);
  triangle(xpos-xw/1.4,ypos+yh/1.75,xpos-xw/1.4,ypos+yh/2.5,xpos-xw/1.8,ypos+yh/2.5);
  triangle(xpos-xw/1.125,ypos+yh/2.5,xpos-xw/1.4,ypos+yh/1.75,xpos-xw/1.4,ypos+yh/2.5);//left hand
  triangle(xpos+xw/1.4,ypos+yh/1.75,xpos+xw/1.4,ypos+yh/2.5,xpos+xw/1.8,ypos+yh/2.5);
  triangle(xpos+xw/1.125,ypos+yh/2.5,xpos+xw/1.4,ypos+yh/1.75,xpos+xw/1.4,ypos+yh/2.5);//right hand
  rect(xpos-xw/4.5,ypos+yh*1.5,xw/3.5,yh/7.5);//left foot
  rect(xpos+xw/4.5,ypos+yh*1.5,xw/3.5,yh/7.5);//right foot
  ellipse(xpos,ypos,xw*0.7,yh*0.55);//dial
  fill(0);
  line(xpos,ypos,xpos-xw/4,ypos-yh/6);
  ellipse(xpos,ypos,xw/10,yh/15);
  fill(255,255,70);
  rect(xpos,ypos-yh/1.775,xw/3,yh/8);//neck
  rect(xpos-xw/1.8,ypos-yh/3,xw/8,yh/5.5);//left arm connector
  rect(xpos+xw/1.8,ypos-yh/3,xw/9,yh/5.5);//right arm connector
}
