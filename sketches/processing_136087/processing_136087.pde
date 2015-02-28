
private float red = random(0, 255);
private float green = random(0, 255);
private float blue = random(0, 255);
private float ballSize = random(15, 25);

void setup() {
 size(800, 800); 
 background(255,255,255);
}

void draw() {
  fill(255,255,255,5);
  rect(0,0,width, height);
  fill(red, green, blue, 155);
  ellipse(mouseX, mouseY, 25, 25);
  
  if (mousePressed) {
    red = random(0, 255);
    green = random(0, 255);
    blue = random(0, 255); 
  }
}
