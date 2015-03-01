
float px=0;
void setup() {
   size (800,600);
 }
 
 void draw() {
 if(mousePressed) {
   px++;
   noStroke();
   fill((random(255)),(random(255)),random(255));
   ellipse(mouseX,mouseY,random(250),random(250));
 }
 }
