
/*
KrazyKranes
Anna Lotko
CTIN 544
1/2/12

The motion of the cranes relies on the mouse's movement
The cranes change color and stroke weight randomly

*/

void setup() {
  smooth();
  size(1000,1000);
  
}

void draw() {
  background(255);
  
  
  translate(50,50);

  
  for (int i=0; i<width; i+=100){
    for (int j=0; j<height; j+=100) {

      pushMatrix();
        
      float a = atan2(mouseY-i, mouseX-j);
      translate(i,j);

      pushMatrix();
      rotate(a);
      float rR = random(100, 255);
      float bB = random(100, 255);
      float aA = random(0, 4);
      

      translate(-50, -50);
      
      crane(rR, bB, aA);
         
      popMatrix();

      popMatrix();  
    }
  }
}


void crane(float r, float b, float s) {
  
  fill(r, b, 0);
  
  strokeWeight(s);
  
  //A
  beginShape();
  vertex(83.75,6.31);
  vertex(43.56,40.88);
  vertex(41.42,52.46);
  vertex(52.92,55.01);
  endShape(CLOSE);


  //B
  beginShape();
  vertex(83.75,6.31);
  vertex(52.92,55.01);
  vertex(71.9,61.85);
  endShape(CLOSE);
  
  //C
  beginShape();
  vertex(98.81,49.69);
  vertex(82.68,36.99);
  vertex(78.97,40.02);
  endShape(CLOSE);
  
  //D
  beginShape();
  vertex(82.2,43.13);
  vertex(74.13,79.27);
  vertex(63.72,73.1);
  vertex(78.34,43.13);
  endShape(CLOSE);
  
  //E
  beginShape();
  vertex(47.55,47.27);
  vertex(65.08,58.11);
  vertex(60.95,64.42);
  endShape(CLOSE);
  
  //F
  beginShape();
  vertex(5.66,13.25);
  vertex(41.42,52.46);
  vertex(32.97,59.42);
  endShape(CLOSE);
  
  //G
  beginShape();
  vertex(47.05,46.62);
  vertex(60.95,64.42);
  vertex(65.85,69.63);
  vertex(32.97,59.42);
  endShape(CLOSE);
  
  //H
  beginShape();
  vertex(98.81,49.69);
  vertex(76.96,37.99);
  vertex(57.47,68.83);
  vertex(67.96,82.42);
  vertex(78.34,43.25);
  endShape(CLOSE);
  
  //I
  beginShape();
  vertex(67.96,82.42);
  vertex(58.22,75.7);
  vertex(66.33,70.18);
  endShape(CLOSE);
  
  //J
  beginShape();
  vertex(32.97,59.42);
  vertex(23.6,63.1);
  vertex(3.19,87.57);
  vertex(48.2,64.17);
  endShape(CLOSE);
  
  //K
  beginShape();
  vertex(48.2,64.17);
  vertex(3.19,87.57);
  vertex(58.22,75.7);
  vertex(66.33,70.18);
  endShape(CLOSE);
}



