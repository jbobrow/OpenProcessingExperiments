
int y=0;
float easing = 0.05;
PImage img;
PImage b1;
PImage b2;
PImage b3;
PImage b4;
PImage b5;
PImage b6;
PImage b7;
PImage b8;

PImage r1;
PImage r2;
PImage r3;
PImage r4;
PImage r5;
PImage r6;
PImage r7;
PImage r8;

PImage s1;
PImage s2;
PImage s3;
PImage s4;
PImage s5;
PImage s6;
PImage s7;
PImage s8;

PImage o3;
PImage o4;
PImage o5;
PImage o6;

PImage skeleton;
boolean showimage = false;

void setup(){
  size(400,600, P2D);
  background(255);
  rectMode(CENTER);
  b1=loadImage("b1.png");
  b2=loadImage("b2.png");
  b3=loadImage("b3.png");
  b4=loadImage("b4.png");
  b5=loadImage("b5.png");
  b6=loadImage("b6.png");
  b7=loadImage("b7.png");
  b8=loadImage("b8.png");
  
  r1=loadImage("r1.png");
  r2=loadImage("r2.png");
  r3=loadImage("r3.png");
  r4=loadImage("r4.png");
  r5=loadImage("r5.png");
  r6=loadImage("r6.png");
  r7=loadImage("r7.png");
  r8=loadImage("r8.png");
  
  s1=loadImage("s1.png");
  s2=loadImage("s2.png");
  s3=loadImage("s3.png");
  s4=loadImage("s4.png");
  s5=loadImage("s5.png");
  s6=loadImage("s6.png");
  s7=loadImage("s7.png");
  s8=loadImage("s8.png");
  
  o3=loadImage("o3.png");
  o4=loadImage("o4.png");
  o5=loadImage("o5.png");
  o6=loadImage("o6.png");
  
  skeleton=loadImage("skele.png");
  imageMode(CORNERS);
}
void draw(){
  
  
  
  image(b1,0,0);
  int x = constrain(mouseX-200,0,100-50);
  int y = constrain(mouseX-150,0,100-50);
  int i = constrain(mouseX-100,0,100-50);
  image(r1,x,0);
 
  //rect(mouseX+25,300,50,600);
  

  
  image(b2,50,0);
  image(r2,x+50,0);
  

  //rect(mouseX+75,300,50,600);
  
  
  image(b3,100,0);
  image(r3,x+100,0);
  image(s3,y+100,0);
  image(o3,i+100,0);
 
 
  //rect(mouseX+125,300,50,600);

    image(b4,150,0);
    image(r4,x+150,0);
    image(s4,y+150,0);
    image(o4,i+150,0);
   
  //rect(mouseX+175,300,50,600);
  
  image(b5,200,0);
  image(r5,x+200,0);
  image(s5,y+200,0);
  image(o5,i+200,0);
  //rect(mouseX+225,300,50,600);
  
  image(b6,250,0);
  image(r6,x+250,0);
  image(s6,y+250,0);
  image(o6,i+250,0);
  //rect(mouseX+275,300,50,600);
  
 image(b7,300,0);
 image(r7,x+300,0);
 
//  rect(mouseX+325,300,50,600);
  
image(b8,350,0);
image(r8,x+350,0);


fill(255);
  //rect(mouseX+375,300,50,600);
  
  if(showimage){
    image(skeleton, 0, 0);
}

  if(mousePressed)showimage = true;
  
} 
void mouseReleased(){
  showimage=false;
}

 
  /*  for(int x=100;x<700;x+=100){
  rect(x-50,300,100,600);*/



