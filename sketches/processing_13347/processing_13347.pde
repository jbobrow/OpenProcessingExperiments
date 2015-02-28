
void setup() {
  size(600, 400,P3D);
  
  smooth(); //anti-aliased
  
  background(#ff0099);
  stroke(#dddddd);
  strokeWeight(0.7);
  noFill();
  int sep = 40;
  float fact = 2.5;
  
    for (int i = 20; i < width; i = i+sep) {
       for (int j = 20; j < height; j = j+sep) {
         ellipseMode(RADIUS);
         ellipse(i, j, sep*fact, sep*fact );
       }
    }
    saveFrame("pix.tif");
  
}



