
float[] pR = {
  360, 140, 
  340, 110, 
  310, 90, 
  270, 70, 
  230, 70, 
  190, 90, 
  160, 110, 
  130, 160, 
  150, 220, 
  180, 240, 
  240, 250, 
  300, 260, 
  340, 280, 
  350, 290, 
  380, 350, 
  350, 400, 
  300, 420, 
  200, 420, 
  160, 400, 
  140, 380
};

float[] pB = {
  150, 120,
  180, 90,
  220, 70,
  250, 70,
  330, 100,
  360, 130,
  360, 170,
  340, 210,
  310, 230,
  280, 250,
  240, 270,
  210, 300,
  220, 330,
  240, 340,
  250, 400,
  240, 420,
  260, 420
};

float r, g, b, s1;
int x = 0;
int y = 0;
int w = 10;
int h = 10;

int s2;
float modulo;

int d = 30;


void setup() {
  size(500, 500);
  background(255);
  smooth();
  noStroke();
}

void draw() {


  if (x<=width) {
    for (y = 0; y<=height; y+=h) {
      s1=random(100);
      s2 = int(s1);
      modulo = s2 % 2;

      if (modulo == 0) {
        r = random(150, 255-2*d);
        g = random(d, 150);
        b = random(d, 150);
        fill(r, g, b);
        ellipse(x, y, w, h);
      }

      if (modulo != 0) {
        r = random(d, 150);
        g = random(150, 255-2*d);
        b = random(150, 255-2*d);
        fill(r, g, b);
        ellipse(x, y, w, h);
      }
    }
    x+=w;
  }

  if (x==width+w) {
    for (int iR = 1; iR<pR.length; iR+=2) {
      r = random(255-d, 255);
      g = random(0, d);
      b = random(0, d);
      fill(r, g, b);
      ellipse(pR[iR-1], pR[iR], w, h);
    }

    for (int iB = 1; iB<pB.length; iB+=2) {
      r = random(0, d);
      g = random(255-d, 255);
      b = random(255-d, 255);
      fill(r, g, b);
      ellipse(pB[iB-1], pB[iB], w, h);
    }

    //    for (int i = 0; i < 10; i++) {
    //      r = random(255-d, 255);
    //      g = random(0, d);
    //      b = random(0, d);
    //      fill(r, g, b);
    //      ellipse(width/5+10*i, height/5+30*i, w, h);
    //
    //      r = random(0, d);
    //      g = random(255-d, 255);
    //      b = random(255-d, 255);
    //      fill(r, g, b);
    //      ellipse(2*width/5+10*i, height/5+30*i, w, h);
    //    }

    x+=w;
  }
}
