
float x =50.0;
float y = 50.0;
float radius = 15.0;
int diameter = 30;
int ydistance = diameter/2;
int xdistance = diameter/2;
float speed = 2.0;
float directionX = 1;
float directionY = 1;
int counter =0;

void setup() {
  size(500, 500);
  smooth();
  noStroke();

  ellipseMode(RADIUS);
}

void draw () {
  background(0);

  //  fill(255);
  //  rect(0, y-diameter, diameter, 300);
  //left side paddle

  fill(255);
  rectMode(CENTER);
  rect(width-radius, mouseY, diameter, 100);
  //rect(width-diameter, y-diameter, diameter, 300);

  textSize(40);
  text("score: " + counter, 50, 50);
  //write score

  //Move me
  ydistance += speed*directionY;
  xdistance += speed*directionX;

  fill(255);
  ellipse(x, y, radius, radius);
  x += speed* directionX;



  if (x >(width - radius)){
 // && (y<mouseY - 100))

    directionX = - directionX;
  }


  if (x<radius)  {
    directionX = - directionX;
  }

  if (x>(width - 3*radius)) {
    directionX=-directionX; 
    counter ++;
  }//bounce ball off paddle  //scoring

  y += speed* directionY;
  if ((y >(height - radius)) || (y<radius)) {
    directionY = - directionY;
  }
}



