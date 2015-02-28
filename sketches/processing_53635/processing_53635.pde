

SpaceShip p;
SpaceShip p2;

void setup () {
  background(132,0,46);
    fill(255,255,0);
    size(500,500);
    p = new SpaceShip ();
    p2 = new SpaceShip();
}

void draw () {
  background(132,0,46);

  p.displaySpaceShip();
  p.move ();
  
  p2.displaySpaceShip2 ();
  }


//-------------------Object--------------------

class SpaceShip {

 float x = width/2;
 float y = height/2;
  
  void move () {
  x = mouseX-10;
  y = mouseY-10;
}
 
void displaySpaceShip () {
  fill(100,100,200);
  noStroke();
  ellipse(x, y, 100, 100);
  smooth ();
  float p = 185;
  float m = 163;
  float r = 55;
  float q = 50;
  fill(0);
  ellipse(x, y, 100, q);
  fill(100,100,30);
  ellipse (x,y,55,10);
}

void displaySpaceShip2 () {
  
    x = mouseX-100;
  y = mouseY-100;
  
  fill(80,10,100);
  noStroke();
  ellipse(x, y, 70, 70);
  smooth ();
  float p = 185;
  float m = 163;
  float r = 55;
  float q = 38;
  fill(0,10,10);
  ellipse(x, y, 70, q);
  fill(80,200,30);
  ellipse (x,y,55,10);
}
}







