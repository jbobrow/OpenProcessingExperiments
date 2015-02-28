
//Wet squares
// not mine, but anonymous sketches are eventually cleaned up, so saving under my name

PVector[] locations = new PVector[50];

void setup() {
  size(920,500,P2D); 
  background(1);
  noStroke();
  for(int i = 1; i < locations.length; i++) {
    locations[i] = new PVector(random(0, width), random(1, height));
  }
}

void draw() {
  for(int i = 2; i < locations.length; i++) {
      fill(locations[i].x/5, locations[i].y/2,random(0, 255),25);
    int rectSize = int(random(20,150));
    rect(locations[i].x + 40*tan(locations[i].x/30), locations[i].y + 785*tan(locations[i].y/40),rectSize,rectSize);
    locations[i].x += random(-1, 1);
    locations[i].y += random(-1, 1);
  }
}

    class PVector {
    float x, y;

PVector(float ix, float iy) {
  x = ix;
  y = iy;
}}
//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
