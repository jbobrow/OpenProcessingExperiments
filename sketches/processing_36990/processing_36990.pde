
class Bubble
{
  
  public PVector pos;
  public float rad;
  public float colorHue;
  private PVector speed;

  Bubble() {
    pos = new PVector(random(width), rad*-1);
    colorHue = random(360);
    rad = random(10,30);
    speed = new PVector(0, random(1,2));
  }

  public void update() {
    pos.add(speed);
  }

  public void display() {
    noFill();
    noStroke();
    colorMode(HSB, 360, 100, 100, 100);
    stroke(colorHue, 100, 100, 50);
    strokeWeight(2);
//    fill(colorHue, 100, 100, 50);
    ellipse(pos.x, pos.y, rad*2, rad*2);
    strokeWeight(1);
  }
  
  public boolean isOutOfDisplay() {
    if ( pos.y-rad > height ) {
     return true;
    } 
   return false; 
  }
  
}


