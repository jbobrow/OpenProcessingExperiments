
//Copyright (C) Akash Levy
//3-D Brickbreaker

/*
Make it so that collision angle causes velocity change.
Add lives.
Add score.
Add bonuses: small bat, big bat, split balls, extra life, fireball, mystery
Add levels.
Draw lives.
Move with bat.
Shadow.
Add different types of bricks.
*/

//Define objects
ball gameBall;
grid floor = new grid(0,0,0), ceiling = new grid(0,0,300);
bat gameBat;
ArrayList<collision> collisions = new ArrayList<collision>();
level[] levels = new level[3];

//Define game values
boolean lose = false;
int score, lives, loseFrame = 0, currentLevel;

//Offset for the game
final int XOFFSET = 160, YOFFSET = 500, ZOFFSET = 150;
final int XANGLE = 90, YANGLE = 0, ZANGLE = 0;
final int FRAME = 30;

void setup()
{
  size(500, 710, OPENGL);
  
  //Initialize variables
  score = 0;
  lives = 3;
  currentLevel = 0;
  gameBat = new bat();
  gameBall = new ball();
  
  //Define level 1
  levels[0] = new level();
  levels[0].ballSpeed = 2;
  levels[0].batSideLength = 80;
  levels[0].bricks[0] = new brick(0, 0, ceiling.z, 100, 100, 20, color(170,0,170), "none");
  levels[0].bricks[1] = new brick(0, 100, ceiling.z, 100, 100, 20, color(170,0,170), "none");
  levels[0].bricks[2] = new brick(100, 0, ceiling.z, 100, 100, 20, color(170,0,170), "none");
  levels[0].bricks[3] = new brick(100, 100, ceiling.z, 100, 100, 20, color(170,0,170), "none");
  levels[0].bricks[4] = new brick(0, 0, ceiling.z - 20, 100, 100, 20, color(59,252,96), "none");
  levels[0].bricks[5] = new brick(0, 100, ceiling.z - 20, 100, 100, 20, color(59,252,96), "none");
  levels[0].bricks[6] = new brick(100, 0, ceiling.z - 20, 100, 100, 20, color(59,252,96), "none");
  levels[0].bricks[7] = new brick(100, 100, ceiling.z - 20, 100, 100, 20, color(59,252,96), "none");
  
  //Define level 2
}

void draw()
{
  setupWindow();
  textSize(16);
  textAlign(CENTER);
  fill(255,0,0);
  pushMatrix();
  rotateX(radians(270));
  text("Score: " + score + "    Lives: " + lives, floor.squareSideLength*floor.squares_i/2 - 10, 115);
  popMatrix();
  fill(255,255,255);
  if (lives == 0)
  {
    textSize(35);
    textAlign(CENTER);
    fill(255,0,0);
    pushMatrix();
    rotateX(radians(270));
    text("YOU LOSE", floor.squareSideLength*floor.squares_i/2 - 10, -150);
    popMatrix();
    fill(255,255,255);
    if (frameCount >= loseFrame + 50)
      setup();
  }
  else
  {
    gameBall.update();
    gameBat.update();
    gameBat.batWidth = levels[currentLevel].batSideLength;
    gameBat.batHeight = levels[currentLevel].batSideLength;
    for (int i = 0; i < collisions.size(); i++)
    {
      collision iCollision = collisions.get(i);
      iCollision.update();
      iCollision.drawCollision();
      collisions.set(i, iCollision);
    }
    for (int i = 0; i < collisions.size(); i++)
    {
      collision iCollision = collisions.get(i);
      if (iCollision.alpha <= 0)
        collisions.remove(i);
    }
  }
  drawWallLines();
  gameBall.drawBall();
  gameBat.drawBat();
  floor.drawGrid();
  ceiling.drawGrid();
  for (int i = 0; i < levels[currentLevel].bricks.length; i++)
    levels[currentLevel].bricks[i].drawBrick();
}
//Define ball class
class ball
{
  //Properties of the ball
  float x, y, z, xSpeed, ySpeed, zSpeed, radius;
  
  //Constructor to initialize all of the variables
  ball()
  {
    x = 1;
    y = 1;
    z = 1;
    xSpeed = 1.4;
    ySpeed = 2.6;
    zSpeed = 3.1;
    radius = 8;
  }
  
  //Function to draw the ball
  void drawBall()
  {
    stroke(255,0,0);
    fill(255,0,0);
    pushMatrix();
    translate(x - radius/2, y - radius/2, z + radius);
    sphere(radius);
    popMatrix();
    stroke(0);
    fill(255,255,255);
  }
  
