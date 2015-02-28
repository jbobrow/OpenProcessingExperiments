
class planet {
  public float M;
  public float x;
  public float y;
  private float dx;
  private float dy;
  private int ix;
  
  public planet(int index) {
    x=random(100,400);
    y=random(100,400);
    M=random(50,256);
    ix=index;
  }
  
  public void draw() {
    stroke(0);
    if (!doStroke) noStroke();
    float r=(mag(dx,dy)*5);
    if (r>20) r=20.0;
    float col=M;
    fill(col,col,col,255);
    ellipseMode(CENTER);
    ellipse(x,y,r,r);
  }
  
  public void exert() {
    float G=-0.000005; // speed constant
    for (int i=0;i<NUM_PLANETS;i++) {
      float xoff=x-solarsystem[i].x;
      float yoff=y-solarsystem[i].y;
      float distance=mag(xoff,yoff);
      if (i!=ix ) {
        float magn=G*((M*solarsystem[i].M)/(float)Math.pow((double)distance,2.0));
        dx += (magn*xoff);
        dy += (magn*yoff); 
      }
    }
    
  }
  
  public void move() {
    x=x+dx;
    y=y+dy;
    if (x>512.0) x-=512;
    if (x<0.0) x+=512;
    if (y>512.0) y-=512;
    if (y<0.0) y+=512;    
  }
}

