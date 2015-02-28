


void setup() {
  size(600, 400);
  noStroke();
}

void draw() {
  background(0,60,100);

  for (int i=15; i<width; i+=40) {       
    for (int j=15; j<height; j+=40) {
      float d=(sin((i+j*0.4)/mouseX)+3);
      fill(d*50,d*50,d*90);
     rect(i, j, d*8, d*8);
    }
  }
} 


