
//variables
float d;
float xPos;
float yPos; 
float xVel; 
float yVel;

float vertSquish=1;
float horSquish=1;

void setup() {
  size(600, 600);
  background(255);
  smooth();
  frameRate(60);

  xPos=random(0+ d/2, width-d/2);
  yPos=random(0+ d/2, height-d/2);
  xVel=random(-10, 10);
  yVel=random(-10, 10);
  d= random(50, 100);
}

void draw() {
  background(255);
  stroke(random(50, 255), random(50, 255), random(50, 255));
  strokeWeight(5);
  fill(0);
  ellipse(xPos, yPos, d*horSquish, d*vertSquish);


  xPos=xPos+xVel;
  yPos=yPos+yVel;


  //conditionals for movement

  //left and right wall

    if (xPos<0+(d/2) || xPos>width-(d/2)) {
    xVel=xVel*(-1);
    if (horSquish==1) {
      horSquish = .5;
    }
    if (vertSquish==.5) {
      vertSquish*=2;
    }
  }

  //top and bottom wall

  if (yPos<0+(d/2) || yPos>height-(d/2)) {
    yVel=yVel*(-1);
    if (vertSquish==1) {
      vertSquish = .5;
    }
    if (horSquish==.5) {
      horSquish=1;
    }
  }

  //  if (d=d/2) {
  //    ellipse(xPos, yPos, d/2, d);
  //    ellipse (xPos, yPos, d, d/2);
  //  }
}


