
void setup() {
  size (500, 500);
}

void draw() {
  noFill();
  background (13, 150, 90);
  stroke (255,200,155); 
  beginShape ();
    vertex(0, 290);
    bezierVertex(0, 300, 100, 325, 75, 250);
    vertex(75, 250);
    bezierVertex(60, 130, 120, 150, 150, 175);
    vertex(150, 178);
    bezierVertex(200, 230, 178, 150, 130, 100);
    vertex(130, 100);
    bezierVertex(75, 25, 150, 0, 250, 80);
    vertex(250, 80);
    bezierVertex(400, 175, 260, 125, 300, 225);
    vertex(270, 200);
    bezierVertex(275, 280, 160, 301, 200, 305);
    endShape();
  
}

