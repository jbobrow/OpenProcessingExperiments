
void setup() {
  size(400,400);
  noStroke();
  colorMode(HSB,100);
}

void draw() {
  //background(0,0,100);
  for(int i = 0 ; i < 400 ; i += 4) {
    for(int j = 0 ; j < 400 ; j += 4) {
      ellipse(i,j,6,6);
      
      float x = noise(i,j)*i;
      float y = noise(j,i)*j;
      
      float col = min((x*x+1)%(y*y+1),(y*y+1)%(x*x+1));
            col = (col+frameCount*2)%100;
      fill(col,100,80,10);
    }
  }
}
