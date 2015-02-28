
// declare the array and set size

PShape img;
Sinewave [] waves = new Sinewave [100];

void setup () {
  img = loadShape("star.svg");
  size (900,600);
  smooth ();


  // use array to fill class with values

  for (int i=0; i <waves.length; i++) {

    float xpos = (width/(waves.length)*i + width/(waves.length)*(.5) );
    float ypos = height/2;
    float theta = .1*i;
    float tChange =.1;
    int radius = 10;
    int r = 50;

    waves[i] = new Sinewave (xpos, ypos, theta, tChange, radius, r);
  }
}



void draw () {

  noStroke();
  background (0);



  // call the array to display all
  for (int i = 0; i < waves.length; i++) {
    waves[i].display();
  }
}

class Sinewave {
  // data
  float xpos;
  float ypos;
  float theta;
  float tChange;
  int radius;
  int r;

  // constructor

    Sinewave (float tempX, float tempY,float tempTheta, float tempTChange, int tempRadius, int tempR) {

    xpos= tempX;
    ypos= tempY;
    theta = tempTheta;
    tChange= tempTChange;
    radius = tempRadius;
    r = tempR;
  }

  //methods and functions

  void display () {
    rectMode(CENTER);
    stroke (map (xpos, 0, width, 100, 255), 50+map(xpos, 0, width, 50, 200), map(xpos, 0, width, 0, 255));
    strokeWeight(.5);
    ellipse(xpos*1.5, ypos + sin(theta+1)*r, xpos+100, cos(theta/2)*r+200);
    fill (100+100*sin(theta), 150+80*cos(theta), map(xpos, 0, width, 0, 255));
    noStroke();

    shape(img, xpos-200 ,ypos-200 +sin(theta)*r, 100, 100);

    //increment theta

    theta += tChange;
  }
}


