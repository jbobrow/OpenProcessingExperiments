
void setup () {
  size(360,200);
  colorMode(HSB,30,30,100);
}
void draw() {
  background(0);
  for(int x=0; x<=150; x=x+30) {
   float y= sin(radians(x+frameCount))*0.7*100+50;
   fill(random(20,30),100,150);
   rect(100,50,x,y);
  }
}
                
                