  //Moves the ball to its new position
  void update()
  {
    float displacement, xDisplacement, yDisplacement, zDisplacement;
    x += xSpeed;
    y += ySpeed;
    z += zSpeed;
    for (int i = 0; i < levels[currentLevel].bricks.length; i++)
    {
      brick oneBrick = levels[currentLevel].bricks[i];
      if (oneBrick.visible)
      {
        xDisplacement = x - oneBrick.x;
        yDisplacement = y - oneBrick.y;
        zDisplacement = z - oneBrick.z + oneBrick.brickThickness;
        if ((xDisplacement + radius) >= 0 && (xDisplacement - radius) <= oneBrick.brickWidth && (yDisplacement + radius) >= 0 && (yDisplacement - radius) <= oneBrick.brickHeight && (zDisplacement + radius) >= 0 && (zDisplacement - radius) <= oneBrick.brickThickness)
        {
          if ((xDisplacement - xSpeed + radius) >= 0 || (xDisplacement - xSpeed - radius) <= xSpeed + oneBrick.brickWidth)
          {
            oneBrick.visible = false;
            xSpeed *= -1;
            score += 1;
          }
          else if ((yDisplacement - ySpeed + radius) >= 0 || (yDisplacement - ySpeed - radius) <= ySpeed + oneBrick.brickHeight)
          {
            oneBrick.visible = false;
            ySpeed *= -1;
            score += 1;
          }
          else if ((zDisplacement - zSpeed + radius) >= 0 || (zDisplacement - zSpeed - radius) <= zSpeed + oneBrick.brickThickness)
          {
            oneBrick.visible = false;
            zSpeed *= -1;
            score += 1;
          }
        }
      }
    }
    displacement = x - floor.x;
    if (displacement <= 0)
    {
      xSpeed *= -1;
      x -= displacement;
      collisions.add(new collision(floor.x - radius, y*(floor.squareSideLength*floor.squares_j-2*radius)/(floor.squareSideLength*floor.squares_j), z + 1.5*radius, 0, radians(90), 0));
    }
    displacement = (x + radius) - (floor.x + floor.squareSideLength*floor.squares_i);
    if (displacement >= 0)
    {
      xSpeed *= -1;
      x -= displacement;
      collisions.add(new collision(floor.squareSideLength*floor.squares_j-radius, y*(floor.squareSideLength*floor.squares_j-2*radius)/(floor.squareSideLength*floor.squares_j), z + 1.5*radius, 0, radians(90), 0));
    }
    displacement = y - floor.y;
    if (displacement <= 0)
    {
      ySpeed *= -1;
      y -= displacement;
      collisions.add(new collision(x*(floor.squareSideLength*floor.squares_i-2*radius)/(floor.squareSideLength*floor.squares_i), y, z + 1.5*radius, radians(90), 0, 0));
    }
    displacement = (y + radius) - (floor.y + floor.squareSideLength*floor.squares_j);
    if (displacement >= 0)
    {
      ySpeed *= -1;
      y -= displacement;
      collisions.add(new collision(x*(floor.squareSideLength*floor.squares_i-2*radius)/(floor.squareSideLength*floor.squares_i), floor.y + floor.squareSideLength*floor.squares_j, z + 1.5*radius, radians(90), 0, 0));
    }
    displacement = z - floor.z;
    if (displacement <= 0)
    {
      z -= displacement;
      if (x + radius > gameBat.x && x + radius < gameBat.x + gameBat.batWidth && y + radius > gameBat.y && y + radius < gameBat.y + gameBat.batHeight)
        zSpeed *= -1;
      else
      {
        lives -= 1;
        collisions = new ArrayList<collision>();
        loseFrame = frameCount;
      }
    }
    displacement = (z + 2*radius) - ceiling.z;
    if (displacement >= 0)
    {
      zSpeed *= -1;
      z -= displacement;
      collisions.add(new collision(x - radius, y, ceiling.z - 1));
    }
  }
}
//Define bat class
class bat
{
  //Properties of the bat
  float x, y, batWidth, batHeight, thickness, mouseWindowXOffset = 100, mouseWindowYOffset = 100;
  
  //Constructor to initialize all of the variables
  bat()
  {
    x = 0;
    y = 0;
    batWidth = 50;
    batHeight = 50;
    thickness = 1.1;
  }
  
  void update()
  {
    x = (float) (mouseX - mouseWindowXOffset) / (width - 2*mouseWindowXOffset) * (floor.x + floor.squareSideLength*floor.squares_i - batWidth);
    y = (float) (mouseY + width - height - mouseWindowYOffset) / (width - 2*mouseWindowYOffset) * (floor.y + floor.squareSideLength*floor.squares_j - batHeight);
    if (x < 0)
      x = 0;
    if (y < 0)
      y = 0;
    if (x > (floor.x + floor.squareSideLength*floor.squares_i - batWidth))
      x = floor.x + floor.squareSideLength*floor.squares_i - batWidth;
    if (y > (floor.y + floor.squareSideLength*floor.squares_j - batHeight))
      y = floor.y + floor.squareSideLength*floor.squares_j - batHeight;
  }
  
  void drawBat()
  {
    fill(0, 0, 0);
    pushMatrix();
    translate(x + batWidth/2 - 10, y + batHeight/2 - 10, 0);
    box(batWidth, batHeight, thickness);
    popMatrix();
    fill(255, 255, 255);
  }
}
//Define brick class
class brick
{
  float x, y, z, brickWidth, brickHeight, brickThickness;
  color brickColor;
  String bonus;
  boolean visible;
  
