
void setup() {
  size(360,200);
}

void draw() {
  background(255);
  for(int x=0; x<360; x=x+1) {
    float y = noise(x*0.01+frameCount*0.01)*255;
    stroke(y);
    line(x,0,x,y);
  }
}


                
                
