

PImage sheldon;
PImage ball;
PImage ball2;
float x = 0;
float y = 30;
float a = random(10,530);
float b = random(10,200);
float xspeed = 30;
float yspeed = 30;
float aspeed = 30;
float bspeed = 25;
void setup() {
  size(600,340);
  sheldon = loadImage("bazinga.png");
  ball = loadImage("ball.png");
  ball2 = loadImage("ball2.png");
  smooth();
}
 
void draw() {
  
  image(sheldon,0,0,width,height);
 
 
  image(ball,x,y,48.3,60);
   x = x + xspeed;
   y = y + yspeed;
   if ((x > 539) || (x < 7)) {
   xspeed = xspeed * -1;
    }
    if ((y > 200) || (y < 1)) {
  
    
  yspeed = yspeed * -1;}
 
 
  image(ball2,a,b,50,50);
  a = a + aspeed;
  b = b + bspeed;
 
  if ((a > 537) || (a < 10)) {
   aspeed = aspeed * -1;
     
  }
  if ((b > 200) || (b <0)) {
  
    
   bspeed = bspeed * -1;}
  frameRate(5);
  PFont theFont1;
  theFont1=createFont("JasmineUPC",30);
  textFont(theFont1);
  fill(255,255,0);
  textAlign(LEFT);
  textSize(random(15,40));
  if(mouseX<=width/2){
    text("Bazinga",80,50);
  }
  PFont theFont2;
  theFont2=createFont("JasmineUPC",30);
  textFont(theFont2);
  fill(255,0,0);
  textAlign(LEFT);
  textSize(random(30,40));
  
  if(mouseX>width/2){
  text("Bazinga",450,250);
  }
  
}

