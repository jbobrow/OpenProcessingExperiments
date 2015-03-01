

float a = 0; 
float r = 200;
float diff =1; 
float d;

void setup() {

  size(600, 600);
  background(255);
  smooth();
  strokeWeight(0.01);
  colorMode(HSB);
}


void draw() {

  float x = r * cos(a)  ; 
  float y = r * sin(a) ; 
  noFill();

  for (int i=-75; i<=600; i=i+150) {
    for (int w=-75; w<=600; w=w+150) {
      line(x+i, w, i, y+w);
      line(i, x+w, y+i, w);
    }
  }

  a += 0.01;
  r = map(sin(a*5), -1, 1, 30, 30);
}

