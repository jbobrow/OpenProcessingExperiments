
int x = 0;
int speed = 1;

void setup() {
  size(200, 200);
}

void draw() {
  background(255);
  stroke(0);
 fill(random (255)); 
  ellipse(mouseX, mouseY, 62, 62);

  x = x + speed;
  if ((mouseX < width/2) || (mouseX > 0)) {
    speed = speed * -1;
  }
 if ((mouseX> width/2)&&(mouseX<width)){
    fill(random(1,255));
  
 fill(235,0,247);
  ellipse(mouseX, mouseY, 52, 52);
   fill(random(255));
  ellipse(mouseX, mouseY, 42, 42);
  x = x + speed;
   fill(255,0,0); // bright red
  ellipse(mouseX, mouseY, 32, 32);  
  }
}

