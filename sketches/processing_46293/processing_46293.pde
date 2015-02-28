

float a = 0.0;
float inc = TWO_PI/50.0;

void setup() {
  size (800, 600);
  background (0, 25, 127);
  smooth();
}



void draw() {
  
   noStroke();
    fill(0, 25, 127);
    rect(0, 0, width, height);
   

  translate (width/2, height/2); 
  
  fill(127, 0, 127, 20);
  for (int i=0; i<600; i=i+2) {
    ellipse(i*sin(a), 50, i, 50+tan(a)*2.0);
    a = a + inc;
    rotate (90);
  }
}


