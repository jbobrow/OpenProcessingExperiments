

import ddf.minim.*;
Minim minim;
AudioPlayer in;

PImage img; 
int c;  
float r,g,b;


void setup() {
  img=loadImage("art4.jpg");
  size(img.width,img.height);
   minim = new Minim(this);
   noStroke();
   background(0);
  in=minim.loadFile("Lifeline.mp3"); 
  in.play();
 
 smooth();
}

// * Main Loop *

void draw() {
 background(0);
int v = (int)(in.right.level()*35); //in의 볼륨에 *35 
 //background(v);
 println(v);
 tint(255,255,255,255-(v*20));//배경이미지 볼륨이 작으면 선명하게보임
image(img,0,0);//배경이미지
 
  for(int i=0; i<img.width; i++) {
    for(int j=0; j<img.height; j++) {
      c=img.get(i*v,j*v); //v만큼간격의 픽셀을 동그라미색으로
      float ran=random(50);//동그라미색
      r=red(c)+ran;
      g=green(c);
      b=blue(c)+ran;
     fill(r,g,b,random(160,250));
     //fill(r,g,b);
      ellipse(i*v,j*v,v,v);//v만큼간격으로 동그라미 그림
    }
  }
}
void stop()
{
  in.close();
  minim.stop();
  super.stop();
}


