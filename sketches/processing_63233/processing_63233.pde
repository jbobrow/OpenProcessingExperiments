
float h, w;

void setup () {
 size(500, 500);
 background (30, 30, 30);
 w = width/2;
 h = height/2;
 smooth();
}

void draw () {
 background (10, 10, 40);



 if (mouseX <= w && mouseY <= h) {
   fill(30, 80, 230);
   noStroke();
   rect(0, 0, w, h);
 }
 else if (mouseX >=w && mouseY <= h) {
   fill(130,40,219);
   noStroke();
   rect(w,0,w,h);
 }
 else if(mouseX <=w && mouseY >= h) {
   fill(200,100,210);
   noStroke();
   rect(0,h,w,h);
 }
 else if(mouseX >= w && mouseY >= h) {
   fill(58,44,100);
   noStroke();
   rect(w,h,w,h);
 }


 stroke(0, 0, 100);
 line(width/2, 0, width/2, height);
 line(0, height/2, width, height/2);
   }


