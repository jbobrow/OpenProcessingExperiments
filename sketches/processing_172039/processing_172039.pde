
void setup() {
 size(600, 600);
 background(#3948C4);
 colorMode(HSB);
}


void leaf_1(int xPos, int yPos) {
 fill(random(0,53), random(50,100), random(0,100)); 
 noStroke();
 float angle = random(0,2*PI);
 
 pushMatrix();
 rotate(angle);
 beginShape();
 vertex(xPos, yPos);
 bezierVertex(xPos+10, yPos+30, xPos+60, yPos+30, xPos+50, yPos);
 endShape();
 
 beginShape();
 vertex(xPos, yPos);
 bezierVertex(xPos+10, yPos-30, xPos+60, yPos-30, xPos+50, yPos);
 endShape();
 popMatrix();
}

void leaf_2(int xPos, int yPos) {
 fill(random(0,53), random(50,100), random(0,100)); 
 noStroke();
 float angle = random(0,2*PI);
 
 pushMatrix();
 rotate(angle);
 beginShape();
 vertex(xPos, yPos);
 bezierVertex(xPos+20, yPos+20, xPos+60, yPos+30, xPos+50, yPos);
 endShape();
 
 beginShape();
 vertex(xPos, yPos);
 bezierVertex(xPos+20, yPos-20, xPos+60, yPos-30, xPos+50, yPos);
 endShape();
 popMatrix();
}

void leaf_3(int xPos, int yPos) {
 fill(random(0,53), random(50,100), random(0,100)); 
 noStroke();
 float angle = random(0,2*PI);
 
 pushMatrix();
 rotate(angle);
 beginShape();
 vertex(xPos, yPos);
 bezierVertex(xPos+10, yPos+30, xPos+60, yPos+30, xPos+70, yPos);
 endShape();
 
 beginShape();
 vertex(xPos, yPos);
 bezierVertex(xPos+10, yPos-30, xPos+60, yPos-30, xPos+70, yPos);
 endShape();
 popMatrix();
}

void draw() {
  if(mousePressed) {
     leaf_1(mouseX + (int)random(0, 50), mouseY + (int)random(0, 50));
     leaf_2(mouseX + (int)random(0, 50), mouseY + (int)random(0, 50));
     leaf_3(mouseX + (int)random(0, 50), mouseY + (int)random(0, 50));
  }
}
