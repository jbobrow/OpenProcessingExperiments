

PFont Mont;
float g = random (0, 100);
float r = random (0, 100);
float b = random (0, 100);
  
  PImage GMAmask;
  
void setup () {
  size (640,480);
  background(255);
  smooth();

  GMAmask = loadImage("GMAmask.png");
  Mont = loadFont("Mont.vlw");
}

void draw() {
  
  float n = noise(0.15);
  float a = map(n, 0, 1, mouseX, -mouseY);
pushMatrix();
   translate(90, 0);
  strokeWeight(.15);
  noFill();
  stroke(r++/3, g--*4, b++/4, 45);
  
 for(int x = 0 ; x < width; x+=n++) {
    for(int y = 0 ; y < height; y+=n++) {
      line(x, y, a+x, a+y);
      rotate(radians(a)); 
}
  }
popMatrix();
 image(GMAmask, 0,0);
 textFont(Mont);
 text("GMA", 175,350);
 stroke(255);
 strokeWeight(6);
 line(200, 375, 440, 375);
}






