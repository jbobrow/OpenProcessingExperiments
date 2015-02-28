
float xPos, yPos;
PVector origin;
PVector pos;
boolean isFalling;

void setup() {
  size(400, 400);
  xPos = 100;
  yPos = 200;
  pos = new PVector(xPos, yPos);
  origin = new PVector(width/2,0);
  
  
}

void draw() {
  translate(width/2,0);
  background(255);
  fill(255);
  line(0,0, pos.x, pos.y);
  ellipse(pos.x, pos.y, 30, 30);
  if (overCircle(int(pos.x), int(pos.y), 30)) {
    //    pos.rotate(radians(10));
    isFalling=true;
  }
  if (isFalling) {
    if (pos.heading() < HALF_PI) {
      pos.rotate(radians(2));
    }
    else {
      isFalling = false;
    }
  }
}


boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX + width/2;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } 
  else {
    return false;
  }
}

