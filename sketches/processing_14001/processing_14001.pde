
void setup() {
  size(360,200);
}

void draw() {
  background(#000000);
  fill(HSB, random(100,150),255,255);
  for( int x=0; x<360; x=x+1 ) {
    float y=sin(radians(x+frameCount)*2)*200; 
    ellipse(x,0,x,y);
  }
  println(frameCount);
}

