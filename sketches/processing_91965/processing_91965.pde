
void setup() {
  size(600, 600);
  background(0);
}

void draw() {
  float m = millis();
  float s = millis()/20;
  float h =millis();



  for ( int i=0;i< width; i+= 100) {
    for ( int j=0; j<height;j += 100) {
      noFill();
      float a = map ( m/50, 0, width, 0, 255);
      float b = map ( m/100, 0, height, 0, 255);
      stroke(a, 0, 0);
      ellipse (i, j, 100, 100);
    }
  } 
  for ( int q=20;q< width; q+= 75) {
    for ( int w=20; w<height;w += 75) {
      noFill();
      float a = map (s/10*-1, 0, width, 0, 255);
      float b = map ( s, 0, height, 0, 255);
      stroke(0, b, 0);
      ellipse (q, w, 100, 100);
    }
  }for ( int e=20;e< width; e+= 75) {
    for ( int r=20; r<height;r += 75) {
      noFill();
      float a = map (s/10*-1, 0, width, 0, 255);
      float c = map ( h/100, 0, height, 0, 255);
      stroke(0, 0, c);
      ellipse (e, r, 250, 250);
}}}


