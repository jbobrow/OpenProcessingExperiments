
int x ;
int y;
int w;
int h;
int skiffX;
int skiffY;
int skiffW;
int skiffH;
int skiffStart;
int skiffEnd;
 
void setup() {
  size(800,800);
  background(191,239,255);
  smooth();
  x = 600;
  y = 500;
  w = 45;
  h = 120;
  skiffX = 400;
  skiffY = 450;
  skiffW = skiffX;
}
 
void draw() {
// background(191,239,255);
 
  //draw base
  fill(139,69,19);
  beginShape();
  vertex(skiffX,skiffY);
  arc(skiffX,skiffY,skiffW+100,skiffY,0,PI);
  endShape(CLOSE);
  fill(255,190,0);
  beginShape();
  vertex(skiffX+10,skiffY+10);
  arc(skiffX-30,skiffY,skiffW+80,skiffY,0,PI);
  endShape(CLOSE);
 
  //draw mast
  fill(103,61,22);
  rect(skiffX-5,skiffY-200,10,200);
  fill(103,61,22);
  quad(skiffX-45, skiffY,skiffX+45,skiffY,skiffX+40,skiffY-10,skiffX-40,skiffY-10);
 
  //draw sail
 
 fill(255,255,0);
 triangle(skiffX,skiffY-60,skiffX+90,skiffY-50,skiffX,skiffY-200);
 
}
