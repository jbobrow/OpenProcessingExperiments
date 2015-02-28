
int spread;
float phase;

void setup(){
  spread = 100;
  phase = 0;
  size(500, 500, P2D);
  background(0);
}

void draw(){
  float x, y, m, n;
  float count, dots;
  background (0);
  // spread controls the spacing of the dots
  // uncomment to make spirals
  spread = (spread+2) %150;
  // phase controls the rotational offset of the dots
  phase = (phase + 0.3) % TWO_PI;
  stroke(000,000,255);
  strokeWeight(10);
  count = 0;
  dots = 10;
  while(count < dots){
    x = sin(1/dots * count * TWO_PI + phase);
    y = cos(1/dots * count * TWO_PI + phase);
    point(x*spread + 200, y*spread + 200);
    count++;
    
  }
}

