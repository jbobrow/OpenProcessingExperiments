
int num = 3;


Route[] s = new Route[num];

//Drawing controls
float PRand = 50;
float sRand = 7;
float SS = 8;
float SSR = 8;

int [] col = new int[num];


void setup () {

  size (800, 800);
  background (255);
  smooth ();

  for (int i = num - 1; i > 0; i--) {
    if(i%2 == 0) {
      s[i] = new Route();
    }
    else {  
      s[i] = new Score();
    }
  }
}

  void draw () {
    translate (width/2, height/2);
    for (int i = num - 1; i > 0; i--) { 
      s[i].update();
      s[i].display();
    }
  }






  void scribble (float x, float y, float sx, float sy) {
    beginShape();
    curveVertex(x + (-sx) + random (-sRand, sRand),y + (-sy) + random (-sRand, sRand));
    curveVertex(x + (-sx) + random (-sRand, sRand),y + (sy) + random (-sRand, sRand));
    curveVertex(x + (sx) + random (-sRand, sRand),y + (sy) + random (-sRand, sRand));
    curveVertex(x + (sx) + random (-sRand, sRand),y + (-sy) + random (-sRand, sRand));
    curveVertex(x + (-sx) + random (-sRand, sRand),y + (-sy) + random (-sRand, sRand));
    curveVertex(x + (-sx) + random (-sRand, sRand),y + (sy) + random (-sRand, sRand));
    curveVertex(x + (sx) + random (-sRand, sRand),y + (sy) + random (-sRand, sRand));
    endShape();
  }



  class Route {
    float x;
    float y;
    float Size;

    Route() {
      x = 0;
      y = 0;
      Size = (SS);
    }

    void update() {

      x += random(-PRand, PRand);
      y += random(-PRand, PRand);
      Size -= 0.02;
      if (Size <= -SSR) {
        Size = SSR;
      }
    }
    void display() {
      noStroke ();
      fill (0);
      scribble (x, y, Size, Size);
    }
  }

  class Score extends Route {

    float x;
    float y;
    float Size;

    Score () {
      x = 0;
      y = 0;
      Size = SS;
    }

    void update () {

      x += random(-PRand, PRand);
      y += random(-PRand, PRand);
      Size -= 0.02;
      if (Size <= -SSR) {
        Size = SSR;
      }
    }

    void display() {
      frameRate(30);
      stroke (0);
      noFill();
      scale(3);
      strokeWeight(1);
      scribble (x, y, Size, Size);
    }
  }


