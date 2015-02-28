
int counter;

void setup() {  //setup function called initially, only once
  size(1024, 768);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(255 * abs(sin(counter/1000.0)),255,255,255);
  rect(0, 0, width, height);
}
