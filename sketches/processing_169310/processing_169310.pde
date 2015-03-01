
ArrayList dots = new ArrayList();

void setup() {
  size(640, 640);
  /* Put in the dots */
  for (int i = 0; i < 360; i+=5) {
    /* No noticable benifit for puting r outside the object. It would still work if it was made in each object. */
    float r = random(0, 1);
    dots.add(new Dot(i, r));
  }
}

void draw() {
  background(255);
  translate(width/2, height/2);
  for (int i = 0; i < dots.size (); i++) {
    Dot d = (Dot) dots.get(i);
    for (int q = 0; q < dots.size (); q++) {
      Dot d2 = (Dot) dots.get(q);
      /* 
       We have made 2 loops. The second loop, every time the first loop gets an object, it loops throught the rest 
       of the dots and "get"s them.
       
       We use the dist function in the PVector object to find the distance between the first loops object and the rest 
       of the objects. If the distance is less than 100 than draw a line connecting them.
       */
      if (PVector.dist(d.loc, d2.loc) < 100) {
        line(d.loc.x, d.loc.y, d2.loc.x, d2.loc.y);
      }
    }
    d.draw();
    d.move();
  }
}

class Dot {
  PVector loc;

  /* To work out whether it will spin clockwise or anti-clockwise */
  float spin = random(0.2, 1.2);
  float num = 0;
  
  int angle;
  /* Radius is the distance from the center */
  int radius;
  /* Size or circle (The transparent ring is 2x the size) */
  int s;

  Dot(int i, float r) {
    /* This will make 4 rings, depending on the value of r */
    if (r < 0.2) {
      radius = 75;
    } else if (r > 0.2 && r < 0.4) {
      radius = 150;
    } else if (r > 0.4 && r < 0.6) {
      radius = 225;
    } else {
      radius = 300;
    }
    loc = new PVector(0, 0);
    angle = i; 
    s = (int)random(10, 30);
  }

  void draw() {
    /* You will recognise this formular in my other sketches */
    /* Update our "x" and "y" values to move. (We add "num") */
    float x = sin(radians(angle+num)) * radius;
    float y = cos(radians(angle+num)) * radius;
    loc.set(x, y);
    
    noStroke();
    /* Transparent ring */
    fill(0, 50);
    ellipse(loc.x, loc.y, s*2, s*2);
    /* Normal Circle */
    fill(0);
    ellipse(loc.x, loc.y, s, s);
    stroke(0, 155, 255);
  }

  void move() {
    /* Depending on the value of "spin" it spins clockwise or anti-clockwise */
    if (spin < 0.7) {
      num += spin;
    } else {
      num -= spin;
    }
  }
}



