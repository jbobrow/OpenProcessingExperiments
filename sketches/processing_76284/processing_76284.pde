

PImage S;
PImage K;
PImage Sun;
PFont Cambria;

float gravity = 0.5;
float x = 100;   // x location of square
float y = 0;     // y location of square
float speed = 0;
float U= 700;
float D=10;
float W=380;
float P=650;

void setup() {
  size(1320, 700);
}

void draw() {
  S=loadImage("Hanson.jpg");
 //K=loadImage("key.jpg");
  background(S);
  //player
  fill(255, 40, 34);
  stroke (0);
  rect (D, W, 20, 20);
  //stand
  fill(0);
  rect (10, 400, 300, 400);
  //stand 2
  Sun=loadImage("Sun.png");
  fill(0);
  image(Sun, P, U);
  
if (W>700){
  if (D>=650){
    U=U-20;
    W=W-20;
  }}

  if (W>=750) {
    W=380;
    D=0;
  }
  
  if(U<=-10){
    U=700;}
  
  if (keyPressed) {
    if (key == 'D' || key == 'd') {
      D=D+10;
    }
    if (key == 'A' || key == 'a') {
      D=D-10;
    }
    
  }
  if (D<=-1) {
    D=-1;

}
/*if (U>=350) {
  image (K, 400, 350);
}*/
if (D>=320){
 W=W+speed;
speed=speed+gravity; 
}
if (D>=330){
  if (W>=700){
    U=U-20;}}
    if (U<=100) { 
    text ("You Win!",100, 200);}
}

