
void setup() {
  size(750,250);
  colorMode(HSB,300,100,100);
}
void draw() {
  background(0);
  noStroke();
  for( int x=0; x<=600; x=x+50 ) {
    float y=sin(radians(x+frameCount))*0.8*100+50;
    fill(random(150,160),255,255);
    ellipse(x+80,100,y,y);
  }
}

                
                
