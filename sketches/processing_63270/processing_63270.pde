
float h, w;
 
void setup () {
 size(500, 500);
 w = width/2;
 h = height/2;
 smooth();
}
 
void draw () {
 
  
  background (255);
   
   if (mouseX <= w && mouseY <= h) {
   fill(20);
   noStroke();
   rect(0, 0, w, h);
 }
 else if (mouseX >=w && mouseY <= h) {
   fill(80);
   noStroke();
   rect(w,0,w,h);
 }
 else if(mouseX <=w && mouseY >= h) {
   fill(140);
   noStroke();
   rect(0,h,w,h);
 }
 else if(mouseX >= w && mouseY >= h) {
   fill(200);
   noStroke();
   rect(w,h,w,h);
 }
 
 
 stroke(4, 255, 0);
 line(width/2, 0, width/2, height);
 line(0, height/2, width, height/2);
   }


