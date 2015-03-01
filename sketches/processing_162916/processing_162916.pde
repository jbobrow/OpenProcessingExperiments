
float fluctuate = 0;

void setup() {
  size (200,200);
}

void draw() {
  background(100);
  
  for (float i = 0; i<width; i++) {
    line (i,height-noise(i/50)*100,i,height);
  }
  
  ellipse(width/2 + sin(fluctuate)*100,height/2,10,10);
  fluctuate = fluctuate + 0.05;
}
