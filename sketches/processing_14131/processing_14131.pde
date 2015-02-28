
void setup() {
  size(360,200);
  colorMode(HSB,360,100,100);
}

void draw() {
  
  for (int x=0; x<360; x=x+5) {
    for (int y=0; y<360; y=y+5) {
     fill(random(255),random(100),random(90));
      float a=100+sin(radians(x+frameCount))*10;
      ellipse(x,y,10,10);
    }
  }
  println(frameCount);
}
                
                
