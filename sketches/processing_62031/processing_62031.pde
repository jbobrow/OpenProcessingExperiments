
/*
Circle Mess
Dan Olson 2012
*/
float[] x = new float[2000]; //only 
float r;
void setup() {
  r = random(5,50);
  size(500,500);
  smooth();
  noStroke();
  fill(255,200);
  for (int i = 0; i < x.length; i++) {
    x[i] = random(0,width);
  }
}
void draw() {
  background(0);
  for (int i=0; i < x.length; i++) {
    float y = i * .5;
    fill(#0F82FA);
    ellipse(x[i],y,r,r);
    
  }
}
void mousePressed(){
  setup();
  loop();
}
