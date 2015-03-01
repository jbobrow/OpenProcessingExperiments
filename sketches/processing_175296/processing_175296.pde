
void setup() {  //setup function called initially, only once
  size(320, 240);
  background(255);  //set background white
  colorMode(HSB, 360, 100, 100);   //set colors to Hue, Saturation, Brightness mode
}

void draw() {  //draw function loops 
  size = random(100) + 10;
  fill(random(360), 60 + random(20), 70 + random(30));
  ellipse(random(width), random(height), size, size);
}

void keyPressed() {
  saveFrame();
}
