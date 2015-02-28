
PImage stsc;
PImage bg;
PImage boat;
PImage end;

int myState = 0;

Ship[] ships;
int x;
int[] startX = {
  80, 230, 380, 530, 680
};
int[] startY = {
  550, 550, 550, 550, 550
};
float[] scalars = {
  1, 1, 1, 1, 1
};


void setup() {
  smooth();
  size(790, 600);
  noStroke();
  stsc = loadImage("starting_screen.jpg");
  bg = loadImage("Background.jpg");
  boat = loadImage("boat.png");
  end = loadImage("end.jpg");
  ships = new Ship[5];
  for (int i=0;i<ships.length;i++) {
    ships[i] = new Ship(startX[i], startY[i], scalars[i]);
  }
  x = 0;
} // End of setup()

void draw() {
  switch(myState) {
  case 0:
    image(stsc, 0, 0);
    break; 

  case 1:
    background(bg);
    for (int i = 0; i < 5; i++)
    {
      ships[i].drawShip();
    }
    break;

  case 2:
    image(end, 0, 0);
    break;
  }
} // End of draw()

void keyPressed() { // This function is called everytime a key is pressed.
  if ( key >= '1' && key <= '5') {
    x = key - '1';
    return;
  }
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      ships[x].moveUP();
    }
    else if (keyCode == DOWN)
    {
      ships[x].moveDOWN();
    }
    else if (keyCode == LEFT)
    {
      ships[x].moveLEFT();
    }
    else if (keyCode == RIGHT)
    {
      ships[x].moveRIGHT();
    }
  }
} // End of keyPressed()

void mousePressed() {
  if (myState == 0) {
    myState = 1 ;
  }

  if (myState == 2) {
  }
  myState = 1;
}

class Ship {
  int locationX;
  int locationY;
  float scalar;
  Ship(int x, int y, float scl) 
  {
    locationX = x;
    locationY = y;
    scalar = scl;
  }
  void drawShip() 
  {

    pushMatrix();
    scale(scalar, scalar);
    translate(locationX, locationY);
    image(boat, 0, 0);
    popMatrix();
  }
  void moveUP()
  {
    locationY = locationY - 10;
  }
  void moveDOWN()
  {
    locationY = locationY + 10;
  }    
  void moveLEFT()
  {
    locationX = locationX - 10;
  }    
  void moveRIGHT()
  {
    locationX = locationX + 10;
  }
} // End class Ship


//dock the boats in 40 seconds or less!



