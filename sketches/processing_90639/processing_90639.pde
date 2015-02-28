
PImage img;
float opacity = 0; 
float x= 0;


void setup() {
  size(400, 450);
  img = loadImage("balloon.jpg");
}

void draw() {
  background(0);
  
  if (opacity < 255) { 
    opacity += 2;
  }
  
  x+=0.005;
  if (x > 1) {
    x=0;
  }
  
  scale(x);
  tint(255, opacity);
  image(img, 0, -40);
}



