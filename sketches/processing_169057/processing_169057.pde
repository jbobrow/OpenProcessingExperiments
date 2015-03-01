
float yoff = 0.0;        

void setup() {
  size(900, 360);
}

void draw() {
  background(0);

  fill(255);
 
  beginShape(); 
  
  float xoff = 0;       
  
  
  
  for (float x = 0; x <= width; x += 10) {
     
    float y = map(noise(xoff, yoff), 0, 1, 400,50); 
    
    
    vertex(x, y); 
    
    xoff += 0.05;
  }
  
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);

  
  noStroke();
  pushMatrix();
  translate(width*0.2, height*0.5);
  rotate(frameCount / 200.0);
  star(0, 0, 80, 100, 30); 
  popMatrix();
  
  noStroke();
  pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(frameCount / 50.0);
  star(0, 0, 80, 100, 40); 
  popMatrix();
  
  noStroke();
  pushMatrix();
  translate(width*0.8, height*0.5);
  rotate(frameCount / -100.0);
  star(0, 0, 80, 100, 50); 
  popMatrix();
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);

noStroke();
rect(width*0.25, height*0.1, width * 0.5, height * 0.8);
stroke(255);

 

}
