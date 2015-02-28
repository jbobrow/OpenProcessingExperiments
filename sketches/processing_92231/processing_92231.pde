
/* @pjs preload="sprites_map_claudius.png"; */

class Walker
{
  PImage image;
  PVector position;
  int frameRow;
  int frameColumn;
  float frameTimer;
  PVector velocity;
  float speed;
}

Walker knight;
float left = 0;
float right = 0;
float down = 0;
float up = 0;
 
void setup()
{
  size(800, 800);
  knight = new Walker();
  knight.image = loadImage("sprites_map_claudius.png");
  knight.position = new PVector(600, 200);
  knight.velocity = new PVector(0, 0);
  knight.frameRow = 0; // which row from source image to use
  knight.frameColumn = 0; // which column from source image to use
  knight.frameTimer = 0; // determines which column to use to animate.
  knight.speed = 2; // walk speed
}

void draw()
{
  background(100);
 
  knight.velocity.x = knight.speed * (left + right);
  knight.velocity.y = knight.speed * (up + down);
  knight.position.add(knight.velocity);
  
  knight.frameTimer += 0.1; // 0.1 is the framerate or speed of animation.
  if (knight.frameTimer >= 6) // reset at 6 because there's only 0-5 columns in the spritesheet
  {
    knight.frameTimer = 1; // column 1 is the first frame of the walk animation
  }
  knight.frameColumn = (int)knight.frameTimer; // cast the timer to an int so it's an integer between 1 and 5
  
  if (knight.velocity.x == 0 && knight.velocity.y == 0)
  {
    knight.frameColumn = 0; //column 0 is the stopped frame of animation
  }
  
  if (left != 0)
  {
    knight.frameRow = 1; // column 1 is the left facing animation
  }
  if (right != 0)
  {
    knight.frameRow = 3; // column 3 is the right facing animation
  }
  if (up != 0)
  {
    knight.frameRow = 2; // etc.
  }
  if (down != 0)
  {
    knight.frameRow = 0; // etc.
  }

  pushMatrix();
  translate(knight.position.x, knight.position.y);
  imageMode(CENTER);
  
  // Here we are creating a new image using the getSubImage function defined below.
  // we pass in the knight.image and get a sub image of the sprite sheet based on 
  // the size of a frame (32x64 here) and the row and column we want.
  PImage frameImage = getSubImage(knight.image, knight.frameRow, knight.frameColumn, 32, 64);
  
  // Draw this image instead of knight.image
  image(frameImage, 0, 0);
  
  popMatrix();
}

// Our function to return a new smaller crop from the spritesheet.
PImage getSubImage(PImage image, int row, int column, int frameWidth, int frameHeight)
{
  return image.get(column * frameWidth, row * frameHeight, frameWidth, frameHeight); 
}

void keyPressed()
{
  if (keyCode == RIGHT)
  {
    right = 1;
  }
  if (keyCode == LEFT)
  {
    left = -1;
  }
  if (keyCode == UP)
  {
    up = -1;
  }
  if (keyCode == DOWN) 
  {
    down = 1;
  }
}

void keyReleased()
{
  if (keyCode == RIGHT)
  {
    right = 0;
  }
  if (keyCode == LEFT)
  {
    left = 0;
  }
  if (keyCode == UP)
  {
    up = 0;
  }
  if (keyCode == DOWN)  
  {
    down = 0;
  }
} 


