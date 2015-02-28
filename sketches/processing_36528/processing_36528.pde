
private static final int NUMCIRCLES = 20;


Organism o;

public void setup() {
  size(900, 450);
  frameRate(30);
  smooth();
  
  o = new Organism(NUMCIRCLES);
}

public void draw() {
  background(0);
  o.updateOrg();
}

public void mouseReleased() {
  o.mouseReleased(mouseX,mouseY);
}



class CCircle {


  private int rad;
  private color col;
  private int x, y;
  private int tx, ty;

  // speed and angle in degrees...
  private int speed;
  private int angle;
  private int lastUp;

  public CCircle(int x_, int y_) {

    rad = (int)random(20, 100);
    rad = 1;
    col = color(random(0, 255), random(0, 255), random(0, 255));
    speed = 0;
    while (speed == 0) {
      speed = (int)random(-5, 5);
    }
    angle = (int)random(0, 360);
    x = x_;
    y = y_;

    tx = x+ (int)(rad*cos(radians(angle)));
    ty = y + (int)(rad*sin(radians(angle)));

    lastUp = -50;
  }

  public int getRad() {
    return rad;
  }

  public void upRad() {
    rad++;
  }

  private int getX() {
    return x;
  }
  private int getY() {
    return y;
  }

  private int getTipX() {
    return tx;
  }
  private int getTipY() {
    return ty;
  }

  public void upXY(int x_, int y_) {
    x = x_;
    y = y_;
  }

  public boolean isIntersecting(CCircle cc) {
    return (dist(x, y, cc.getX(), cc.getY()) < (rad + cc.getRad()));
  }

  public boolean isTouching(CCircle cc) {
    return (dist(tx, ty, cc.getTipX(), cc.getTipY()) < 15);
  }

  public boolean wasClicked(int cx, int cy) {
    return(dist(x, y, cx, cy) < rad);
  }

  public void changeBehavior() {
    if (abs(tx-lastUp) > 20) {
      col = color(random(0, 255), random(0, 255), random(0, 255));
      speed += speed/abs(speed);
      while ( (abs (speed) > 8)||(speed == 0)) {
        speed = 0-(speed/abs(speed));
      }
      lastUp = tx;
    }
  }
  public void updateCircle() {
    angle = (angle + speed);
    while (angle > 359) {
      angle -= 360;
    }
    while (angle < 0) {
      angle += 360;
    }

    tx = x+ (int)(rad*cos(radians(angle)));
    ty = y + (int)(rad*sin(radians(angle)));

    if (abs(tx-lastUp) > 20) {
      // ready to be upped again
      lastUp = -50;
    }
  }

  public void displayCircle() {
    ellipseMode(CENTER);
    // draw center dot
    fill(0);
    noStroke();
    ellipse(x, y, 5, 5);

    // draw line
    noFill();
    stroke(100);
    strokeWeight(2);
    line(x, y, tx, ty);

    // draw circle
    stroke(col, 200);
    strokeWeight(4);
    //fill(col, 100);
    for (int r = 10; r <rad; r+=10) {
      //ellipse(x, y, 2*r, 2*r);
    }
    fill(col, 100);
    ellipse(x, y, 2*rad, 2*rad);
  }
}

class Organism {

  private ArrayList theOrg;

  private void placeOrg(int n) {
    // get last added
    CCircle last = theOrg.get(n);
    boolean done = false;

    // place it outside any other circle
    while ( (!done)) {
      done = true;
      for (int cc = 0; cc<theOrg.size(); cc++) {
        if ((cc != n)&&(last.isIntersecting(theOrg.get(cc)) == true)) {
          int xx = int(random(50, width-50));
          int yy = int(random(50, height-50));
          last.upXY(xx, yy);
          done = false;
          break;
        }
      }
    }

    // grow until touches something...
    done = false;

    while ( (!done)) {
      last.upRad();
      if (last.getRad() > 99) {
        done = true;
      }
      for (int cc = 0; (done == false)&&(cc<theOrg.size()); cc++) {
        if ((cc != n) && (last.isIntersecting(theOrg.get(cc)) == true)) {
          done = true;
        }
      }
    }
  }

  public Organism(int n) {
    theOrg = new ArrayList();

    // place all orgs
    for (int i=0; i<n; i++) {
      // add anywhere
      int xx = int(random(100, width-100));
      int yy = int(random(100, height-100));
      theOrg.add(new CCircle(xx, yy));

      this.placeOrg(theOrg.size()-1);
    }

    // go through and replace some orgs
    for (int i=0; i<theOrg.size(); i++) {
      CCircle cc = theOrg.get(i);
      while (cc.getRad () < 30) {
        this.placeOrg(i);
      }
    }
  }

  public void mouseReleased(int x, int y) {
    for (int i=0; i<theOrg.size(); i++) {
      CCircle c = theOrg.get(i);
      if (c.wasClicked(x, y)) {
        c.changeBehavior();
      }
    }
  }

  public void updateOrg() {
    for (int i=0; i<theOrg.size(); i++) {
      CCircle c = theOrg.get(i);
      c.updateCircle();
      // check interaction
      for (int j=0; j<i; j++) {
        CCircle d = theOrg.get(j);
        if (c.isTouching(d)) {

          c.changeBehavior();
          d.changeBehavior();
        }
      }
      c.displayCircle();
    }
  }
}