  brick()
  {
    x = 0;
    y = 0;
    z = 0;
    brickWidth = 60;
    brickHeight = 60;
    brickThickness = 20;
    brickColor = color(0);
    bonus = "none";
    visible = false;
  }
  
  brick(float inputX, float inputY, float inputZ, float inputBrickWidth, float inputBrickHeight, float inputBrickThickness, color inputBrickColor, String inputBonus)
  {
    x = inputX;
    y = inputY;
    z = inputZ;
    brickWidth = inputBrickWidth;
    brickHeight = inputBrickHeight;
    brickThickness = inputBrickThickness;
    brickColor = inputBrickColor;
    bonus = inputBonus;
    visible = true;
  }
  
  void drawBrick()
  {
    if (visible)
    {
      pushMatrix();
      fill(brickColor);
      translate(x + brickWidth/2 - 10, y + brickHeight/2 - 10, z - brickThickness/2);
      box(brickWidth, brickHeight, brickThickness);
      popMatrix();
      fill(255, 255, 255, 255);
    }
  }
}
//Define collision class
class collision
{
  //Properties of the collision
  float radius, frames, x, y, z, alpha, xAngle, yAngle, zAngle;
  
  //Constructor to initialize all of the variables
  collision()
  {
    x = 0;
    y = 0;
    z = 0;
    radius = gameBall.radius;
    frames = 255;
    alpha = 255;
  }
  
  collision(float inputX, float inputY, float inputZ)
  {
    x = inputX;
    y = inputY;
    z = inputZ;
    xAngle = 0;
    yAngle = 0;
    zAngle = 0;
    radius = gameBall.radius;
    frames = 30;
    alpha = 255;
  }
  
  collision(float inputX, float inputY, float inputZ, float inputXAngle, float inputYAngle, float inputZAngle)
  {
    x = inputX;
    y = inputY;
    z = inputZ;
    xAngle = inputXAngle;
    yAngle = inputYAngle;
    zAngle = inputZAngle;
    radius = gameBall.radius;
    frames = 30;
    alpha = 255;
  }
  
  void update()
  {
    alpha -= 255/frames;
  }
  
  void drawCollision()
  {
    noStroke();
    pushMatrix();
    fill(255, 0, 0, alpha);
    translate(x, y, z);
    rotateX(xAngle);
    rotateY(yAngle);
    rotateZ(zAngle);
    ellipse(0, 0, radius, radius);
    popMatrix();
    stroke(0);
    fill(255, 255, 255, 255);
  }
}
void drawWallLines()
{
  float floorCloseX = floor.x - 10;
  float floorCloseY = floor.y - 10;
  float floorFarX = floor.x + floor.squareSideLength*floor.squares_i - 10;
  float floorFarY = floor.y + floor.squareSideLength*floor.squares_j - 10;
  float ceilingCloseX = ceiling.x - 10;
  float ceilingCloseY = ceiling.y - 10;
  float ceilingFarX = ceiling.x + ceiling.squareSideLength*ceiling.squares_i - 10;
  float ceilingFarY = ceiling.y + ceiling.squareSideLength*ceiling.squares_j - 10;
  line(floorCloseX, floorCloseY, floor.z, ceilingCloseX, ceilingCloseY, ceiling.z);
  line(floorCloseX, floorFarY, floor.z, ceilingCloseX, ceilingFarY, ceiling.z);
  line(floorFarX, floorCloseY, floor.z, ceilingFarX, ceilingCloseY, ceiling.z);
  line(floorFarY, floorFarY, floor.z, ceilingFarX, ceilingFarY, ceiling.z);
}
class grid
{
  int squares_i, squares_j;
  float x, y, z;
  float squareSideLength;
  
  grid(int inputX, int inputY, int inputZ)
  {
    squares_i = 10;
    squares_j = 10;
    squareSideLength = 20;
    x = inputX;
    y = inputY;
    z = inputZ;
  }
  
  void drawGrid()
  {
    pushMatrix();
    translate(x,y,z);
    for (int i = 0; i < squares_i; i++)
    {
      for (int j = 0; j < squares_j; j++)
      {
        pushMatrix();
        translate(squareSideLength*i, squareSideLength*j, 0);
        box(squareSideLength, squareSideLength, 1);
        popMatrix();
      }
    }
    popMatrix();
  }
}
class level
{
  float ballSpeed, batSideLength;
  brick[] bricks;
  level()
  {
    ballSpeed = 2;
    batSideLength = 50;
    bricks = new brick[30];
    for (int i = 0; i < 30; i++)
      bricks[i] = new brick();
  }
}
//Set the background and translate accordingly
void setupWindow()
{
  background(255, 255, 255);
  translate(XOFFSET, YOFFSET, ZOFFSET);
  rotateX(radians(XANGLE));
  rotateY(radians(YANGLE));
  rotateZ(radians(ZANGLE));
  frameRate(FRAME);
  PFont font = createFont("Arial", 50);
  textFont(font);
}


