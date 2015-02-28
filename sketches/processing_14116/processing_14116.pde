
void setup() {
  size(300,300);
  colorMode(HSB,360,100,100);
}
void draw() {
  background(0);
  noStroke();
  fill(60,250,255);
  for(int x=0; x<200; x=x+6) {
    float y= sin(radians(x+frameCount)*0.9)*60+20;
    ellipse(x+50,y+140,y,x);
  }
}
                
