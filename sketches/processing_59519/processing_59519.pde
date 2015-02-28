
class Cell {
  boolean n;
  Cell(){
  }
  public void draw(int x,int y) {
    if(n==false) {
      fill(0, 0, 50);
    }
    else {
      fill(80, 100, 80);
    }
    stroke(0, 0, 80);
    rect(cellwidth/xcell*(x-1),cellheight/ycell*(y-1),cellwidth/xcell,cellheight/ycell);
  }
}


/*
  public Cell(int xcell, int ycell){
  fill(0, 10, 100);
  stroke(0, 10, 100);
    rect(xcell,ycell,10,10); 
  }
*/
/*
  private PVector location;
  private PVector velocity;
  private float diameter;
  private int life;

  Cell(PVector _location) {
    location = _location;
    velocity = new PVector(random(-4, 4), random(-4, 4));
    diameter = random(16);
    life = int(random(50, 250));
  }

  public void update() {
    location.add(velocity);
    life--;
  }

  public void draw() {
    rect(location.x, location.y, diameter, diameter);
    ellipse(location.x, location.y, diameter, diameter);
  }

  public boolean isDead() {
    return life <= 0;
  }
*/


