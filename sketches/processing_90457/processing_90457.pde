
// This tab coded by Matt.

class cloud {
  float xPos;
  float yPos;
  float rad;
  int speed;

  cloud(float x, float y, float r, int s) {
    xPos = x;
    yPos = y;
    rad = r;
    speed = s;
  }

  void displayCloud() {
    fill(255);
    noStroke();
    ellipse(xPos, yPos, rad, rad/2);
  }

  void updateCloud() {
    yPos += speed; // Scroll the clouds downward to simulate the sensation of flying upward.

    // If the cloud goes off the bottom of the screen, replace it above the screen at a random place and size:
    if (yPos > height + 50) {
      yPos = -50;
      xPos = random(width);
      rad = random(40, 200);
    }
  }
}


