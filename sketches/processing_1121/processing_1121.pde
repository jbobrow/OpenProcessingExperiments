
class Particle {
  public float x, y;
  public float px, py;
  public float orig_x, orig_y;
  public int matrix_x, matrix_y;
  public float dx, dy;
  private int r,g,b;
  public boolean conservative = true;

  Particle(int matrix_x1, int matrix_y1, float x1, float y1, float dx1, float dx2){
    x = x1;
    y = y1;
    setHomePos(x,y);
    dx = dx1;
    dy = dx2;
    matrix_x = matrix_x1;
    matrix_y = matrix_y1;
    setColor(100,100,100);
  }

  public void setHomePos(float hx, float hy) {
    orig_x = hx;
    orig_y = hy;
  }

  public void setColor(int ar,int ag,int ab) {
    r = ar;
    g = ag;
    b = ab;
  }

  public boolean onTheEdge() {
    return (matrix_x == 0) || (matrix_x == matrix_sx-1) || (matrix_y == matrix_sy-1);
  }
  
  public void move(){
    px = x;
    py = y;
 
    // Mouse attraction
    float mdx = mouseX - x;
    float mdy = mouseY - y;
    float mdist = dist(mouseX, mouseY, x, y);

    if (mdist < mouseMaxDist) {
      dx += mouseStrength*mdx/mdist;
      dy += mouseStrength*mdy/mdist;
    }

    // Conservativity
    if (conservative) {
      float odx = orig_x - x;
      float ody = orig_y - y;
      //float odist = sqrt(odx*odx + ody*ody);
  
      dx += conservativityStrength*odx;
      dy += conservativityStrength*ody;
    } else {
      // Gravity
      dy += gravityStrength*(sy-y)/1000;
    }
    
    // Random
    dx += randomStrength*(random(1)-0.5);
    dy += randomStrength*(random(1)-0.5);
    
    // energy loss
    dx /= energyLoss;
    dy /= energyLoss;
    
    // Move
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
  }

  public void render(){
    stroke(r,g,b,particleOpacity);
    if (drawLines) {
      line(px,py,x,y);
    } else {
      point(x,y);
    }
  }
}


