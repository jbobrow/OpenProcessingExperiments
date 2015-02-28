
PImage p1; 
PImage p2;
PImage destination; 
color c, c2, newpixel;
int shifter = 100; 
boolean click;

void setup() {
  size(300, 201);
  background(255);
  p1 = loadImage("flowers.jpg");
  p2 = loadImage("brian.jpg");
  destination = createImage(width, height, RGB);
}

void draw() {
  p1.loadPixels();
  p2.loadPixels();
  destination.loadPixels();
  shifter ++; 
  if (shifter >= 100) {
    shifter = 0;
  }  
  for (int i = 0; i < p1.width; i ++) {
    for (int j = 0; j < p1.height; j ++) {
      c= p1.get(i, j); 
      c2= p2.get(i, j); 
      if (saturation(c2) < shifter) {
        newpixel =  c;
      }
      else {
        newpixel =  c2;
      }
      destination.set(i, j, newpixel); 
    }
  }
  destination.updatePixels();
  image(destination, 0, 0);
}


