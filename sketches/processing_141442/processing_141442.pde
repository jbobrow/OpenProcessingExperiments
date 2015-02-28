

void setup() {
  background(0);
  size (450, 400); //sie
 
  photo = loadImage("eagles.jpg"); 
}


void draw() { 
  image(photo, 0, 0);  // Display at full opacity
  float dx = (mouseX-photo.width/2) - offset;
  offset += dx * easing; 
  tint(255, 127);  // Display at half opacity
  image(photo, offset, 0);
}
