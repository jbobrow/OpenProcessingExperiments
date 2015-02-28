
float yoff = 0.0;        

void setup() {
  size(640, 360);
}

void draw() {
  background(153, 255, 204);
  fill(255, 102, 102);
  noStroke();
  smooth();
  beginShape(); 
  
  
  float xoff = yoff;   
   for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff), 0, 1, 200,300);   
        
    vertex(x, y);
    xoff += 0.15;
  }
  
  
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
}

