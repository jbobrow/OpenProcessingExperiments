
void setup() {
  size(690, 350);
  smooth();
  noStroke();

}

void draw() {
  background(238,28,38);
  for (int i = 25; i < width ; i += 135) {
     for (int j = 85; j < width ; j += 155) {


    int gray = int( 102);

    float scalar = 1.0;

    eye(i, j);
    
     }

  } 

}


void eye(int x, int y) {

  pushMatrix();
  fill(255);
  translate(x, y);
  beginShape();
  vertex(0, 20);
  bezierVertex(25, -15, 65, -15, 90, 20);
  bezierVertex(65, 55, 25, 55, 0, 20);
  endShape();  
  
  fill(111,178,223);
  ellipse(45,20,45,45);
  fill(30,30,30,210);
  ellipse(45,20,20,20);
  
if (mousePressed == true) {

  fill(70,250);
  beginShape();
  vertex(0, 20);
  bezierVertex(25, -16, 65, -16, 90, 20);
  bezierVertex(65, 56, 25, 56, 0, 20);
  endShape();  
  stroke(0);
  strokeWeight(2.5);
  strokeCap(SQUARE);
  bezier(0, 20, 30, 34, 60, 34, 90, 20);
  noStroke();
  

  }

  popMatrix();
}


