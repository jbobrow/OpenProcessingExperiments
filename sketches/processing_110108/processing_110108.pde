
//import processing.pdf.*;

float spacing;
float unitSize = 40;

void setup() {
  size (600,600);
  background(255);
  noLoop();
  
  //beginRecord(PDF, "wallpaper.pdf");
}

void draw () {
  stroke(255);
  strokeWeight(4);
  
  oneSixth one = new oneSixth();
  
  float xIncrement = 5*unitSize;
  float yIncrement = 5*unitSize*sqrt(3)/2;
  for (int y=0; y<((height/yIncrement)+1); y++){
    translate(float(y%2)*5*unitSize/2,float(y)*yIncrement);
    for (int x=0; x<((width/xIncrement)+1); x++){
      translate(float(x)*xIncrement,0);
      for (int i=0; i<6; i++){
        pushMatrix();
        rotate(float(i)/6*TWO_PI);
        one.drawIt();
        popMatrix();
      }
      translate(-float(x)*xIncrement,0);
    }
    translate(-float(y%2)*5*unitSize/2,-float(y)*yIncrement);
  }
  
  //endRecord();
}

class oneSixth {
 void drawIt() {
  fill(0,0,255);
  beginShape();
  vertex(0,0);
  vertex(unitSize/2,unitSize*sqrt(3)/2);
  vertex(unitSize,0);
  endShape(CLOSE);
  
  fill(80,160,255);
  beginShape();
  vertex(unitSize,0);
  vertex(3*unitSize/2,unitSize*sqrt(3)/2);
  vertex(unitSize/2,unitSize*sqrt(3)/2);
  endShape(CLOSE);

  pushMatrix();
  translate(3*unitSize/2,unitSize*sqrt(3)/2);
  beginShape();
  vertex(unitSize,0);
  vertex(3*unitSize/2,unitSize*sqrt(3)/2);
  vertex(unitSize/2,unitSize*sqrt(3)/2);
  endShape(CLOSE);
  popMatrix();
  
  fill(180,230,255);
  for (int a=0; a<5; a++){
    pushMatrix();
    translate(3*unitSize/2, unitSize*sqrt(3)/2);
    rotate((float(a)/6)*TWO_PI);
    beginShape();
    vertex(-unitSize/2,-unitSize*sqrt(3)/2);
    vertex(0,0);
    vertex(unitSize/2,-unitSize*sqrt(3)/2);
    endShape(CLOSE);
    popMatrix();
  }
 }
}
