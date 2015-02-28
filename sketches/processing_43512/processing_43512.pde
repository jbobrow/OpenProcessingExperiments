
//PROJECT 2: Courtney Hathaway and Patricia Sharp

PImage myPic;
int cell = 1500;                     // number of ellipses
int maxSize = 15;                   //maximum size of the ellipse

Thing things[] = new Thing[cell];

void setup() {
  size(500, 500);

  myPic = loadImage("P2PattiCourtney.jpg");


  for (int i=0; i<cell; i++) {
    things[i] = new Thing(random(width), random(height));
    if (random(2) > 1) {
      things[i].flip = true;
    }
  }
  noStroke();
  smooth();
}



void draw() {
  background(0);

  for (int i=0; i<cell; i++) {
    things[i].move();              // tells the draw frame to move the ellipses
    things[i].display();           //tells the draw frame to display the ellipses
  }
}




class Thing {

  float x;
  float y;
  float xv=3;                       // the x velocity at which the ellipses move
  float yv=3 ;                      // the y velocity at which the ellipses move
  color c;
  boolean flip;                    // allows writting of True/False statement
  float r;                         // variable for radius


  Thing(float x_, float y_) {
    x = x_;
    y = y_;
  }

  void move() {
    y+=random(-yv, yv);
    x+=random(-xv, xv);

    // a way of debugging the system and making sure that the x,y values are valid
    if (x > width) x = 0;
    if (x < 0) x = width-1;
    if (y < 0) y = height-1;
    if (y > height) y = 0;
  }


  void display() {
    int nx = int(x);               // converts floats to int, simplifying the math
    int ny = int(y);               // converts floats to int, simplifying the math

    //our attempt at altering the velocity, but we thought that a constant velocity was better
    //unhash this and hash the values for xv,xy in "class Thing"
    //xv =  maxSize * (green(myPic.pixels[nx + (ny * 499)]) / 60);
    //yv =  maxSize * (green(myPic.pixels[nx + (ny * 499)]) / 60);

    r = maxSize * (saturation(myPic.pixels[nx + (ny * 499)]) / 255);
    c = myPic.get(int(x), int(y));
    fill(c);
    ellipse(x, y, r, r);
  }
}


