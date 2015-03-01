
PShape girls;

float z = 0;

void setup() {
  frameRate(60);
  size(500, 500);
  noStroke();
  colorMode(RGB); // hue saturation brightness
  background(#ffffff);
  girls = loadShape("girls.svg");
}

void draw() {
  float x = 0;
  while (x < width) {
  float y = 0;
  while(y < height) {
  float co = 255 * noise(x/1000, y/1000, z);
  fill(co*random(1.5, 1.9), 150, 150);
  
    if (mousePressed == true) {
    ellipse(x, y, 70, 70);
    } else {
    rect(x, y, 30, 30);
    }
  
  y = y + 30;
  }    
  x = x + 30;
  }
  z = z + 0.014;
  translate(250, 235);
  float zoom = map(mouseX/1.5, 0, width, 0.2, 1.2);
  scale(zoom);
  shape(girls, -265, -65);
}




