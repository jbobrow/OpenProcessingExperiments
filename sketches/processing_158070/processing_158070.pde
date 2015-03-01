
int tono=0;
float px=0;
void setup() {
   size (800,600);
 }
 
 void draw() {
   tono++;
   if(tono>255) {
     tono=0;}
 if(mousePressed) {
   px++;
   noStroke();
   fill(tono);
   ellipse(mouseX,mouseY,random(250),random(250));
 }
 }
