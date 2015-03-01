
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(105);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  fill(255,100,255);
  rect(mouseX,mouseY,pmouseX,pmouseY);
}
