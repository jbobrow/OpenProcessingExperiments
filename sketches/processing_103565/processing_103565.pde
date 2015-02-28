
float speed=0.0;
float easing=0.3;

void setup() {  //setup function called initially, only once
  size(250, 250);
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  smooth();
  fill(125,360,360);
  ellipseMode(RADIUS);
}

void draw() {  //draw function loops 
  background(0);
  float target = dist(mouseX, mouseY, pmouseX, pmouseY);
  speed +=(target-speed)*easing;
  ellipse(127,127,target,target);
  ellipse(127,127,speed,speed);
}
