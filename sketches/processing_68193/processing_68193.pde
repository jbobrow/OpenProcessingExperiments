

class ball {
  private float x, y;
  private float xspeed, yspeed;
  private color col;
  
  ball(float x, float y, float xspeed, float yspeed, color col) {
    this.x = x;
    this.y = y;
    this.xspeed = xspeed;
    this.yspeed = yspeed;
    this.col = col;
  }
  public void render() {
    x += xspeed;
    y += yspeed;
    if (x < 0 || x > width) {
      x -= xspeed;
      xspeed = -xspeed;
    }
    
    if (y < 0 || y > height) {
      y -= yspeed;
      yspeed = -yspeed;
    }
    
    fill(col);
    ellipse(x, y, 30, 30);
  }
}

