
Track1 t1;
Track2 t2;
Track3 t3;

void setup() {
  size(800, 600);
  smooth();
  
  t1 = new Track1();
  t2 = new Track2();
  t3 = new Track3();
}

void draw() {
  background(255);
  
  t1.draw();
  t2.draw();
  t3.draw();
}

class Track1 extends TrackObj {
  public Track1() {
    speed = 2;
  }
  
  protected void drawGraphics() {
    fill(255, 0, 0);
    ellipseMode(CENTER);
    ellipse(0, 0, 20, 20);
  }
}
class Track2 extends TrackObj {
  public Track2() {
    speed = 10;
  }
  
  protected void drawGraphics() {
    fill(0, 255, 0);
    rectMode(CENTER);
    rect(0, 0, 20, 20);
  }
}
class Track3 extends TrackObj {
  public Track3() {
    speed = 4;
  }
  
  protected void drawGraphics() {
    fill(0, 0, 255);
    triangle(0, 0, 15, 20, -15, 20);
  }
}
class TrackObj {
  public float targetX,targetY;
  
  protected float speed;
  
  private float x,y;
  
  public TrackObj() {
    x = random(0, width);
    y = random(0, height);
  }
  
  public void draw() {
    targetX = mouseX;
    targetY = mouseY;
    
    float rad = atan2(targetY-y, targetX-x);
    x += cos(rad) * speed;
    y += sin(rad) * speed;
    
    pushMatrix();
    translate(x, y);
    drawGraphics();
    popMatrix();
  }
  
  protected void drawGraphics() {
  }
  
  
}


