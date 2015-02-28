
PImage spaceship; 
float x,y;   
float rot;   

void setup() {
  size(500,500);
  
  spaceship = loadImage("space.jpg");
  x = 0.0;
  y = width/2.0;
  rot = 0.0;
}

void draw() {
  background(255);
  
  translate(x,y);
  rotate(rot);
  
  image(spaceship,0,0); 
  
  x += 1.0;
  rot += 0.02;
  if (x > width+spaceship.width) {
    x = -spaceship.width;
  }
}

