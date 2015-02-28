
float amp2 = 0;float amp = 100; float phase = 0; int elements = 50;float bg ;float bgSpeed =0.9;
float baran;
void setup() {
  size(1000, 520);
  frameRate(25);
  smooth();
  colorMode(HSB, 200);
}
void draw() {
  baran += (bgSpeed*((int)random(5)));
  if (baran > 200) {
    bgSpeed = random(200);
  }
  fill(0, baran);
  noStroke();rect(0, 0, width, height);bg++;
  phase = phase + .05; amp2 = amp2 + 0.02; 
  float spacing = TWO_PI/elements;
  translate(width*0.5, height*0.5);
  rotate(-HALF_PI);for (int i = 0; i < elements;i++) {
    stroke(baran, 200, 150);
    fill(bg, 70);strokeWeight(0.3);
    rect(sin(spacing*10)*(cos(spacing*i)*(amp*1)), 
    (sin(spacing*i)*(amp*0.50)), cos(spacing*(i+1))*(sin(spacing*(i+1)*phase)*(amp*1)), 
    (sin(spacing*i)*(amp*2.0))); 
    rotate((baran/10000)+phase*0.03);}}
