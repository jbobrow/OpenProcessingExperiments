
void setup() {
  size(360,200);
}

void draw() {
  background(255);
  for(int y=0; y<=200; y=y+1) {
    for(int x=0; x<=360; x=x+1) {
      float c = noise(x*0.01,y*0.01+frameCount*0.01,frameCount*0.01)*255;
      if(c>100 & c<130) {
        stroke(0);
        point(x,y);
      }
    }
  }
}

