
PImage m1;
PImage m2;
PImage m3;
PImage f1;
PImage m4;
PImage f2;

void setup(){
  background(200);
  size(640,480);
  m1= loadImage("m1.png");
  m2= loadImage("m2.png");
  m3= loadImage("m3.png");
  f1= loadImage("f1.png");
  m4=loadImage("m4.png");
  f2= loadImage("f2.png");
  
}

void draw(){
 background(200);
 imageMode(CENTER);
float x=width/2;
float y=height/2;

float b= random(1,10);
float a=mouseX/b;
float c=mouseX*1.2;

image(m2,b+c+400,y);
tint(170,a);
image(m3,a+mouseX*2+40,y);
tint(170,a);
image(f1,a+c-60+400*b,y);
tint(170,b);
image(m4,a+40,y);
tint(170,b+10);
image(f2,a*1.5+40*b,y);
tint(170,a+mouseX);
//image(m1,c/b+40,y);
//tint(170,a/30*2);

//b=random(100,600);
//image(m1,c/b+40,y);
//tint(170,a);
//image(m2,b+c+400,y);
//tint(170,a);
//image(m3,a+mouseX*2+40,y);
//tint(170,a);
//image(f1,a+c-60+400*b,y);
//tint(170,b);
//image(m4,a+40,y);
//tint(170,b+10);
//image(f2,a*1.5+40*b,y);
//tint(170,a+mouseX);

b-=50;
a-=10;
}
  

