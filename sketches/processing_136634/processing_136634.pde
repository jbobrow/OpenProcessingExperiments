
float yoff = 0.0;  

PImage img;


void setup() {
  size(600, 400);
  img = loadImage("volcano.jpg");
}

void draw() {
  background(img);
  stroke(144, 0, 0, 90);
  strokeWeight(10);
  fill(255, 0, 0);
  
  // polygon
  beginShape(); 
  float xoff = 0;
  
  //horizontal
  for (float x = 0; x <= width; x += 10) {
    //y value
    float y = map(noise(xoff, yoff), 0, 1, 175, 300);
    vertex(x, y); 
    
    //noise increment x
    xoff += 0.05;
  }
  //noise increment y
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
}


