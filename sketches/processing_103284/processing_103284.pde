
// Nathan Allen
// 7/8/13
// PROJECT Happy Face: [Progect that includes a face that follows your mouse and turns happy when you click]
// References: Sample code from Digital Media Academy
void setup () {
  background(0); 
  size (1000, 1000); 
  strokeWeight(3); 
}
void draw() {
  background(240);
  fill(200);
 ellipse (mouseX, mouseY, 200, 200);
  ellipse (mouseX+40, mouseY-30, 30, 30);
   ellipse (mouseX-40, mouseY-30, 30, 30);
   ellipse (mouseX+40, mouseY-30, 1, 1);
   ellipse (mouseX-40, mouseY-30, 1, 1);
   rect (mouseX-35, mouseY+30, 70, 1);
  if (mousePressed == true) {
  background (0, 100, 100);
  fill (228, 228, 0);
    ellipse (mouseX, mouseY, 200, 200);
    fill (228)
    ellipse (mouseX+40, mouseY-30, 30, 50);
     ellipse (mouseX-40, mouseY-30, 30, 50);
      fill (0, 125, 225);
      ellipse (mouseX+40, mouseY-30, 30, 30);
     ellipse (mouseX-40, mouseY-30, 30, 30);
     ellipse (mouseX+40, mouseY-30, 1, 1);
   ellipse (mouseX-40, mouseY-30, 1, 1);
    fill (228, 228, 0);
   arc (mouseX, mouseY+25, 100, 88, 0, radians (180));
  }
}
