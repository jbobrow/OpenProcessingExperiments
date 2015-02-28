
int oldx = 0;
int oldy = 0;
int r = 0;
int stroke_weight = 5;

void setup(){
  size(800,600);
  background(255, 255, 255, 0); 
}

void draw(){
  // input
  if (mousePressed && (mouseButton == LEFT)) {
    r = int(random(255));
    stroke_weight = int(2 + random(10));
  } else if (mousePressed && (mouseButton == RIGHT)) {
    background(255, 255, 255, 0);
    oldx = int(random(800));
    oldy = int(random(600));
  }
  
  strokeWeight(stroke_weight);
  strokeJoin(ROUND);
  stroke(mouseX, mouseY, r, 180);
  line(oldx, oldy, mouseX, mouseY);
  oldx = mouseX;
  oldy = mouseY;
  //delay(10);
}

