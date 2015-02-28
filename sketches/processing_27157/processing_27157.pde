
SuperCool follower = new SuperCool(50,50);

final int FOLLOWER_MOVEMENT = 5;

void setup() {
  size(500, 500);
  background(255);
  smooth();
}

void draw() {
  if (dist(mouseX,mouseY,follower.x,follower.y) < FOLLOWER_MOVEMENT) {
    follower.x = mouseX;
    follower.y = mouseY;
  } else {
    float a = sq(mouseX - follower.x);
    float b = sq(mouseY - follower.y);
    float c = sq(dist(mouseX, mouseY, follower.x, follower.y));
    float newA = sqrt(sq(FOLLOWER_MOVEMENT) * a / c);
    float newB = sqrt(sq(FOLLOWER_MOVEMENT) * b / c);
    
    if (mouseX < follower.x) {
      follower.x -= newA;
    } else {
      follower.x += newA;
    }
    
    if (mouseY < follower.y) {
      follower.y -= newB;
    } else {
      follower.y += newB;
    }
  }
  
  follower.draw();
}


