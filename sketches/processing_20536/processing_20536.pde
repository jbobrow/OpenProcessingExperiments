
PImage Space;

void setup() {
  size(300,299);
  Space = loadImage("Space.jpg");
  background(50);
  smooth();
}

int r,g,b = 0;
int cell = 10;

void draw() {
  for(int y=cell; y <= 299; y+=cell) {    
    for(int x=cell; x <= 299; x+=cell) {
      
      noStroke();

      color myColor = Space.get(x,y);
      fill(myColor,20);

      float radius = cell * (brightness(Space.pixels[x + (y * 300)]) / 255);
      ellipse(x,y,radius,radius);
    }
  }
}


