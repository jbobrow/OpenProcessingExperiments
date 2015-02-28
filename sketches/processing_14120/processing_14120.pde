

void setup() {
  size(750,300);
  colorMode(HSB,100,300,100);
}
void draw() {
  background(20);
  noStroke();
  for( int x=0; x<=600; x=x+1 ) {
    float y=sin(radians(x+frameCount)*2)*0.5*x;
    fill(random(20,60),100,100);
    ellipse(x,y,y,y);
    
  }
}
