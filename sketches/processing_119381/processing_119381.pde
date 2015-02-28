
PImage playerModel;
boolean moveLeft = false;
boolean moveRight = false;
boolean jump = false;
float cameraOffsetX;

Player thePlayer = new Player();
World theWorld = new World();

void setup()
{
  size(600, 480);

  playerModel = loadImage("enemy2.png");
}

void draw()
{
  pushMatrix();
  translate(-cameraOffsetX, 0);
  updateCamera();
  theWorld.render();
  thePlayer.display();
  thePlayer.move();
  thePlayer.checkCollision();
  thePlayer.checkForFalling();
  popMatrix();
}

void updateCamera() 
{
  int rightEdge = World.gridWidth*World.gridUnitSize - width;

  cameraOffsetX = thePlayer.pos.x - width/2;
  if (cameraOffsetX < 0) {
    cameraOffsetX = 0;
  }

  if (cameraOffsetX > rightEdge) {
    cameraOffsetX = rightEdge;
  }
}

void keyPressed()
{
  if (keyCode == 'A')
  {
    moveLeft = true;
  }
  if (keyCode == 'D')
  {
    moveRight = true;
  }
  if (key == ' ')
  {
    jump = true;
  }
}

void keyReleased()
{
  if (keyCode == 'A')
  {
    moveLeft = false;
  }
  if (keyCode == 'D')
  {
    moveRight = false;
  }
  if (key == ' ')
  {
    jump = false;
  }
}

class Player {
  PVector pos, vel;
  float w, h;
  boolean isOnGround = false;
  boolean facingRight = true;

  float gravity = .25;
  float groundFriction = .6;
  float airFriction = .85;
  float groundSpeed = 5.0;
  float airSpeed = 2.0;
  float trivialSpeed = 1.0;
  float jumpPower = 10;

  Player()
  {
    pos = new PVector();
    vel = new PVector();
    vel.x = 0;
    vel.y = 0;
    pos.x = 100;
    pos.y = 400;
    w = 38;
    h = 36;
  }

  float getX() {
    return pos.x;
  }

  float getY() {
    return pos.y;
  }  

  float getW() {
    return w;
  }

  float getH() {
    return h;
  }

  void checkForFalling() {
    if (theWorld.worldSquareAt(pos) == World.empty) {
      isOnGround = false;
    }
    if (isOnGround == false) {
      if (theWorld.worldSquareAt(pos) == World.solid) {
        isOnGround = true;
        pos.y = theWorld.topOfSquare(pos);
        vel.y = 0;
      } 
      else {
        vel.y += gravity;
      }
    }
  }

  void checkCollision()
  {
    float wallDist = w/2;
    float ceilingDist = h;   

    PVector topRight, topLeft, bottomRight, bottomLeft, head, feet;
    topRight = new PVector();
    topLeft = new PVector();
    bottomRight = new PVector();
    bottomLeft = new PVector();
    head = new PVector();
    feet = new PVector();

    topLeft.x = bottomLeft.x = pos.x - wallDist;
    topRight.x = bottomRight.x = pos.x + wallDist;
    topLeft.y = topRight.y = pos.y - ceilingDist*0.8;
    bottomLeft.y = bottomRight.y = pos.y - ceilingDist*0.2;
    head.x = pos.x;
    head.y = pos.y - h;

    if (theWorld.worldSquareAt(head) == World.solid) {
      if (theWorld.worldSquareAt(pos) == World.solid) {
        pos.sub(vel);
        vel.x = 0;
        vel.y = 0;
      } 
      else {
        pos.y = theWorld.bottomOfSquare(head) + ceilingDist;
        if (vel.y < 0) {
          vel.y = 0;
        }
      }
    }

    if (theWorld.worldSquareAt(bottomLeft) == World.solid) {
      pos.x = theWorld.rightOfSquare(bottomLeft) + wallDist;
      if (vel.x < 0) {
        vel.x = 0;
      }
    }

    if (theWorld.worldSquareAt(topLeft) == World.solid) {
      pos.x = theWorld.rightOfSquare(topLeft) + wallDist;
      if (vel.x < 0) {
        vel.x = 0;
      }
    }

    if (theWorld.worldSquareAt(bottomRight) == World.solid) {
      pos.x = theWorld.leftOfSquare(bottomRight) - wallDist;
      if (vel.x > 0) {
        vel.x = 0;
      }
    }

    if (theWorld.worldSquareAt(topRight) == World.solid) {
      pos.x = theWorld.leftOfSquare(topRight) - wallDist;
      if (vel.x > 0) {
        vel.x = 0;
      }
    }
  }

