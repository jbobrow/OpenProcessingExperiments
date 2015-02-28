
float N_PI = 5 * TWO_PI;

void setup() {
  size(500, 500);
  strokeCap(SQUARE);
  colorMode(HSB);
  noFill();
}
void draw() {
  background(0);
  float fc = frameCount*0.001;
  for(int r=250; r<400; r+=20) {
    float r001 = r*0.01;
    float a = N_PI*noise(r001, fc);
    float b = N_PI*noise(fc * 2, r001);
    if(abs(a-b) > PI) {
      strokeWeight(8);
      stroke(color(2*r % 255, 255, 255));
    } else {
      strokeWeight(4);
      stroke(50);
    }
    arc(250, 250, r, r, min(a,b), max(a,b));    
  }
}
