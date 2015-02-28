
 void setup () {
   size(400, 300);
   strokeWeight(1);
   smooth();
 }
void draw() {
 frameRate(30);
 fill (mouseX+50, mouseY-40, mouseY+100);
 background (mouseX, 200, mouseY-20);

 //ellipse(mouseX, mouseY, 3, 3);
 //line(mouseX, mouseY, pmouseX, pmouseY);
 beginShape();
  vertex(mouseX, mouseY); // first point
  bezierVertex(mouseX+25, mouseY+25, 100, mouseX-50, mouseY-50, 20);
  bezierVertex(mouseX+20, mouseY+130, 75, 140, 120, 120);
  endShape();
}



