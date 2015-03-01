
Walker[] wkrs = new Walker[1000];


void setup() {
  size(400, 400);


  for (int i=0; i<wkrs.length; i++) {

    wkrs [i]= new Walker(2);
  }
}

void draw() {
  background(255);
  for (int i=0; i<wkrs.length; i++) {
  wkrs[i].run();
  }
}

class Walker {

  float x, y, velx, vely, relx, rely, angle, d;
  int sz;

  Walker(int _sz) {

   
    sz=_sz;
  }

  void run() {
    movement();
    display();
  }

  void movement() {

    velx = random(-5, 5);
    vely = random(-5, 5);

    x += velx;
    y += vely;


    x  = constrain(x, 0, width);
    y = constrain(y, 0, width);


    relx = mouseX-x;
    rely = mouseY-y;

    angle = atan2(rely, relx);

    d = relx*relx + rely*rely;

    if (d > 0) {
      x += 2*cos(angle);
      y += 2*sin(angle);
    }
  }

  void display() {
    stroke(0);
    fill(30, 30);
    rectMode(CENTER);
    line(x, y, x+20, y+20);
  }
}


