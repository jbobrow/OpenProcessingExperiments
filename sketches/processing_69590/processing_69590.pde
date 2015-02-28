
float r=10;
float a=0;
float d=20;
float radius=10;
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;        
AudioPlayer mySound;


float startingTime=0;
float interval=0;
float interval2=1000;
float interval3=3000;
float interval4=5000;
float interval5=6000;
float interval6=9000;
float interval10=90000;


void setup() {
  size(350, 350);
  smooth();
  background(0);
  //  colorMode(HSB, 360, 100, 100);

  minim = new Minim(this);
  mySound= minim.loadFile("timetravel.mp3");
  mySound.play();
}


void draw() {


  if (millis()-startingTime>interval&& millis()-startingTime<interval10) {
    //   rect(0, 0, width, height); 
    //  fill(0, 0, 100, 1); 
    c();
  }


  if (millis()-startingTime>interval3&&millis()-startingTime<interval10) {
    l();
  }
  
   if (millis()-startingTime>interval4&&millis()-startingTime<interval10){
    l2();
   }
   
     if (millis()-startingTime>interval5&&millis()-startingTime<interval10){
     l3();
     l4();
     }
//    if (millis()-startingTime>interval5&&millis()-startingTime<interval10)

}


void c() {
  stroke(0);

  float x=r*cos(-a);
  float y=r*sin(-a);
  ellipse(width/2+x, height/2+y, d, d);
  a+=0.08;
  r+=0.06;
  d=d-0.005;
}

void l() {
//  translate(width/2, height/2);
  stroke(0, 210, 255);

  for (int deg = 0; deg < 360; deg+=3) {
    float angle = radians(deg);
    float p = cos(angle) * radius;
    float q = sin(angle) * radius;
    ellipse(p, q, 1, 1);
  }
  radius+=0.1;
}

void l2(){
 translate(width/2, height/2);
  stroke(255, 100, 0);

  for (int deg = 0; deg < 360; deg+=3) {
    float angle = radians(deg);
    float p = cos(angle) * radius;
    float q = sin(angle) * radius;
    ellipse(p, q, 1, 1);
  }
  radius+=0.1;
}
  
void l3(){
 translate(width/2, height/2);
  stroke(255, 200,0);

  for (int deg = 0; deg < 360; deg+=3) {
    float angle = radians(deg);
    float p = cos(angle) * radius;
    float q = sin(angle) * radius;
    ellipse(p, q, 1, 1);
  }
  radius+=0.1;
}

void l4(){
 translate(-width/2, -height/2);
  stroke(180, 0,255);

  for (int deg = 0; deg < 360; deg+=3) {
    float angle = radians(deg);
    float p = cos(angle) * radius;
    float q = sin(angle) * radius;
    ellipse(p, q, 1, 1);
  }
  radius+=0.1;
}




