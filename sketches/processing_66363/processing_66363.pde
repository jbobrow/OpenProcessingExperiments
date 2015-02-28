
int d = 30;
float n = 0.0;
float t = 30;

void setup() {
  size(800, 800);
  smooth();
  colorMode(HSB, 100, 100, 100);
  noStroke();
}

void draw() {

background(40, 40, 100, 10);
rect(0, 0, width, height);

  translate(width/2, height/2);
  rotate(QUARTER_PI);
  for (int i = 0; i < 15; i++) {
    
    for (int q = 0; q < 10; q+= 20) {
      
      fill(50+i, 100, 100, 30);
 
      ellipse(q+10, q+10, d, d);
      ellipse(q-10, q-10, d, d);
           ellipse(q+10, q-10, d, d);
                      ellipse(q-10, q+10, d, d);

      scale(1.2);
      stroke(noise(n));
      noStroke();
    }
  }
}
