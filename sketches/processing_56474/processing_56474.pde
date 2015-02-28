
float x = 180;
float y = 400; 
float bodyHeight = 100; 
float neckHeight = 20; 
float radius = 80; 
float angle = 0.0; 
PImage img;

void setup() {
  size(360, 480); 
  img = loadImage("alpine.png");
  smooth();
  ellipseMode(RADIUS); 
  background(204); 
}

void draw() {
  image(img, 0, 0);
  x += random(-4, 4); 
  y += random(-1, 1);  
  
  neckHeight = 80 + sin(angle) * 30;
  angle +=0.05; 
  
  float ny = y - bodyHeight - neckHeight - radius; 
  
  stroke(102);
  line(x+2, y-bodyHeight, x+2, ny);
  line(x+12, y-bodyHeight, x+12, ny);
  line(x+22, y-bodyHeight, x+22, ny);
  
  line(x+12, ny, x-18, ny-43); 
  line(x+12, ny, x-18, ny-43);
  line(x+12, ny, x-42, ny-99); 
  line(x+12, ny, x-42, ny-99);
  line(x+12, ny, x-78, ny-15); 
  line(x+12, ny, x-78, ny-15); 
   
  fill(102);
  ellipse(x, y-33, 33, 33);
  fill(0); 
  rect(x-45, y-bodyHeight, 200, bodyHeight -33);
  fill(102); 
  rect(x-45, y-bodyHeight+17, 90, 6);
  
  fill(0);
  ellipse(x+12, ny, radius, radius); 
  fill(225); 
  ellipse(x+24, ny-6, 14, 14); 
  fill(0);
  ellipse(x+24, ny-6, 3, 3); 
}

