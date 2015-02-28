
float amp2 = 0;
float amp = 100; 
float phase = 0; 
int elements = 1500;
void setup() {
  size(500,500);
  frameRate(25);
  smooth();
}
void draw() {

  phase = phase + .05;
  amp2 = amp2 + 0.2; 
  float spacing = TWO_PI/elements;
background(0);
translate(width*0.5,height*0.5);
  rotate(-HALF_PI);
  for (int i = 0; i < elements;i++) {
    stroke(0,100);
    strokeWeight(1);
    rect(sin(spacing*10)*(cos(spacing*i)*(amp*1.5)),(sin(spacing*i)*(amp*1.25)),cos(spacing*(i+1))*(sin(spacing*(i+1)*phase)*(amp*0.5)),(sin(spacing*i)*(amp*0.75)));
    rotate(phase*0.0007);} 
}
