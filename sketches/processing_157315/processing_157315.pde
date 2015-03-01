
void setup() {
  size(400,400);
  background(0);
  colorMode(HSB,100);
}



void draw() {

  fill(0,100,0,10);
  rect(0,0,width,height);
  translate(width/2, height/2);
  scale(.001*frameCount);
  rotate(frameCount/TWO_PI);
  
  float yOffset = height*.5;
  float yRange = height*.5;
  float seed = random(yRange)+yOffset;
  PVector origin = new PVector(0, seed);

  stroke(seed%100,100,100,25);
  
  for(int i = 1 ; i < width ; i ++) {
     PVector next = new PVector(i,(.5-noise(i+seed))*yRange*2+yOffset);
     line(origin.x,origin.y,next.x,next.y);
     origin = next;
  }
}
