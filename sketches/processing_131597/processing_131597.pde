
//copyright Sophie Vennix, siv
//Homework5
//February 4, 2014

float circleAx, circleAy, circleBx, circleBy, diam;
float speedAx, speedAy, speedBx, speedBy;
color circleAcolor=color(255, 0, 0);
color circleBcolor=color(0, 0, 255);

void drawCircle(float locX, float locY, color circleColor, float d)
{
  noStroke();
  fill(circleColor);
  ellipse(locX, locY, d, d);
}

void setup() 
{
  size(400, 400);
  fill(50, 50, 50, 100);
  rect(0, 0, width, height);
  //ellipseMode(CENTER);

  diam=100;

  circleAx=diam/2;
  circleAy=diam/2;
  circleBx=diam/2 + 300;
  circleBy=diam/2;
  //circleBx=width - (diam/2);
  //circleBy=height - (diam/2);

  speedAx=0;
  speedAy=2;
  speedBx=-4;
  speedBy=0;
}

void draw()
{

  prepWindow();
  moveFigures();
  drawFigures();
  //println("y", + circleAy);
  //println("x", + circleAx);
}


void prepWindow()
{
  fill(50, 50, 50, 100);
  rect(0, 0, width, height);
}

void drawFigures()
{
  drawCircle(circleAx, circleAy, color(0, 0, 255), diam);
  drawCircle(circleBx, circleBy, color(255, 0, 0), diam);
}

void moveFigures() {
  {
    circleAx = circleAx + speedAx;
    circleAy = circleAy + speedAy;

    circleBx = circleBx + speedBx;
    circleBy = circleBy + speedBy;
    
    //////////circle A collisions
    if (circleAy > height - diam/2) {

      circleAy = height - diam/2;
      speedAx=2;
      speedAy=0;
    }
    if (circleAx > width- diam/2) {
      circleAx = width - diam/2;
      speedAx=0;
      speedAy=-2;
    }
    if (circleAy < 0+ diam/2) {
      circleAy = 0 + diam/2;
      speedAx=-2;
      speedAy=0;
    }
    if (circleAx < 0+ diam/2) {
      circleAx = 0 + diam/2;
      speedAx=0;
      speedAy=2;
    }
    ////////////////////////////
  }

  //circle B collision/////
  { 
    if (circleBy < 0 + diam/2) {
      circleBy = 0 + diam/2;
      speedBx = -4;
      speedBy = 0;
      println("speedbx = " + speedBx);
    }
    else if (circleBx < 0 + diam/2) {
      circleBx = 0 + diam/2;
      speedBx=0;
      speedBy=4;
    }
    else if (circleBy > height - diam/2) {
      circleBy = height - diam/2;
      speedBx=4;
      speedBy=0;
    }
    else if (circleBx > width - diam/2) {
      circleBx = width - diam/2;
      speedBx=0;
      speedBy=-4;
    }
   //if (circleBy <= 0 + diam/2) {
      //circleBy=0;
      //speedBx=-4;
      //speedBy=0;
    }
  }
//}

////////////////////////////



