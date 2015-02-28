
int counter;

void setup() {  //setup function called initially, only once
  size(500,500);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
}

void draw() {  //draw function loops 
  line(125,125,mouseX, mouseY); //radial line from centre
}
