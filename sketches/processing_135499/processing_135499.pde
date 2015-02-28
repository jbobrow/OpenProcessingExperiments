
void setup() { 
  size (800, 600);
  colorMode (HSB);
   frameRate(24);
  background(255);
}
void draw() {
  fill(255);
  rect((width/3)*1, (height/20)*9, (width/3)*1, (height/20)*1);
  float r = random(((width/3)*1)-5);
  fill(r, r, r);
  rect((width/3)*1, (height/20)*9, (width/3)*1-r, (height/20)*1);
  fill(50);
  textSize(60);
  text(r, random(width),random(height));
}

