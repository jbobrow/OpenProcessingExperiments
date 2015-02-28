
float theta = 0.0;
float t = 60;

void setup() {
  size(500, 500, P3D);
  smooth();
}

void draw() {
  background(127);
  // Big Cube
  stroke(0);
    
  translate(width/2, height/2);
  rotateY(theta);
  //rotateX(PI*mouseY/height);
  //rotateY(PI*mouseX/width);
  
  beginShape(QUADS);
  fill(255, 150);
  vertex(-t, -t, t);
  vertex(-t, t, t);
  vertex(t, t, t);
  vertex(t, -t, t);
  
  fill(150, 150);
  vertex(-t, -t, t);
  vertex(-t, t, t);
  vertex(-t, t, -t);
  vertex(-t, -t, -t);
  
  fill(255, 150);
  vertex(t, -t, t);
  vertex(t, t, t);
  vertex(t, t, -t);
  vertex(t, -t, -t);
  
  fill(150, 150);
  vertex(-t, -t, -t);
  vertex(t, -t, -t);
  vertex(t, t, -t);
  vertex(-t, t, -t);
  
  fill(255, 150);
  vertex(-t, -t, t);
  vertex(t, -t, t);
  vertex(t, -t, -t);
  vertex(-t, -t, -t);
  
  fill(150, 150);
  vertex(-t, t, t);
  vertex(t, t, t);
  vertex(t, t, -t);
  vertex(-t, t, -t);  
  endShape();
  
  // 2) Green cube, rotate around big cube
  for(float i = 0; i < TWO_PI; i += 0.6) {
    pushMatrix();      // 1)
    rotateY(-theta*2+i);
    translate(100, 0);
    fill(50, 255, 200);
    box(20, 20, 20);
  
    // 3) Yellow cube, rotate around small cube
    pushMatrix();    // 2)
    rotateY(-theta*2);
    translate(30, 0);
    fill(200, 200, 0);
    box(6, 6, 6);
    popMatrix();    // 1.
  }
  
 
  for (float j = 0; j < TWO_PI; j += 0.6) { 
    pushMatrix();
    rotateY(theta*2+j);
    translate(150, 0);
    fill(120, 50, 200);
    box(30, 30, 30);
    
    pushMatrix();
    rotateY(theta*2);
    translate(20, 0);
    fill(180, 80, 50);
    box(8, 8, 8);
    popMatrix();
  }
  
  theta += 0.01;
}

