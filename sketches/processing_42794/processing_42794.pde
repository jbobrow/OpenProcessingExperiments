
Dots myDots;
int[] xp = new int[1000];
int[] yp = new int[1000];
int i;
void setup() {
  size (400, 400);
  frameRate(30);
  myDots = new Dots();
  background(0);
}
void draw() {
  myDots.update();
  myDots.connect();
  // println("x: "+xp[i]+", y: "+yp[i]);
  i++;
}
class Dots {
  int x;
  int y;
  int i=2; //array counter
  int j=0;
  Dots() {
    xp[0] = (int)random(width);
    yp[0] = (int)random(height);
    smooth();
    noStroke();
    ellipse(xp[0], yp[0], 10, 10);
  }
  void update() {
    x = (int)random(width);
    y = (int)random(height);
    smooth();
    noStroke();
    fill(255, 20);
    int dia = (int)random(1, 80);
    ellipse(x, y, dia, dia);

    if (i<990 || j<990) {
      xp[i] = x;
      yp[i] = y;
      //println(i);
      i++;
    }
    else {
      i=1;
      j=0;
      background(0);
     // println("array reset");
    }
  }
  void connect() {
    smooth();
    stroke(255, 30);
    line(xp[j], yp[j], xp[j+1], yp[j+1]);
    //println("x: "+xp[j]+", y: "+yp[j]);
    j++;
  }
}

