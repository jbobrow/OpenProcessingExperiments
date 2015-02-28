
class DrawClouds {
  float cloudX;
  float cloudY;
  
  
  void DrawClouds() {
    cloudX = random(0,400);
    cloudY = random(0,200);
  }
  
  void cloudloop() {
    fill(216);
    ellipse( cloudX, cloudY, 200, 50);
    if (cloudX < width + 200) {
      cloudX = cloudX + 1;
    } else if (cloudX >= (width + 200)) {
      cloudX = -200;
      cloudY = random(0, 200);
    }
    
    if (mousePressed == true) {
      cloudX = random(0,400);
      cloudY = random(0,200);
    }
  }
  
}

