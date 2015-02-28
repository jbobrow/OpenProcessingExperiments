
int x;

void setup () {
  size (400, 400);
  smooth();
}


void draw () {

  background (0);
rectMode(CENTER);


  if (mousePressed) {

    for (int x=300; x >=10; x=x-50) {
      fill(x);
      rect (width/2, height/2, x, x);
    }
  }
  else {
    for (int x=300; x >=  10; x=x-50) {
    fill(int(random(0, 255)));

      rect (width/2, height/2, x, x);
    }
  }
}


