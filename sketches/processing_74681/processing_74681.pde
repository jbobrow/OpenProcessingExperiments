
float angle1;
float angle2;
float angle3;
float angle4;
float angle5;
float angle6;
float y1 = 430;
float y2 = 430;
float x = 437;

void setup(){
  size(500,500);
  noStroke();
  fill(255);
  rectMode(CENTER);
  smooth();
}

void draw(){
  background(0);
//center circle
 ellipse(250,250,20,20);
//first circle 
 pushMatrix();
 angle1 = angle1+20;
 translate (263,280);
 rotate(radians(angle1));
 ellipse(1,1,2,2);
 popMatrix();
//second circle
 pushMatrix();
 angle2 = angle2+20;
 translate (276,308);
 rotate(radians(angle2));
 ellipse(1,1,4,4);
 popMatrix();
//third circle
 pushMatrix();
 angle3 = angle3+20;
 translate (292,336);
 rotate(radians(angle3));
 ellipse(1,1,6,6);
 popMatrix();
//fourth circle
 pushMatrix();
 angle4 = angle4+20;
 translate (310,370);
 rotate(radians(angle4));
 ellipse(1,1,8,8);
 popMatrix();
//fifth circle
 pushMatrix();
 angle5 = angle5+20;
 translate (333,411);
 rotate(radians(angle5));
 ellipse(1,1,10,10);
 popMatrix();
 //sixth circle
 pushMatrix();
 angle6 = angle6+20;
 translate (355,451);
 rotate(radians(angle6));
 ellipse(1,1,12,12);
 popMatrix();
//movement on right
 y1 = y1 - 1;
 if (y1 < -50)
 y1 = 550;
fill(255);
rect(380,y1, 25, 100);
//movement on left
 y2 = y2 + 1;
 if (y2 > 550)
 y2 = -50;
 rect(120,y2,25,100);
//horizontal movement
 x = x - 1;
 if (x < -50)
 x = 450;
 rect(x,470,100,25);
}


