
//Pesky Red Dot
//by Brianna Hoftun
//based on code: monster with following eyes by David Langley, 
//licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
//Work: http://openprocessing.org/visuals/?visualID=9095	
//License: 
//http://creativecommons.org/licenses/by-sa/3.0/
//http://creativecommons.org/licenses/GPL/2.0/


Monster m1;

void setup() {
  size(455,650);

  m1 = new Monster(150, 50);
}

void draw() {
  PImage myImage;
  myImage =loadImage("mona.jpg");
  image(myImage, 0, 0);

  m1.update(mouseX, mouseY);
  m1.display();

  fill(255, 20, 20, 200);
  ellipse(mouseX, mouseY, 8, 8);
}


class Monster
{
  float monsterX;
  float monsterY;
  Eye leye;
  Eye reye;

  boolean bover = false;
  boolean locked = false;
  float bdifx = 0.0;
  float bdify = 0.0;

  Monster(int x, int y) {
    monsterX = x;
    monsterY = y;
    leye = new Eye(19, 90);
    reye = new Eye(82, 89);
  }

  void update(int mx, int my) {
    leye.update(mx-monsterX, my-monsterY);
    reye.update(mx-monsterX, my-monsterY);


    if (isInside(mx, my))
    {
      bover = true;
    }
    else
    {
      bover = false;
    }
  }

  boolean isInside(int mx, int my) {
    if (leye.isInside(mx-monsterX, my-monsterY))
    {
      return true;
    }
    if (reye.isInside(mx-monsterX, my-monsterY))
    {
      return true;
    }
    return false;
  }

  void mousePressed() {
    if (bover)
    {
      locked = true;
    }
    else
    {
      locked = false;
    } 

    bdifx = mouseX-monsterX;
    bdify = mouseY-monsterY;
  }

  void mouseDragged() {
    if (locked)
    {
      monsterX = mouseX-bdifx;
      monsterY = mouseY-bdify;
    }
  }

  void mouseReleased() {
    locked = false;
  }

  void display() {
    pushMatrix();
    translate(monsterX, monsterY);

    leye.display();
    reye.display();

    popMatrix();
  }
}

class Eye
{
  final static int MAX_EYE_SIZE = 50;
  final static int MIN_EYE_SIZE = 50;

  final static float MAX_EYE_VELOCITY = 0.2;
  final static float MIN_EYE_VELOCITY = -0.2;

  int ex, ey;
  float size;
  float velocity;
  float angle = 0.0;

  Eye(int x, int y) {
    ex = x;
    ey = y;   
    size = random(MIN_EYE_SIZE, MAX_EYE_SIZE);
    velocity = random(MIN_EYE_VELOCITY, MAX_EYE_VELOCITY);
  }

  boolean isInside(float mx, float my) {
    float distance = sqrt(sq(ex - mx) + sq(ey - my));
    if (distance <= size)
    {
      return true;
    }
    else
    {
      return false;
    }
  }

  void update(float mx, float my) {
    angle = atan2(my-ey, mx-ex);
    size += velocity;
    if (size > MAX_EYE_SIZE) {
      velocity = -velocity;
    }
    if (size < MIN_EYE_SIZE) {
      velocity = -velocity;
    }
  }

  void display() {
    pushMatrix();
    translate(ex, ey);
    fill(255);
    stroke(0);
    ellipse(0, 0, 50, 50);
    rotate(angle);
    fill(50);
    ellipse(size/4, 0, 25, 25);
    popMatrix();
  }
}


