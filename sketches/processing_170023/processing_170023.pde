
float xnoise = 0, inc = 0.01;
float delta = 11;
void setup() {
  size(600,600);

}

void draw() {
    colorMode(RGB,255,255,255);
  background(51,50);
  noStroke();
  smooth();
  float radius = 1.0;
  
  delta = noise(xnoise)*20;
  for (int deg = 0; deg < 360*30; deg +=delta) {
      colorMode(HSB,360,100,100);
    fill( 226 , map(deg, 0, 360*10, 0,100),100);
    float angle = radians(deg);
    float sz = map(deg, 0, 360*20, 2,6);
    float x1 =350 + (cos(angle)*radius);
    float y1 =300 + (sin(angle)*radius);
    ellipse(x1,y1,sz,sz);
    
    float x2 = 250 + (sin(angle) *radius);
    float y2 = 300 + (cos(angle) *radius);
    
    ellipse(x2,y2,sz,sz);
    radius = radius + 0.5;
  }
  xnoise+=inc;
}
