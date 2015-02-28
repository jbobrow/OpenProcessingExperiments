

void setup() {
    size (600, 600);
}
    
  
  
  void draw() {
  colorMode (HSB);
  float R = random (255);
  background(R, R, R, 200);
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  
  colorMode (RGB);

 fill (255, 0, 0);
  strokeWeight (10);
  stroke(R);
  
  line(s*10, 0, s*10, 200);
  line(m*10, 200, m*10, 400);
  line(h*25, 400, h*25, 600);
  
if ( second() > 30) {
  line(s, 0, s*10, 200);
  line(m, 200, m*10, 400);
  line(h, 400, h*25, 600);
  }
else {
  line(s*10, 0, s*-10, 200);
  line(m*10, 200, m*-10, 400);
  line(h*25, 400, h*-25, 600);

  }

  }




