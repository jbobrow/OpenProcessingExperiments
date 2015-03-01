
PVector loc = new PVector (random(width), random(height));
PVector vel = new PVector (random(-4, 4), random(-4, 4));
vesicle [] list1 = new vesicle [80];
target tamato = new target();
float d;
int r = 20;
int a = 40;

void setup () {
  size(600, 600);
  smooth();
  noStroke();

  for (int i = 0; i < list1.length; i++) {
    list1[i] = new vesicle();
  }
}

void draw () {
  background(255);
  tamato.update2();
  for (int i = 0; i < list1.length; i++) {

    list1[i].update1();
    d = dist(list1[i].pos.x, list1[i].pos.y, loc.x, loc.y);
    if (d <= r+a) {
      print("#",d);
      vel.x *= -1;  // this part doesn't work
      vel.y *= -1; 
    }
  }
}





class vesicle {
  PVector pos = new PVector (random(width), random(height));
  PVector speed = new PVector (random(-3, 3), random(-2, 2));
  int r = 20; //radius of circle


  void update1() {
    fill(lerpColor(#BD8484, #96AED6, .6), 200);
    ellipse(pos.x, pos.y, 2*r, 2*r);
    pos.x += speed.x;
    pos.y += speed.y;

    if ( pos.x + r >= width  ) {
      pos.x = width - r - 1;
      speed.x *= -1;
    }
    if ( pos.x - r <= 0 ) {
      pos.x = r + 1;
      speed.x *= -1;
    }

    if ( pos.y + r >= height ) {
      pos.y = height - r - 1;
      speed.y *= -1;
    }


    if ( pos.y - r <= 0) {
      pos.y = r + 1;
      speed.y *= -1;
    }
  }
}



class target {
  PVector loc = new PVector (random(width), random(height));
  PVector vel = new PVector (random(-4, 4), random(-4, 4));
  int a = 40; //radius of circle


  void update2() {
    fill(#BD8484);
    ellipse(loc.x, loc.y, 2*a, 2*a);
    loc.x += vel.x;
    loc.y += vel.y;

    if ( loc.x + a >= width  ) {
      loc.x = width - a - 1;
      vel.x *= -1;
    }
    if ( loc.x - a <= 0 ) {
      loc.x = a + 1;
      vel.x *= -1;
    }

    if ( loc.y + a >= height ) {
      loc.y = height - a - 1;
      vel.y *= -1;
    }


    if ( loc.y - a <= 0) {
      loc.y = a + 1;
      vel.y *= -1;
    }
  }
}



