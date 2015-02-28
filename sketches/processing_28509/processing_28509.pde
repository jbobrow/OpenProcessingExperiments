
void setup(){
  size(900,450);
  background(183,127,171);
frameRate(16);}

void draw () {
   fill(random(100,225),random(0,135));
   triangle(mouseX,mouseY,random(0,300),
 random(0,200),random(0,200),random(0,200));
  stroke(random(100,225),random (100,225));}
 void mousePressed(){
   stroke(random(0,100),random(100,130));}
 void keyPressed(){
   background(183,127,171);}
