
float Frames = 1;
void setup() {

  size(500, 500);
}

void draw() {
  
  //background(0);

  float rad = dist(100, 100, width/2, height/2);
  float colR = 0, colG = 0, colB = 0;
  colR += sin(frameCount / 50.0) * 205;
  colG += sin( frameCount / 60.0) * 255;
  colB += cos(frameCount/ 80.0) * 205;
 
  float dx = width/7 + rad * cos(PI * Frames);
  float dy = height/5 + rad * sin(PI/2 * Frames);
  
  
  pushMatrix();
  translate(width/ 2, height/ 2);
  fill(#FFFF00);
  
  pushMatrix();
  rotate(frameCount/ 55.0);
  ellipse(1, 1, 20,20);
 
  fill(colR, colG, colB);
   
  pushMatrix();
  translate(130, 80);
  rotate(frameCount/35.0);
  ellipse(0, 0, dx, dy);
  
  popMatrix();
  popMatrix();
  popMatrix();
  
  Frames += 0.25/8;
}


void keyPressed() {
  if (key == ' ') {
    saveFrame("myframe-####.png");
  }
}


