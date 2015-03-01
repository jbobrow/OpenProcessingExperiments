
void setup() {  //setup function called initially, only once
  size(400, 400);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
}
 
void draw() {  //draw function loops
  noStroke();
  fill(random(255),100,255,50);
  ellipse(width/2, height/2, 100, 100);
}

