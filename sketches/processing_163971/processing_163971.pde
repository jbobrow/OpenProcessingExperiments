
// @pjs preload must be used to preload the image 

/* @pjs preload="data/floor.png"; 
@pjs preload="data/wall.png"; 
@pjs preload="data/actor.png"; 
@pjs preload="data/beacon.png"; 
*/

WorldView view;
Actor bob;

boolean begin = false; //variable to check if the actor moved or not


void setup() {
  size(15 * 32, 10 * 32); //15x10 world, 32px square tiles
  frameRate(15); //set a framerate at which we can see the animation

  view = new WorldView(); //create a new world view
  bob = new Actor(3, 2); //create
}


void draw() { 
  bob.action();
  view.display();
  
  
  //if actor isn't moving you can edit your world
  if (!begin) {
    view.update();
  }
}



class Actor {
  public int posX;
  public int posY;
  private boolean started = false;

  Actor(int y, int x) {
    posY = y;
    posX = x;
  }

  void moveUp() {
    int newposY = posY - 1;
    view.grid[newposY][posX] = 2;
    view.grid[posY][posX] = 0;
    posY = newposY;
    println("GOING up");
  }

  void moveDown() {
    int newposY = posY + 1;
    view.grid[newposY][posX] = 2;
    view.grid[posY][posX] = 0;
    posY = newposY;
    println("GOING down");
  }

  void moveRight() {
    int newposX = posX + 1;
    view.grid[posY][newposX] = 2;
    view.grid[posY][posX] = 0;
    posX = newposX;
    println("GOING RIGHT");
  }

  void moveLeft() {
    int newposX = posX - 1;
    view.grid[posY][newposX] = 2;
    view.grid[posY][posX] = 0;
    posX = newposX;
    println("GOING LEFT");
  }

  void starting() {
    view.grid[posY][posX] = 2;
  }

  void action() {
    if (keyPressed && key == ' ') {
      if (begin) {
        begin = false;
      } else {
        begin = true;
      }
    }

    if (begin) {
      if (!started) {
        started = true;
        starting();
      }

      //x1 view.grid[posY-1][posX] && view.grid[posY-1][posX+1]
      //x2 view.grid[posY][posX+1] && view.grid[posY+1][posX+1] 
      //x3 view.grid[posY+1][posX] && view.grid[posY+1][posX-1] 
      //x4 view.grid[posY][posX-1] && view.grid[posY-1][posX-1] 

      if ((view.grid[posY-1][posX] == 1 || view.grid[posY-1][posX+1] == 1) && (view.grid[posY][posX+1] == 0 || view.grid[posY-1][posX+1] == 0)) {
        moveRight();
      } else if ((view.grid[posY][posX-1] == 1 || view.grid[posY-1][posX-1] == 1) && (view.grid[posY-1][posX] == 0 || view.grid[posY-1][posX+1] == 0)) {
        moveUp();
      } else if ((view.grid[posY+1][posX] == 1 || view.grid[posY+1][posX-1] == 1) && (view.grid[posY][posX-1] == 0 || view.grid[posY-1][posX-1] == 0)) {
        moveLeft();
      } else if ((view.grid[posY][posX+1] == 1 || view.grid[posY+1][posX+1] == 1) && (view.grid[posY+1][posX] == 0 || view.grid[posY+1][posX-1] == 0)) {
        moveDown();
      } else {
        moveUp();
      }
      
      if (view.grid[posY+1][posX] == 3|| view.grid[posY][posX+1] == 3|| view.grid[posY-1][posX] == 3|| view.grid[posY][posX-1] == 3) {
        begin = false;
        javax.swing.JOptionPane.showMessageDialog(null, "YOU'VE REACHED THE BEACON");
      }
    }
  }
}



// Class for animating a sequence of GIFs

class WorldView {

  //create a 2d array that 
  int [][] grid = { 
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1}, 
    {1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
    {1, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1}, 
    {1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1}, 
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
  };                  

  PImage[] images;



  WorldView() {

    images = new PImage[4];

    images[0] = loadImage("floor.png");
    images[1] = loadImage("wall.png");
    images[2] = loadImage("actor.png");
    images[3] = loadImage("beacon.png");
  }


  void display () {
    int size = images[0].width;
    for (int k = 0; k < grid.length; k ++)
      for (int i =0; i <grid[0].length; i++) 
        image(images[grid[k][i]], size *i, size*k);
  }

  void update() {
    int x = mouseX / getWidth();
    int y = mouseY / getWidth();

    if (mousePressed) {
      if (mouseButton == LEFT) {
        if (grid[y][x] == 1) {
          grid[y][x] = 0;
        } else if (grid[y][x] == 0) {
          grid[y][x] = 1;
        }
        delay(100);
      }

      if (mouseButton == RIGHT) {
        if (grid[y][x] == 3) {
          grid[y][x] = 0;
        } else if (grid[y][x] == 0) {
          grid[y][x] = 3;
        }
        delay(100);
      }
    }
  }

  int getWidth() {
    return images[0].width;
  }
}



