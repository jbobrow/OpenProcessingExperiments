
/*
by Adriano Parracciani
aka
CyberParra
*/




void setup() {
size(400,400);
stroke(0);
frameRate(10);
}


int x=200;
int y=200;
int radius=70;
int radius2=100;
int radius3=130;
float angle=1;

void draw() {
  background(50);
  stroke(#ffd700);
  strokeWeight(40);
  //sun
  point(x,y);

float ty=radius*sin(radians(angle));
float tx=radius*cos(radians(angle));

//planet1

  stroke(150);
  strokeWeight(10);
  point(x+tx,y+ty);
  noFill();
  strokeWeight(1);
  stroke(150,50);
  ellipse(200,200,140,140);
  //ellipse(200,200,x+tx,y+ty);
  
  //planet2
  
  float ty2=radius2*sin(radians(angle/1.5));
  float tx2=radius2*cos(radians(angle/1.5));
  
  stroke( #CD853F);
  strokeWeight(10);
  point(x+tx2,y+ty2);
  strokeWeight(1);
   stroke( #CD853F,50);
  ellipse(200,200,199,199);
  
  
  //planet3
  
  float ty3=radius3*sin(radians(angle/3));
  float tx3=radius3*cos(radians(angle/3));
  
  stroke( #DA70D6);
  strokeWeight(10);
  point(x+tx3,y+ty3);
  strokeWeight(1);
  stroke( #DA70D6,50);
  ellipse(200,200,257,257);
  
  
angle=angle+10;

}
