
/*
CRASHER-N
Luis Tamagnini-2009
http://pezvolador.wordpress.com/
*/
// PRESS A KEY TO RESTART

int n = 10;
Crashn [] enes;
int [] ints;

void setup () {
  size (810,150);
  enes = new Crashn [n];
  ints = new int [n];
  for (int i = 0; i < ints.length; i++) {
    ints[i] = int(random(width));
  }
  ints =  sort(ints);
  for (int i = 0; i < enes.length; i++) {
    enes[i] = new Crashn (ints[i],color(random(255),random(255),random(255)));
  }
  frameRate(20);
  smooth();
}

void draw () {
  background(0);
  for (int i = 0; i < enes.length; i++) {
    enes[i].display();
    enes[i].move();
    for (int j = 0; j < enes.length-1; j++) {
    if (enes[j].crash(enes[j+1])) {
      enes[j].change();
      enes[j+1].change();
    }
    }
  }
}

void keyPressed () {
  for (int i = 0; i < ints.length; i++) {
    ints[i] = int(random(width));
  }
  ints =  sort(ints);
  for (int i = 0; i < enes.length; i++) {
    enes[i] = new Crashn (ints[i],color(random(255),random(255),random(255)));
  }
}

class Crashn {
  PFont font;
  int x;
  color c;
  int d;
  
  Crashn (int tempX, color tempC) {
    c = tempC;
    x = tempX;
    font = createFont("Arial",48,true);
    d = int(random(2));
    if (d == 0) {
      d = -1;
    }
  }
  
  void display () {
    int xx = (x/8)-1;
    textFont(font);
    textAlign(RIGHT, CENTER); 
    fill(c);
    text(xx,x+10,75);
    if (xx < 0)  {
      x = -10000;
      xx = 0;
    } else if (xx > 100) {
      x = 10000;
      xx = 100;
    }
  }
  
  boolean crash (Crashn n) {
    if (x >= n.x) {
      return true;
    } else {
      return false;
    }
  }
  
  void change () {
    d *= -1;
  }
    
   void move () {
     x += d;
   }
}

