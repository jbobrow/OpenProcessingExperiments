
int counter;

void setup() {  //setup function called initially, only once
  size(300, 300);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  ellipseMode(CENTER);
  fill(127,255,200,200);
  ellipse(150,150,150,100);
}