  void display()
  {
    if (vel.x < -trivialSpeed) {
      facingRight = false;
    }
    else if (vel.x > trivialSpeed) {
      facingRight = true;
    }

    pushMatrix();
    translate(pos.x, pos.y);
    if (facingRight) {
      scale(-1, 1);
    }
    translate(-w/2, -h);
    image(playerModel, 0, 0);
    popMatrix();
  }

  void move()
  {
    if (!isOnGround)
    {
      vel.y += gravity;
    }
    else {
      vel.y = 0;
      if (jump) vel.y = -jumpPower;
    }

    float speed = (isOnGround ? groundSpeed : airSpeed);
    float friction = (isOnGround ? groundFriction : airFriction);

    pos.add(vel);

    if (moveLeft) vel.x -= speed;
    if (moveRight) vel.x += speed;

    vel.x *= friction;
  }
}

class World {
  static final int solid = 1;
  static final int empty = 0;
  static final int start = 4;

  static final int gridUnitSize = 60;
  static final int gridWidth = 28;
  static final int gridHeight = 8;

  int[][] worldGrid = {
    {
      2, 0, 2, 0, 0, 0, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0
    }
    , 
    {
      0, 2, 0, 0, 0, 0, 2, 2, 1, 4, 0, 0, 0, 2, 2, 2, 2, 0, 0, 0, 0, 2, 2, 0, 2, 0, 2, 0
    }
    , 
    {
      2, 0, 2, 0, 4, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0
    }
    , 
    {
      0, 0, 0, 2, 0, 2, 0, 0, 2, 2, 2, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 2, 0, 1, 0
    }
    , 
    {
      0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 2, 0, 1, 0
    }
    , 
    {
      0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 2, 2, 2, 2, 2, 0, 0, 1, 0, 0, 0, 2, 0, 1, 0
    }
    , 
    {
      0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 0
    }
    , 
    {
      1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 2, 1, 0, 1, 0, 2, 0, 0, 0, 0, 1, 2, 1, 2, 1, 0
    }
  };


  World() {
  }

  int worldSquareAt(PVector here) {
    float gridSpotX = here.x/gridUnitSize;
    float gridSpotY = here.y/gridUnitSize;

    if (gridSpotX < 0) {
      return solid;
    }
    if (gridSpotX >= gridWidth) {
      return solid;
    }
    if (gridSpotY < 0) {
      return solid;
    }
    if (gridSpotY >= gridHeight) {
      return solid;
    }

    return worldGrid[int(gridSpotY)][int(gridSpotX)];
  }

  float topOfSquare(PVector here) {
    int thisY = int(here.y);
    thisY /= gridUnitSize;
    return float(thisY*gridUnitSize);
  }

  float bottomOfSquare(PVector here) {
    if (here.y < 0) {
      return 0;
    }
    return topOfSquare(here) + gridUnitSize;
  }

  float leftOfSquare(PVector here) {
    int thisX = int(here.x);
    thisX /= gridUnitSize;
    return float(thisX*gridUnitSize);
  }

  float rightOfSquare(PVector here) {
    if (here.x < 0) {
      return 0;
    }

    return leftOfSquare(here) + gridUnitSize;
  }

  void render() {

    for (int i = 0; i < gridWidth; i++) {
      for (int j = 0; j < gridHeight; j++) {
        switch(worldGrid[j][i]) {
        case solid:
          fill(0);
          stroke(40);
          break;
        default:
          fill(255);
          stroke(220);
          break;
        }
        rect(i*gridUnitSize, j*gridUnitSize, gridUnitSize - 1, gridUnitSize - 1);
      }
    }
  }
}



