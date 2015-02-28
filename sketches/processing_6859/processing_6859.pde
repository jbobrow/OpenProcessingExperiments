
class Ball{

  public float x;
  public float y;
  private float diameter;
  public float dx;
  public float dy;
  private int[] chroma;
  public boolean STEM = false;
  public boolean attract = true;

  /**
    *  Constructor for Ball
    *  Takes position (x,y), diameter, 
    */
  public Ball(float x, float y, float diam){
    this.x = x;
    this.y = y;
    diameter = diam;
    dx = 0;
    dy = 0;

    // Get some colour
    chroma = new int[3];
    chroma[0] = (int) random(255);
    chroma[1] = (int) random(255);
    chroma[2] = (int) random(255);
  }

  /** Update ball's position **/
  public void update(){

    // Attract the balls toward mouse
    if(attract){
      dx += (mouseX-x)/dist(mouseX,mouseY,x,y);
      dy += (mouseY-y)/dist(mouseX,mouseY,x,y);
    }
    // Balls run away from mouse
    else if(!attract){
      dx -= (mouseX-x)/dist(mouseX,mouseY,x,y);
      dy -= (mouseY-y)/dist(mouseX,mouseY,x,y);
    }

    // Update ball's (x,y)
    x += dx;
    y += dy;

    /** If collision with top or bottom **/
    if(y + dy >= height-World.padding || y + dy <= World.padding)
      bounce();

    /** If collision with wall **/
    if(x + dx >= width-World.padding || x + dx <= World.padding)
      bounceWall();
  }

  public void bounce(){
    /** reflect ball with a little friction **/
    dy = -dy/1.25; 
  }

  public void bounceWall(){
    /** reflect ball and include a little friction **/
    dx = -dx/1.25; 
  }

  public void drawBall(){
    fill(chroma[0], chroma[1], chroma[2]);
    ellipse(x, y, diameter, diameter);
    if(STEM){
      strokeWeight(1);
      line(x,y,mouseX,mouseY);
    }
  }

}







