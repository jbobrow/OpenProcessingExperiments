
int myX;
int myY;

void setup() {
  size (600,600);
  myX=100;
  myY=50;
}

void draw() {
  background(200);
  ellipse(mouseX,mouseY+45,35,40);//left ellipse (looking at bot)
  ellipse(mouseX+100,mouseY+45,35,40);//right ellipse
  fill(64,128,255);
  rect(mouseX,mouseY,myX,myX);//head
  fill(204,64,0);
  line(mouseX-17,mouseY+45,mouseX-55,mouseY);//left antenna
  line(mouseX+117,mouseY+45,mouseX+127,mouseY-15);//right antenna
  fill(240);
  rect(mouseX+15,mouseY+25,25,25);//left eye
  rect(mouseX+60,mouseY+25,25,25);//right eye
  fill(random(0,255));
  rect(mouseX+20,mouseY+75,60,5);//mouth
  fill(64,128,255);
  rect(mouseX+20,mouseY+myX,60,15);//neck
  fill(64,128,255);
  rect(mouseX-25,mouseY+115,150,175);//body
  fill(255,255,70);
  rect(mouseX-35,mouseY+125,10,30);//left arm connector
  rect(mouseX+125,mouseY+125,10,30);//right arm connector
  fill(64,128,255);
  rect(mouseX-60,mouseY+120,25,135);//left arm
  rect(mouseX+135,mouseY+120,25,135);//right arm
  fill(204,64,0);
  triangle(mouseX-48,mouseY+290,mouseX-68,mouseY+255,mouseX-48,mouseY+255);
  triangle(mouseX-48,mouseY+290,mouseX-28,mouseY+255,mouseX-48,mouseY+255);//left hand
  triangle(mouseX+148,mouseY+290,mouseX+128,mouseY+255,mouseX+148,mouseY+255);
  triangle(mouseX+148,mouseY+290,mouseX+168,mouseY+255,mouseX+148,mouseY+255);//right hand
  fill(64,128,255);
  rect(mouseX,mouseY+290,35,150);//left leg
  rect(mouseX+65,mouseY+290,35,150);//right leg
  fill(204,64,0);
  rect(mouseX-5,mouseY+440,45,30);//left foot
  rect(mouseX+60,mouseY+440,45,30);//right foot
}
