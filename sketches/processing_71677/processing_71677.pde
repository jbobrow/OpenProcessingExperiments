
boolean petting = false;
PFont font;

void setup() {
  size (500, 500);
  background (184, 59, 34);
  font = createFont("Helvetica", 16);
}

void draw() {
  background (184, 59, 34);
  // petting
  if (mouseX > 100 && mouseX < 300 && mouseY > 150 && mouseY < 400)
    petting = true;
  else petting = false;
  
  // face
  smooth();
  fill(202, 202, 202);
  beginShape();
  vertex (250, 150);
  bezierVertex(400, 150, 400, 380, 300, 400);
  bezierVertex(260, 430, 230, 430, 200, 400);
  bezierVertex(100, 400, 80, 150, 250, 150);
  endShape();

  //right ear
  fill(17, 16, 18);
  beginShape();
  curveVertex(300, 220);
  curveVertex(300, 170); // ear starts at top of head
  curveVertex(410, 150); // top tip of right ear
  curveVertex(380, 250); // curve at bottom of ear
  curveVertex(350, 250); // ending point
  curveVertex(400, 250);
  endShape();

  //left ear
  beginShape();
  curveVertex(100, 220);
  curveVertex(200, 170); // ear starts at top of head
  curveVertex(90, 150); // top tip of right ear
  curveVertex(120, 250); // curve at bottom of ear
  curveVertex(150, 250); // ending point
  curveVertex(100, 250);
  endShape();

  //nose
  fill(235, 136, 171);
  beginShape();
  vertex(250, 350);
  bezierVertex(280, 350, 260, 360, 250, 370); // right half of nose
  bezierVertex(200, 360, 228, 347, 250, 350); // left half of nose
  endShape();

  // mouth
  strokeWeight(3);
  noFill();
  arc(260, 371, 30, 30, 0, PI); 
  arc(230, 371, 30, 30, 0, PI); 

  // whiskers
  line(300, 360, 370, 350); // R
  line(298, 368, 366, 380); // R
  line(190, 360, 120, 350); // L
  line(192, 368, 120, 380); // L

  //eyes, depending on if petting
  if (petting == false) {
    fill(17, 16, 18);
    ellipse(190, 320, 30, 30);
    ellipse(300, 320, 30, 30);
  }
  
  if (petting == true) {
    noFill();
    arc(190, 320, 30, 30, 0, PI);
    arc(300, 320, 30, 30, 0, PI);
    textFont(font, 32);
    text("mrow!", 210, 80);
  }
}
