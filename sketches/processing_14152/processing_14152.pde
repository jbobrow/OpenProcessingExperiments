
void setup() {
colorMode(HSB,360,100,100);
  size(360,200);
  smooth();
}
 
void draw() {
  background(0,0,0);
  stroke(random(100,360),80,100);
  for(int x=0; x<=360; x=x+5) {
    float y= sin(radians(x+frameCount))*0.3*200+100;
  

 line(x,y,180,200);
line(x,y,180,0);
  }
}
 
                
                                                
