

SpaceShip p;

void setup () {
  background(132,0,46);
    fill(255,255,0);
    size(500,500);
    p = new SpaceShip ();
}

void draw () {
  background(132,0,46);

  p.displaySpaceShip();
 
  p.move ();
 
  
}


//-------------------Object--------------------

class SpaceShip {

 float x = width/2;
 float y = height/2;

 
 void move () {
  x = mouseX-20;
  y = mouseY-20;
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

}


