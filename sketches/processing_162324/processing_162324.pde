
int counter;

void setup() {  //setup function called initially, only once
  size(696,696);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 

fill(255,255,255);
ellipse(mouseX,mouseY,100,100);
}
