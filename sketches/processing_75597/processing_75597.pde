
int counter;
PShape map;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  
  map = createShape(http://smar.me/5b5KD.svg);
}

void draw() {  //draw function loops 
 background(500, 500);
 shape(map, 0, 0);
  
}
