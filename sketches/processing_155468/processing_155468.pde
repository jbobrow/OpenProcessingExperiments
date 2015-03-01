
import processing.opengl.*;
float n = 24;

float x = -.3;
float y = 0.1;
float z = 0.1;
void setup() {
 size(500, 500,P3D);
  background(127);
} 
 
void draw() {
door1();
door2();
paper();
footStop();
topBar1();
topBar2();
topBar3();
topBar4();
pyramid();
light();
topCone();
backFix();
}
void door2(){
  fill(24, 53, 171);
  translate(60,0,0);
  //background(127);
  box(60, 240, 120);
  y+= .1;  //rotate
}

void door1(){
  //noStroke();
  fill(24, 53, 171);
  translate(250,250);
  rotateX(x);
  rotateY(y);
  rotateZ(z);
  background(127);
  box(60, 240, 120);
}

void paper(){
  fill(240,240,240);
  translate(-60,10,60);
  box(20,28,1);
}
void footStop(){
  fill(24, 53, 171);
  translate(30,115,-60);
  box(150,16,150);
}
void topBar1(){
  stroke(255);
  //stroke(24, 53, 171);
  fill(0);
  translate(0,-235,0);
  box(140,16,100);
}
void topBar2(){
  fill(0);
  box(100,16,140);
}
void topBar3(){
  stroke(0);
  fill(24, 53, 171);
  translate(0,-15,0);
  box(99,15,99);
}

void topBar4(){
  translate(0,-10,0);
  box(85,15,85);
}

void pyramid(){

translate(-1,-7,0);
beginShape();

vertex(0,-10,0); //apex
vertex(-43,0,43);
vertex(43,0,43);

vertex(0,-10,0);
vertex(43,0,-43);
vertex(43,0,43);

vertex(0,-10,0);
vertex(-43,0,-43);
vertex(43,0,-43);

vertex(0,-10,0);
vertex(-43,0,-43);
vertex(-43,0,43);
endShape();
}

void light(){
  translate(0,-15,0);
  fill(255);
  stroke(0);
  for (i=0; i<=3.14; i+=3.14/n){
    if (i>0){noStroke();}
    rotateY(i);
    box(10,15,10);
  }
stroke(0)
}

void topCone(){
fill(24, 53, 171);
translate(0,-8,0);
noStroke();
for (i=0; i<=3.14; i+=3.14/n){
rotateY(i);
  beginShape();

vertex(0,-4,0); //apex
vertex(-6,0,6);
vertex(6,0,6);

vertex(0,-4,0);
vertex(6,0,-6);
vertex(6,0,6);

vertex(0,-4,0);
vertex(-6,0,-6);
vertex(6,0,-6);

vertex(0,-4,0);
vertex(-6,0,-6);
vertex(-6,0,6);
endShape();
}
stroke(0);
}

void backFix(){
  noStroke();
  translate(0,190,2);
  box(118,240,118);
  stroke(0);
}
