
int num=20;
color _c;
Ppl[] people;

void setup() {
  size(500, 500);
  smooth();
  colorMode(HSB);
  people = new Ppl[num];
  for (int i=0;i<num;i++) {
    people[i]=new Ppl();
  }
}

void draw() {
  background(255);
  for (int i=0; i<num;i++) {
    people[i].draw();
    people[i].run();
  }
}

class Ppl {
  color c;
  int x;
  int y;
  int s;
  int hi;
  int wi;

  Ppl() {
    c = color(random(256), random(256), random(256));
    s = int(random(1, 20));
    x = int(random(width));
    y = int(random(height));
    wi = 10;
    hi = 10;
  }

  void draw() {
    noStroke();
    fill(c);
    ellipse(x, y-7, wi, wi);
    fill(255);
    ellipse(x, y-9, wi/2, wi/2);
    if (random(1)>0.5) {
      stroke(0);
      line(x, y, x, y+hi-wi/2);
      line(x, y, x+10, y+hi-wi/2-10);
      line(x, y, x-10, y+hi-wi/2-10);
      line(x, y+hi-wi/2, x-5, y+hi-wi/2+30);
      line(x, y+hi-wi/2, x+5, y+hi-wi/2+30);
    } 
    else {
      stroke(0);
      line(x, y, x, y+hi-wi/2);
      line(x, y, x+10, y+hi-wi/2);
      line(x, y, x-10, y+hi-wi/2);
      line(x, y+hi-wi/2, x, y+hi-wi/2+30);
      line(x, y+hi-wi/2, x, y+hi-wi/2+30);
    }
  }
  void run() {
    x+= random(10);
    if (x>width){
      x = -10;
    y+= random(10);
    if (y>height){
      y = -10;
    }
    }
  }
}


