
//Michelle Philpott
//PS 3 - Question 4
//rosalie cronin helped me on this question 



Vortex [] vortex = new Vortex [130];

void setup () {
  size (600, 600);
  smooth();

  
  for (int i=0; i < vortex.length; i = i + 1) {
    int r = 1*i;
    float t = .0015*i;
    vortex[i] = new Vortex ( 0, r, t);
  }
}


void draw () {
  background (130);
  for (int i = 0; i < vortex.length; i++) {
    vortex[i].move();
  }
}
//--------------------------
class Vortex {

  //declare variables

  float theta; 
  float r; 
  float t;

  Vortex (float tempTheta, int tempR, float tempT) {
    theta = tempTheta;
    r = tempR;
    t = tempT;
  }


  void move () {
    float a = random(244, 200);
    float b = random(100, 250);
    float c = random (200, 255);

    fill (c, a, b, 100);
    noStroke ();
    star(5, width/2 + cos(theta)*r, height/2 + sin(theta)*r, r, r, -PI / 2.0, 0.4);

    theta = theta + t/2;//angle at what it rotates at
  }
}

void star(int n, float cx, float cy, float r, float proportion) {

  star(n, cx, cy, 2.0 * r, 2.0 * r, 0.0, proportion);
}


void star(int n, float cx, float cy, float w, float h, float startAngle, float proportion) {

  if (n > 2) {
    float angle = TWO_PI/ (2 *n);  
    float dw; 
    float dh; 

    
    beginShape();

  
    for (int i = 0; i < 2 * n; i++)
    {
      dw = w;
      dh = h;
      if (i % 2 == 1) //
      {
        dw = w * proportion;
        dh = h * proportion;
      }
      vertex(cx + dw * cos(startAngle + angle * i),
      cy + dh * sin(startAngle + angle * i));
    }
    endShape(CLOSE);
  }
}


