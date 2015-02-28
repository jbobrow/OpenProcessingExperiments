
PImage pic1;  // Declare variable "a" of type PImage
PImage pic2;

float yoff = 0.0;        // 2nd dimension of perlin noise

float easing = 0.05;

void setup() {
  size(640, 360);
   pic1 = loadImage("fish.png");
   pic2 = loadImage("shark.png");
}

void draw() {
  background(25);
 
 

 
 
  beginShape(); 
  float xoff = 0;       // Option #1: 2D Noise
  // float xoff = yoff; // Option #2: 1D Noise
  
  // Iterate over horizontal pixels
  for (float x = -5; x <= width; x += 50) {
    // Calculate a y value according to noise, map to 
    float y = map(noise(xoff, yoff), 0, 2, 50, 900); 
    // Option #1: 2D Noise
    // float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
  
    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff += 5;
       endShape();
  
  fill(69,132,158, 80);
  } 
  
  
  
  {
  if (mouseY < 50) {
     image(pic2, mouseX, mouseY);
 
  } 
  
  else {
     image(pic1, mouseX, mouseY);
  } 
 
}

  // increment y dimension for noise
  yoff += 0.03;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
}



