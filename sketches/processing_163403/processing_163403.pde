
boolean on = false;

void setup (){
  size(500, 500);
}
 
void draw () {
 if(on) {
 stroke(255);
 strokeWeight(8);
 background(153,27,30);
 if((mouseX>0) && (mouseX<500)) {
   float R = mouseX;
   float G = mouseX;
   float B = -mouseX;
   background(R/2+153,G/3+27,B/7);
   if(R>255) {
     R = 255;
   }
   if (G>204) {
     G = 204;
   }
   if (B < 0) {
     B = 0;
   }
   if (R < 153) {
     R = 153;
   }
   if (G < 27) {
     G = 27;
   }
   if (B > 30) {
     B = 30;
   }
   fill(255);
   textSize(32);
   textAlign(CENTER, CENTER);
   text("USC", mouseX, mouseY);
 }
}
else {
  background(153,27,30);
}
}
void mousePressed(){
  on = !on;
}
