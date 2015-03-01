
PVector[] points;

void setup() {
  size(1250, 1250);
  points = new PVector[11];
  for(int i=0; i<points.length; i++) {
    points[i] = new PVector();
  }
}

void draw() {
  float f = frameCount * 0.1;
  float d;
  int count = points.length;
  loadPixels();
  for(int x=0; x<width; x++) {
    for(int y=0; y<height; y++) {
      d = 0;
      for(int i=0; i<count; i++) {
        d += sin(dist(x, y, points[i].x, points[i].y)*0.08);        
      }
      d /= points.length;
      pixels[x+y*width] = floor(d * 15 + f) % 7 == 0 ? #fef2f5 : #150427;
    }
  }
  updatePixels();
  for(int i=0; i<points.length; i++) {
    points[i].set(width/2 + width/2 * sin(frameCount*i*0.0011) * sin(frameCount*i*0.0017), 
      width/2 + width/2 * sin(frameCount*i*0.0013) * sin(frameCount*i*0.0019));
  }
}
