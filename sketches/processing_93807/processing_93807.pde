
color night = color(10, 10, 100);
ArrayList sys ;

void setup() {
  size(700, 500);
  sys = new ArrayList();
}

void draw() {
  background(night);
  for (float n=random(1,8) ; n>0 ; n--)
    sys.add( new spark() );

  for (int i=sys.size()-1 ; i>0 ; i--)
  {
    spark s = (spark)sys.get(i);
    if (s.alive) {
      s.draw();
      s.move();
    }
    else {
      sys.remove(i);
    }
  }
}
class spark
{
  color hot = color(255, 254, 0);
  color cold = color(102, 0, 0);

  boolean alive = true;

  int age = 0;
  int life = 250;

  void draw() {

    noStroke();
    age++;

    if (age<life) {
      float a = norm(age, 0, life); //pulls a number between 1 and 0 based on the fraction between age and life
      color c = lerpColor(hot, cold, a); //pick a color between hot and cold that is the fraction a between
      fill(c);
      ellipse(x, y, 10, 10);
    }
    else {
      alive = false;
    }
  }

  float x, y;
  float vx, vy;
  float g=1;

  void move() {
    x += vx; 
    y += vy;
    vy += g;
    if (y>height) {
      y = height;
      vy *= -0.5;
    }
  }

  spark() { //not a call (no void)
    x = y = width/2;
    vx = random(-5, 5);
  }
}



