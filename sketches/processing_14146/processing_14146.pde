
void setup() {
  size(400,400);
  colorMode(HSB,360,100,100);
}
void draw() {
  background(0);
  noFill();
  stroke(random(10,50),200,200);
  for(int x=0; x<=400; x=x+5) {
    float y= sin(radians(x+frameCount))*0.5*500+30;
    rect(x+y,x*0.9,10,y+random(5));
    }
}
