
void setup() {
  size (400, 400);
}
 
 
void draw() {
  background (255,255,255);
 
  noFill();
  beginShape ();
  vertex(200, 200);
  bezierVertex(0, 80,300, 325, 75, 250);
  endShape();
 
  noFill();
  beginShape ();
  vertex(75, 250);
  bezierVertex(40, 99, 60, 90, 100, 90);
  endShape();
 
  noFill();
  beginShape ();
  vertex(100,90);
  bezierVertex(80, 100, 175, 150, 130, 100);
  endShape();
 
  noFill();
  beginShape ();
  vertex(130, 100);
  bezierVertex(75, 25, 150, 0, 100, 80);
  endShape();
   
  noFill();
  beginShape ();
  vertex(250, 80);
  bezierVertex(400, 175, 260, 125, 275, 225);
  endShape();
   
   noFill();
  beginShape ();
  vertex(275, 225);
  bezierVertex(275, 280, 275, 325, 230, 300);
  endShape();
}

