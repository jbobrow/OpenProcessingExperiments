
int num = 20;
int x[] = new int[num];
int y[] = new int[num];
int addx[] = new int[num];
int addy[] = new int[num];
color eli[] = new color[num];
ArrayList orb;
ArrayList bigface;

void setup() {

  size(800, 600,JAVA2D);
  background(0);
  smooth();
  bigface = new ArrayList();
  orb = new ArrayList();
  for (int i = 0;i<num;i++) {

    x[i] = int(random(width));
    y[i] = int(random(height));
    addx[i] = int(random(5));
    addy[i] = int(random(5));
    eli[i] = color(random(255), random(255), random(255) );
  }
  smooth();
  stroke(255);
}


void draw() {


  background(255);



  for (int i =0;i<num;i++) {
    ArrayList countConect = new ArrayList();
    for (int a =0;a<num;a++) {
      if (abs(x[i]-x[a]) <50 & abs(y[i]-y[a]) < 50) {
        line(x[i], y[i] + 5, x[a], y[a]+5);
        countConect.add(a);
      }
    }


    if (countConect.size() >= 4) {

      int xx = 0;
      int yy = 0;

      for (int m = 0;m<countConect.size();m++) {

        int n = (Integer) countConect.get(m);        
        orb.add(new Orb(x[n], y[n]));
        xx = xx + x[n];
        yy = yy + y[n];
        x[n] =int(random(width));
        y[n] =int(random(height));


      }
      xx = xx/countConect.size();
      yy = yy/countConect.size();

      bigface.add(new BigFace(xx, yy));
    }
  }
  for (int i =0;i<num;i++) {

    fill(255);
    strokeWeight(1);
    stroke(0);
    ellipse(x[i], y[i], 30, 30);
    fill(eli[i]);
    strokeWeight(3);
    point(x[i] - 5, y[i] - 3);
    point(x[i] + 5, y[i] - 3);
    point(x[i], y[i] + 5);



    x[i] = x[i] + addx[i];
    y[i] = y[i] + addy[i];
    if (x[i] > width)x[i] = int(random(width));
    if (y[i] > height)y[i] = int(random(height));
  }

  for (int i = 0;i<bigface.size();i++) {

    BigFace bigfaces = (BigFace) bigface.get(i);

    bigfaces.disp();

    if (bigfaces.end())bigface.remove(i);
  }

  for (int i=0;i<orb.size();i++) {

    Orb orbs = (Orb) orb.get(i);

    orbs.disp();

    if (orbs.end() == true)orb.remove(i);
  }
}

class Orb {
  int x;
  int y;
  int ad;
  int al = 255;
  Orb(int _x, int _y) {

    x = _x;
    y = _y;
  }

  void disp() {
    noFill();
      strokeWeight(1);
    stroke(0, 0, 0, al);
    ellipse(x, y, ad, ad);

    ad = ad + 10;
    al = al - 20;
  }

  boolean end() {

    boolean m = false;

    if (al<0)m = true;

    return m;
  }
}



class BigFace {

  int x, y, addX, addY;
  BigFace(int _x, int _y) {

    x = _x;
    y = _y;
    addX=int(random(1, 3));
    addY=int(random(1, 3));
  }


  void disp() {

    fill(255);
    stroke(0);
    ellipse(x, y, 90, 90);
    noStroke();
    fill(0);
    ellipse(x - 15, y - 9, 5, 5);
    ellipse(x + 15, y - 9, 5, 5);
    ellipse(x, y + 15, 5, 5);
    x = x + addX;
    y = y + addY;
  }

  boolean end() {
    boolean m = false;

    if (x -45 > width | y - 45 > height)m = true;

    return m;
  }
}
