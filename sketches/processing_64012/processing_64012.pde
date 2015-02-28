
/* OpenProcessing 
Tweak of *@*http://www.openprocessing.org/sketch/63755*@* 
by @Makio135
*/

int CIRCLES_COUNT=20;

//declare
ShakingCircle[] neurons = new ShakingCircle[CIRCLES_COUNT];

void setup() {
  size(800, 600);
  background(0);
  smooth();
  noStroke();

  //init
  for (int i=0; i<CIRCLES_COUNT; i++) {
    neurons[i]= new ShakingCircle(255, random(width), random(height), random(50), 36);
  }
}

void draw() {
  for (int i=0; i<CIRCLES_COUNT; i++) {
    /*for (int m=0; m<neurons[i].v; m++) {
      for (int j=i+1;j<CIRCLES_COUNT-1; j++) {
        for (int k=0; k<neurons[j].v; k++) {
          if (dist(neurons[i].x[m], neurons[i].y[m], neurons[j].x[k], neurons[j].y[k])<8) {
            neurons[i].ra[m]+=.05;
          }
        }
      }
    }*/

    neurons[i].display();
  }
}

void mousePressed() {
  //init
  for (int i=0; i<CIRCLES_COUNT; i++) {
    neurons[i]= new ShakingCircle(255, random(width), random(height), random(50), 36);
  }
  background(0);
}


class ShakingCircle {

  color c; 
  float cx, cy, r, transp;
  int v;
  float[] n, ra, a;
  float[] x, y;

  //constructor
  ShakingCircle(color tempC, float tempCX, float tempCY, float tempR, float tempV ) {
    c = tempC; //color(255);
    cx = tempCX; //width/2;
    cy= tempCY; //width/2;
    r=0; //width/4; //radius
    v=int(random(4, 7)); //number of points
    transp=50;//transparence de base
    n=new float[v];
    ra=new float[v];
    a=new float[v];
    x=new float[v];
    y=new float[v];
    for (int i=0; i<v;i++) {
      n[i]=random(50);//noise seed
      ra[i]=random(5, 10);//radius
      a[i]=random(360);//angles
    }
  }

  void display() {
    r+=.5;
    if (transp>10) transp--;

    fill(c, transp);
    //draw circles
    for (int i=0; i<v; i++) {
      if (ra[i]>0) {      
        n[i]+=.08;
        a[i]+=.5-noise(n[i])*1;

        x[i] = cos(radians(a[i]))*r+ cx;
        y[i] = sin(radians(a[i]))*r+ cy;

        // start drawing
        ellipse(x[i], y[i], ra[i], ra[i]);
      }
      ra[i]-=.01;
    }
  }
}

