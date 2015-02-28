
class Creature {

  int r;
  int g;
  int b;
  int footX;
  int footY;
  int x;
  int y;

  //constructor connected to new Creature()
  Creature(int px, int py) {
    x=px;
    y=py;
  }


  void colourise () {
    r = mouseX;
    g = mouseY;
    b = 100;
  }

  void setFootPosition() {
    footX = mouseX;
    footY = mouseY;
    footX = constrain(footX, x-40, x+40);
    
  }

  void display() {
    // draw Albert's head/body
    rectMode(CENTER);
   rect(x,y-80,100,40);
rect(x,y-20,150,80);

    //Draw Albert's eyes/ eyeball's
    ellipseMode (CENTER);
    ellipse (x-40,y-80,30,50);
    ellipse (x+40,y-80,30,60);
    stroke (0);
    fill (0);
    ellipse (x+40,y-80,20,10);
    ellipse (x-40,y-80,10,40);

    //Draw Albert's mouth/ teeth
    rectMode (CENTER);
    rect(x,y-20,80,40);
    rect(x,y,30,10);
    stroke (0);
    fill (255);
    rect (x-20,y-30,10,20);
    rect (x+20,y-30,10,20);

    line (x-40,y+20,x-40,y+60);
line (x+40,y+20,x+40,y+60);
line (x-75,y-60,x-120,y-30);
line (x+75,y-60,x+100,y-10);

    //draw Albert's shoes
    stroke (0);
    fill (240,0,0);
    ellipseMode (CENTER);
    ellipse (200,210,20,10);
    //setting color
    fill(r,g,b);
    ellipse (footX, footY,20,10);
  }
}

//all functions look like this
/*
 void functionName () {
 
 }
 */

