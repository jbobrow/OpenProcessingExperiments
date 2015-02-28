
class Particle {
  public float x, y;
  public float px, py;
  public float dx, dy;

  Particle(float x1,float y1, float dx1, float dx2){
    x = x1;
    y = y1;
    dx = dx1;
    dy = dx2;
  }

  public void move(){
    px = x;
    py = y;
    dy += gravityStrength*(sy-y)/1000;
    float mdx = mouseX - x;
    float mdy = mouseY - y;
    //float mDist = sqrt(mdx*mdx + mdy*mdy);
    float mDist = dist(mouseX, mouseY, x, y);

    if (mDist < mouseMaxDist) {
      dx += mouseStrength*mdx/mDist; //(pow(mDist,mouseDistPowerLoss));
      dy += mouseStrength*mdy/mDist; //(pow(mDist,mouseDistPowerLoss));
    }

    x += dx;
    y += dy;

    // Bounce
    if (x>sx) {
      x = 2*sx - x;
      dx = -dx;
    }
    if (x<0) {
      x = -x;
      dx = -dx;
    }

    if (y>sy) {
      y = 2*sy - y;
      dy = -(bounceStrength*dy);
      dx = bounceStrength*dx;
    }
    /*if (y<0) {
      y = -y;
      dy = -dy;
    }*/
  }

  public void render(){
    if (drawLines) {
      line(px,py,x,y);
    } else {
      point(x,y);
    }
  }
}


