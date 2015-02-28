
float a = 0;

float c = 0;
float d = 0;

float col = 0;

void setup() {
  background(255);
  colorMode(HSB,100);
  size(500,400);
  smooth();
  strokeWeight(3);
}

void draw(){
  stroke(col, 80, 80,20);
  
  float x0 = map(sin(a), -1, 1, 20, width-20);
  float y0 = map(cos(a), -1, 1, 20, height - 20);
  
   
  float x2 = map(sin(c)*sin(c), -1, 1, 20, width - 20);
  float y2 = map(cos(d), -1, 1, 20, height - 20);
  
  line(x0, y0, x2, y2);
  
  a = a + 0.03;
  c = c + 0.07;
  d = d + 0.09;
  
  col = col + 1;
  if( col > 100) {
    col = 0;
  }
}

  
