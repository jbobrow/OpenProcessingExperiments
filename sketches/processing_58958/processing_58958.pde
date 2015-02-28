
float lastSpeed;
long lastMoveTime;
PVector pos = new PVector();
PVector lastPos = new PVector();
PVector dir = new PVector();
PVector lastDir = new PVector();

void setup() {
  size(250, 250);
  ellipseMode(RADIUS);
  strokeCap(SQUARE);
  smooth();
  noCursor(); 
  background(0);

  lastMoveTime = millis();
  lastPos.x = mouseX;
  lastPos.y = mouseY;
  lastSpeed = 0.0f;
}

void draw() {
  loadPixels();
  for(int i = 0; i < width*height; ++i) {
    pixels[i] = color((int) (brightness(pixels[i]) * 0.9f));
  }
  updatePixels();
}

void mouseMoved() {
  long now = millis();
  long dt = now - lastMoveTime;  
  pos.x = mouseX;
  pos.y = mouseY;
    
  if(dt == 0) {
    // skip
    return;
  }

  float l = pos.dist(lastPos);
  float speed = l / dt;   

  speed = speed + lastSpeed /2.0f;
  float pct = speed / 4.0f;
  if(pct > 1.0f) {
    pct = 1.0f;
  }
  
  dir.x = pos.x;
  dir.y = pos.y;
  dir.sub(lastPos);
  float angle = PVector.angleBetween(lastDir, dir);
  float pctAngle = angle / HALF_PI;
   
  noFill();
  stroke(255);
  strokeWeight(1 + pct * 30);
  line(lastPos.x, lastPos.y, pos.x, pos.y);
  
  if(pctAngle >= 0.25f) {
    ellipse(pos.x, pos.y, 15.0f * pctAngle, 15.0f * pctAngle);
  }
  
  lastSpeed = speed;
  lastMoveTime = now;
  lastPos.x = pos.x;
  lastPos.y = pos.y;
  lastDir.x = dir.x;
  lastDir.y = dir.y;
}
