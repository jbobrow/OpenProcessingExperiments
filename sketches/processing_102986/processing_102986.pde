
float x;
float y;
float easing = 0.05;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  noStroke();
  fill(0);
}

void draw() {  //draw function loops 
float targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  float targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  if(mousePressed == true){
      randomrgb = random(255);
      }
  fill(randomrgb, 120, 120, 10);
  rect(0,0,250,250);
  fill(x, y, 255);
  ellipse(x, y, 20, 20);
}
