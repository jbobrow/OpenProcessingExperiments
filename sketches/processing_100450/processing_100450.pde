
import java.util.ArrayList;
 
Explosions[] explosions;
 
void setup() {
  size(400, 400);
  background(0);
  smooth();
 
  explosions = new Explosions[3];
  explosions[0] = new Explosions(255,   0);
  explosions[1] = new Explosions(  0, 255);
  explosions[2] = new Explosions(255, 255);
}
 
void draw() {
  background(0);
 
  for (int n = 0; n < explosions.length; ++n)
  {
    Explosions exps = explosions[n];
    exps.step();
  }
  
}
 
class Explosion {
  float x;
  float y;
  float r;
  float r_goal = random(10, 100);
  float alp = 150;
  int life = 200;

  float red;
  float green = random(255);
  float blue;
 
  Explosion(float tmpX, float tmpY, float tmpRed, float tmpBlue) {
    x = tmpX;
    y = tmpY;
    red = tmpRed;
    blue = tmpBlue;
  }
 
  void plus() {
    r += 1;
    if (r > r_goal) {
      r = r_goal;
      alp -= 5;
    }
  }
 
  void display() {
    noStroke();
    fill(red, green, blue, alp);
    ellipse(x, y, r, r);
  }
 
  boolean finished() {
    life--;
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }
}

class Explosions
{
  ArrayList<Explosion> exps = new ArrayList<Explosion>();
  ArrayList<PVector> arrCurve;
  float t = 0;
  float x = 0;
  float y = 0;
  float red;
  float blue;
  
  Explosions(float tmpRed, float tmpBlue)
  {
    arrCurve = new ArrayList<PVector>();
    for (int n = 0; n < 4; ++n)
    {
      arrCurve.add(new PVector(random(width), random(height)));
    }
    
    red = tmpRed;
    blue = tmpBlue;
  }
  
  void step()
  {
    x = getPointOnCurve(arrCurve.get(0).x, arrCurve.get(1).x, arrCurve.get(2).x, arrCurve.get(3).x);
    y = getPointOnCurve(arrCurve.get(0).y, arrCurve.get(1).y, arrCurve.get(2).y, arrCurve.get(3).y);
    
    t += 0.02;

    if (t >= 1)
    {
      t -= 1;
      arrCurve.remove(0);
      arrCurve.add(new PVector(random(width), random(height)));
    }

    for (int i = 0; i < exps.size();i++) {
      Explosion exp = exps.get(i);
   
      exp.plus();
      exp.display();
      if (exp.finished()) {
        exps.remove(i);
      }
    }
    
    exps.add(new Explosion(x, y+random(-5, 5), red, blue));
   
  }

  float getPointOnCurve(float p0, float p1, float p2, float p3)
  {
    float tau = 0.5;
    
    float row1 = ((-tau)    * p0) + ((2 - tau) * p1) + ((tau - 2)     * p2) + (tau  * p3);
    float row2 = ((2 * tau) * p0) + ((tau - 3) * p1) + ((3 - (2*tau)) * p2) + (-tau * p3);
    float row3 = ((-tau)    * p0)                    + (tau           * p2);
    float row4 =                                 p1;

    row1 *= t*t*t;
    row2 *= t*t;
    row3 *= t;
    
    return row1 + row2 + row3 + row4;
  }
};


