
int radius = 50;
int x = 50;// x-coordinate
int y = 50;// y-coordinate
int speedx = 5;//speed on x axis
int speedy = 3;//speed on y axis
int directionx = 1;
int directiony = 1;
int clr = 50;

void setup() {
  size(1000, 1000);
  smooth();
  noStroke(); 
  ellipseMode(RADIUS);
}

void draw() {
  background(0);
  x = x +(speedx*directionx);
  y= y + (speedy*directiony);

  ellipse(x, y, radius, radius);
  x += speedx *directionx;

  if (x > width -radius ) //right side hit? 
  {
    directionx = -directionx;
    fill((random(255)), (random(255)), (random(255)));
  }




  if (x < radius) { //left side
    directionx = -directionx;
    fill((random(255)), (random(255)), (random(255)));
  }




  if ( y > height- radius) { //bottom hit?
    directiony = -directiony; 
    fill((random(255)), (random(255)), (random(255)));
  }



  if (y < radius) {
    directiony = -directiony; //top hit?
    fill((random(255)), (random(255)), (random(255)));
  }
}
