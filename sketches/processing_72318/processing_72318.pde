
//SelinErgeneli  
//Introduction to Digital Media Fall 2012
//SectionB
//9/11/2012


float randomDiameter=5;
int growingDiameter=50;
int randomBlue=0;
boolean boolGrowing=false;

void setup() {

  size(1200, 600);
  background(0, 60, 80);
  stroke(3);
}

void draw() {
  fill(150, 100, 150); 
  randomDiameter=random(100);
  beginShape();
  vertex(mouseX, 70);
  vertex(randomDiameter, randomDiameter);
  vertex(mouseY, mouseX);
  vertex(mouseX, 90);
  endShape();

fill(55,227,225);
  ellipse(mouseY, mouseX, randomDiameter, randomDiameter);

  if (boolGrowing==true) {
    if (growingDiameter<50) {
      growingDiameter++;
    }
  }
  else {
    growingDiameter=5;
    
    fill(85,129,35);
    smooth();
    rect(mouseX,mouseY,randomDiameter, 10);
    rect(mouseY,mouseX,randomDiameter,10);
    
  }
}




void mouseClicked() {
}
