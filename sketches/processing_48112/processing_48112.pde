
class Spam
{
  float x;
  float y;
  float r; //number of circles
  float xspeed, yspeed;
  float g; //variation of green
  float theta;

  Spam(float _g, float _r)
  {
    x = random(width);
    y = random(height);
    g = _g;
    xspeed = random(-5, 5);
    yspeed = random(-5, 5);
    r=_r;
  }


  //Increment angle
  void move() {
    x += xspeed; // Increment x
    y += yspeed; // Increment y

    // Check horizontal edges
    if (x > width || x < 0) {
      xspeed *= -1;
    }
    //Check vertical edges
    if (y > height || y < 0) {
      yspeed *= -1;
    }
  }

  // Display the SPAM

  void display() {

    fill(0, g, 0, 150);
    smooth();
    stroke(240);
    pushMatrix();
    translate(x, y);
    //quad(38, 31, 86, 20, 69, 63, 30, 76);
    ellipse (x, y, r,r);
    popMatrix();
  }
}


