
float a=0.1;
float y=0.1;

void setup() {
  size(360,360);
  colorMode(HSB, 500, 200, 100);
  //noLoop();
}

void draw() {
  background(150);
  noStroke();
  for(int x=0; x<200; x=x+5) {
    float y=sin(radians(x+frameCount))*0.3*5*x;
    fill(HSB, random(x+50), 100, random(200, 500));
    ellipse(x+80, x+80, y, y);
  }
}


                                
