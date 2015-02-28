
void setup() {
  size(255, 255, P2D);
  colorMode(HSB);
}
void draw(){
 
  fill(random(255),mouseX,height-mouseY);
  noStroke();
  float x = random(width);
  float y = random(height);
  rect(x,y,random(width-x),random(height-y));
}
