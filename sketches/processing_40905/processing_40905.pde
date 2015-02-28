
//Gina DeMatteo
//Homework 7_2
//Rectangle Extravaganza

//Establishing Integers
int num =50; //Number of rectangles being drawn per loop
color C1, C2;//Colors
Rectangle[] GinasRect = new Rectangle [num];//Sets Array of Rectangles


void setup() {
  size(300, 300);
  background(0);

  //Color Palette  
  C1= color(148, 220, 245, 10);
  C2= color(250, 214, 30, 10);

  //Seeding the Array  
  for (int i=0; i < GinasRect.length; i++) {
    GinasRect[i] = new Rectangle();
  }
}

void draw () {

  //Drawing the Array 
  for (int i=0; i< GinasRect.length; i++) {
    GinasRect[i].update();
    GinasRect[i].draw();
  }
}

class Rectangle {


  float X1 = random(5, 270);
  float Y1 = random(60, 230);


  Rectangle() {
  }
  //Establishes Rectangle movement and direction
  void update() {
    X1 = X1 + random (-3, 3);
    Y1 = Y1 + random (-3, 3);
    if (X1 < 150);
    if (Y1 < height);
    X1 = X1 +2;
    Y1 = Y1 -2;
    if (X1 > width/2);
    X1 = X1 - random(2, 2.1);
    Y1 = Y1 +2;
  }

  void draw() {

    //Rectangle Properties//size and Positioning

    stroke (0);

    strokeWeight (random (.25, .5));
    fill(C2);

    rect(.3 * 2 * X1, .3 * 2 * Y1, 40, 40);

    fill(C1);
    rect(.5 * 1.5 * X1, .5 * 1.5 * Y1, 100, 100);
  }
}



