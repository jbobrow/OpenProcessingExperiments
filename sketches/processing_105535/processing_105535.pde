

PImage pattern;

void setup() {
  size(600, 600);
  background (86,184,255);

  pattern = loadImage("pattern.png");
 // size(pattern.width/100, pattern.height/100);
}

void draw() {
noStroke();
  //fill(0, 0, 0);
  for (int i=0; i<width; i+=100) {
    for (int j=0; j<height; j+=20) {
      float distance = dist (j, i, mouseX*2, mouseY*2);
      float image = map(distance,0,0,1,30);
      image (pattern, 0, distance/2);
      image(pattern, distance, 0);
      image (pattern, mouseX, distance);
        //  float distance = dist(i,j,mouseY,mouseX);
        //float radius = map(distance,0,50,1,30);
        //image (pattern,x,y);
      }
    }
  }


