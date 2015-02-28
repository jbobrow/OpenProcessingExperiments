
void setup() {
  size(360,200);
  colorMode(HSB,360,100,100);
  smooth();
}
 
void draw() {
  background(0);
  stroke(random(200,360),80,100);
  for(int x=0; x<=360; x=x+5) {
    float y= sin(radians(x+frameCount))*0.5*200+100;
    line(180,0,x,y);
    line(180,200,x,y);
  }
}
 
        
