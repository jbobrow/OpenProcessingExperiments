
PImage img;
//sets image varaiable

float offset = 0;
//sets float variable offset to 0
float easing = 0.05;
//sets easing varaible to 0.05


void setup() {
  size(500, 400);
  //sets the size of the sketch to 500 px in width and 400 px in height
  
  img = loadImage("map2.png");  
  // Load an image into the program 
}

void draw() { 
  image(img, 0, 0);  
  // Display at full opacity
  float dx = (mouseX-img.width/2) - offset;
  //equation determins the location for the float of this image
  offset += dx * easing; 
  tint(255, 127);  
  // Display at half opacity
  image(img, offset, 0);
}



