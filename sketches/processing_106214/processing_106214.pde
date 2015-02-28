
//Henon phase strange attractor
//Ale González, Public Domain, 2013
//I only fiddled w/ a few values...
//Color tweaks background to black, points to green
//f value changed to negative changing direction of rotation.
//int N = dropped to 200, e=10 taken out completely


int N= 200,  cx, cy;//e=10,
float A, C, S, f;
Henon[] henons;

void setup()
{
  size (600, 600); 
  noFill();
  stroke (#A8FF08);//(0x20000000);
  cx= width/2;
  cy= height/2;
  f= -200;
  reset ();
}

void reset ()
{
  A= random (TWO_PI);
  C= cos(A); 
  S= sin(A);
  float a = 1./N;
  henons = new Henon[N];
  for (int i=0; i<N; henons[i++]= new Henon (i*a, noise (i*.05)));
  background (#000000);//#ffffff
}

void draw () { 
  for (int i=0; i<N; henons[i++].go_henons_go());
}

void mouseClicked () { 
  reset ();
}

//

class Henon
{
  float x, y, k;

  Henon (float X, float Y) {
    x = X; 
    y = Y;
  }

  void go_henons_go () {
    k = y - x*x;
    y = (x * S) + (k * C);
    x = (x * C) - (k * S); 
    point (cx + f*x, cy + f*y);
  }
}

