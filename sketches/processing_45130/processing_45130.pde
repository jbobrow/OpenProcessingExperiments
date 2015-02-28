
PShape fishnew;

 void setup () {
  smooth ();
  size(600,600);
  shapeMode(CENTER);
  fishnew = loadShape("fishnew.svg");
 }
 
void draw () {
  background(255);
  fill (255);
  ellipse(307, 307, 15, 15);
  strokeWeight(2);
  fill(70);
  ellipse(310, 550, 250, 500);  // body
  beginShape();
  vertex(220, 250);   // alt
  vertex(190, 160);   // sivri 
  vertex(260, 185);   // ust
  endShape();
  beginShape();
  vertex(360, 185);
  vertex(420, 160);
  vertex(390, 250);
  endShape(CLOSE);
  fill(150);
  ellipse(310, 270, 200, 200);  // face
  ellipse(240, 580, 70, 300);   // arms
  ellipse(380, 580, 70, 300);   // arms
  fill(0);
  line(340, 300, 440, 270);     // ust
  line(340, 315, 420, 340);     // alt
  line(345, 308, 440, 310);     // orta
  line(275, 300, 170, 270);
  line(275, 315, 195, 340);
  line(270, 308, 175, 310);
  // ellipse(307, 307, 15, 15);
  beginShape();
  vertex(308, 308);
  vertex(314, 300);
  vertex(320, 308);
  endShape(CLOSE);

  //right e

  righteye(width/2, height/2);
}

void righteye(int x, int y) {

  for(int i = 0; i < 360; i+=10) {
    pushMatrix();
    translate(x, y);
    rotate((2*PI/360) * i);

    popMatrix();
  }

  fill(255);
  ellipse(x+50, y-65, 60, 60); // white eyes

  int pX = (int) map(mouseX, 0, width, -21, 16);
  int pY = (int) map(mouseY, 0, height, -12, 18);

  fill(0);
  ellipse(x + 55 + pX, y -65 + pY, 20, 20);


  //left e

  lefteye(width/2, height/2);
}

void lefteye(int x, int y) {

  for(int i = 0; i < 360; i+=10) {
    pushMatrix();
    translate(x, y);
    rotate((2*PI/360) * i);

    popMatrix();
  }

  fill(255);
  ellipse(x-35, y-65, 60, 60); // white eyes
  

  int pX = (int) map(mouseX, 0, width, -21, 20);  // x'in limitleri
  int pY = (int) map(mouseY, 0, height, -12, 18);  // y'nin limitleri

  fill(0);
  ellipse(x -35 + pX, y -65 + pY, 20, 20);
  shape(fishnew, mouseX+50, mouseY);
}


