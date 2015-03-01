
void setup() {
  size(425, 600);
  background(153, 27, 30);
  beginShape();
    vertex(50, 100);
    vertex(300, 100);
    vertex(250,500);
    bezierVertex(212.5, 525, 137.5, 525, 100, 500);
    vertex(100,500);
    vertex(50,100);
   endShape();
  beginShape();
    fill(255,204,0);
    vertex(295, 140);
    bezierVertex(400, 105, 450, 200, 260, 420);
    vertex(265, 380);
    bezierVertex(260, 400, 470, 125, 292.5, 160 );
   endShape();
  ellipse(175,100,250,50);
textSize(64);
fill(153, 27, 30);
text("USC", 110, 250);
}

