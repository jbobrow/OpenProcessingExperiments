
void setup() {  //setup function called initially, only once
  size(400, 400);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  println("PosX="+mouseX+ "PosY="+mouseY);
}
