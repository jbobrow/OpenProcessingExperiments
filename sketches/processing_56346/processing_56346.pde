
class Duck {
  float duckx, ducky;
  float duckr;
  float xspeed;
  float yspeed;
  float bulletx, bullety;
  float bulletr;
  
  Duck(float duckx_, float ducky_, float xspeed_) {
    duckx = duckx_;
    ducky = ducky_;
    duckr = 20.0;
    bulletx = 150;
    bullety = 150;
    bulletr = 40;
    xspeed = xspeed_;
    yspeed = 2;
  }
  
  void displayBullet() {
    noFill();
    ellipseMode(CENTER);
    ellipse(bulletx, bullety, bulletr, bulletr);
    stroke(0);
    line(width/2, height/2-bulletr, width/2, height/2+bulletr);
    line(width/2-bulletr, height/2,width/2+bulletr, height/2);
  }
  
  void update() {
    duckx += xspeed;
    ducky += yspeed;
    if( duckx > width || duckx < 0 && ducky > height || ducky < 0) {
      xspeed *= -1;
      yspeed *= -1;
    }
  }
  
  void displayduck() {
    fill(100, 100, 150);
    rect(duckx, ducky, duckr, duckr);
  }
  
  boolean intersection() {
    float distance = dist(bulletx, bullety, duckx, ducky);
    if(distance < bulletr) {
      return true;
    } else {
      return false;
    }
  }
  
  void vanish() {
    duckx = 1000;
    ducky = 1000;
  }
}

