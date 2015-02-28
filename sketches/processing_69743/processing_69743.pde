
int radius = 100;

int timeRadius = 5;

void setup() {
  size(300, 300);
  smooth();
}

void draw() {
  background(78, 76, 90);
  translate(width/2, height/2);
  stroke(238, 209, 211);
  smooth();
  


  for (int deg=0; deg<360; deg+=30) {
    float angle = radians(deg);
    float x = cos(angle) * radius;
    float y = sin(angle) * radius; 
    //for seconds
    float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;

    line(x, y, cos(s)*100, sin(s)*100);

    //for min

   // float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;r
    
  }
}


