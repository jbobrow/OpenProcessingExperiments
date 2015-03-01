
float px=0;
void setup() {
   size (800,600);
 }
 
 void draw() {)
mousePressed() {
   px+=.001;
   noStroke();
   fill(noise(px)*255,noise(px,px)*255,noise(px,px,px)*255);
   ellipse(mouseX,mouseY,px,px);
 }
 
