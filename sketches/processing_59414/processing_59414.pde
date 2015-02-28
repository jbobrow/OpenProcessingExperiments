
Cloud c;
Candy [] can = new Candy [8];
Candeh [] bad = new Candeh[8];
Basket bas;
int score = 0;

void setup () {
  size (500, 600);
  smooth ();
  noStroke();
  c = new Cloud ();
  bas = new Basket();

  for (int i = 0; i < can.length; i++) {
    x[i] = random (width);
    y[i] = random (height);
    speed [i] = random (0.1, 0.3);
    can [i] = new Candy();
    bad [i] = new Candeh();
 
  
  }
}

void draw () {
  background (172, 235, 250);
  for (int i = 0; i < can.length; i++) {
    can[i].display();
    bad[i].display();
  }
  c.display();
  bas.operate();
  
  
}


