
float i, fase=0;
void setup() {
  size(800, 800);
  frameRate(30);
   noStroke();
}
void draw() {
  background(0);
  for ( i=0; i< 250; i += 0.05) {
  fill(255,0,0);
  ellipse((400*cos(2.9*i+PI/16*fase)/sqrt(1+i*i))+400,(400*sin(2.9*i+PI/16*fase)/sqrt(1+i*i))+400,3,3);
}
  fase= fase+1;
}

