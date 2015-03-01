
Sonar b1;
Sonar b2;
Sonar b3;
Sonar b4;
Sonar b5;
Sonar b6;
Rec f;

void setup(){
//background(150); 
size(700,700);
f = new Rec(20,20,0,0,200,1.0,5.0);

//  x-position  y-position   size   color

b1 = new Sonar(width/2,150,200,0);
b2 = new Sonar(100,200,100,50);
b3 = new Sonar(450,470,400,120);
b4 = new Sonar(200,height/2,90,200);
b5 = new Sonar(600,90,130,90);
b6 = new Sonar(130,520,200,230);
//b1 = new Bubble(400,180,);  tamano color-central color-borde



}


void draw(){
  f.trans();
b1.display();
b2.display();
b3.display();
b4.display();
b5.display();
b6.display();





}
// This is a simple use of a class to draw a colors square
// Created by Sam Sadtler 9/18/14
// input from Matt Romein

// Rec r2 = new Rec(40, 200, 955, 255, 20);
// Rec r3 = new Rec(20, 100, 255, 255, 40);
// Rec r4 = new Rec(70, 90, 255, 255, 60);



class Rec {
  int cul0, cul1, cul2, hei, wid, mX, mY, Size;
  float pos, neg; 
  float rspeed;
  Rec(int h, int w, int c1, int c2, int c3 , float up, float down) {
    cul0=c1;
    cul1=c2;
    cul2=c3;
    pos=up;
    neg=down;
    hei=h;
    wid=w;
    mY= 0;
    mX= 0;
    rspeed=.1;
  }
  void update() {
    fill(cul0, cul1, cul2);
    rect(hei, hei, wid, wid);
  }
  void trans() {
    background(255);
    rectMode(CENTER);
    
    pushMatrix();
    translate(Size/neg, Size/pos);
    pushMatrix();
    
    rotate(frameCount*rspeed);
    fill(cul0, cul1, cul2);
    rect(mX, mY, wid, wid);
    popMatrix();
    popMatrix();

    if ( Size>width+hei/2) {
      ;
      Size=0;
    }
    Size+=10;
  }
}
class Sonar {
float x;
float y;
float h;
float w;
float cl;
float strk;
float size;
float originalSize;
  
  
Sonar(float tempX, float tempY, float tempS, float tempC){
x =tempX ;
y= tempY;
h= 10;
w= 10;
strk=255;
cl=tempC;
size = tempS;
originalSize= 1;

  
  
}  
  
  
  
  
void display(){
  fill(cl);
  ellipse(x,y,h,w);
  h++;
  w++;
  
 
 
  if(h>size || w>size){
   h=originalSize;
   w=originalSize;
   stroke(strk);
   strokeWeight(10);
  
    }
  
  fill(255);
}  
  

  
  
  
}


