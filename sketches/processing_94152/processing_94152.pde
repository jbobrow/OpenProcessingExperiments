
/* @pjs preload="fro.png, death.png, death2.png, death3.png"; */
 float[] x = {-100,850, 0, 850,740};
float[] y = {-100,850, 850, 0, 700};
float speed = .04;
int directionX = 2;
float targetX;
float targetY;
float[] easing = {.005, .008, .01, .018, .019};
//float easingb = .01;
PVector[] vels =
{
new PVector(70, -70),
new PVector(-1.65, .42)
     };
PImage death;  
PImage death2;  
PImage death3;  
float timer = 0;  
float timerB; // for the reset ghost
int score = 0;


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
  death = loadImage("death.png");
  death2 = loadImage("death2.png");
  death3 = loadImage("death3.png");
  knight = new Walker();
  knight.image = loadImage("fro.png");
  knight.position = new PVector(400,400);
  knight.velocity = new PVector(0, 0);
  knight.frameRow = 0; // which row from source image to use
  knight.frameColumn = 0; // which column from source image to use
  knight.frameTimer = 0; // determines which column to use to animate.
  knight.speed = 2; // walk speed
}
 
void draw()
{
  
  background(255,0,0);
  
   timer += 0.016;

  
//  if (timer > 5 && timer < 50) // First wave. There will be 3 waves w/ different monsters =P
 // {
  if (dist(x[0], y[0], knight.position.x, knight.position.y) < 60)
  {
  fill(255);
  rect(300,300,200,100);
  fill(0);
  text("SCORE: " + score, 368, 360);
  text(" GAME OVER MAN", 350, 330); 
  }
  if (dist(x[1], y[1], knight.position.x, knight.position.y) < 60)
  {
  fill(255);
  rect(300,300,200,100);
  fill(0);
  text("SCORE: " + score, 368, 360);
  text(" GAME OVER MAN", 350, 330);
  }
  
  if (dist(x[2], y[2], knight.position.x, knight.position.y) < 80)
  {
  fill(255);
  rect(300,300,200,100);
  fill(0);
  text("SCORE: " + score, 368, 360);
  text(" GAME OVER MAN", 350, 330);
  }
     if (dist(x[3], y[3], knight.position.x, knight.position.y) < 80)
  {
  fill(255);
  rect(300,300,200,100);
  fill(0);
  text("SCORE: " + score, 368, 360);
  text(" GAME OVER MAN", 350, 330);
  }
       if (dist(x[4], y[4], knight.position.x, knight.position.y) < 95)
  {
  fill(255);
  rect(300,300,200,100);
  fill(0);
  text("SCORE: " + score, 368, 360);
  text(" GAME OVER MAN", 350, 330);
  }
    
    
 else {
    
  
   timer += 0.016;
   if (timer > 0) {
   fill(255);

  rect(300,0,200, 50);
  fill(0);
  text("Score: " + score, 375, 30);
     }
  if (timer > 0 && timer < 5)
  {
    fill(0);
    ellipse(400,400, 100,100);
    fill(255,0,0);
   text ("SURVIVE!!!", 370,390, 400,400);
    }
    
    if (timer > 200) 
    {
     fill(0);
    ellipse(400,400, 100,100);
    fill(255,0,0);
   text ("YOU WIN!!!", 370,390, 400,400); 
    }
  if (timer > 5 && timer < 200 ) // First wave. There will be 3 waves w/ different monsters =P
 {
  timer += 0.016;
  
 if( timer > 5) 
 {
  score++;

 }
   
   
   
 {
   targetX = knight.position.x;
  float dx = targetX - x[0];
  if (abs(dx) > 1){
    x[0] += dx * easing[0];
                  }
  targetY = knight.position.y;
  float dy =targetY - y[0];
  if (abs(dy) > 1){
    y[0] += dy * easing[0];}
}

  
  

     
   timer += 0.016;

if (timer > 5) {
   targetX = knight.position.x;
  float dx = targetX - x[1];
  if (abs(dx) > 1){
    x[1] += dx * easing[1];
                  }
  targetY = knight.position.y;
  float dy =targetY - y[1];
  if (abs(dy) > 1){
    y[1] += dy * easing[1];}

}
  
   timerB += 0.016;

if (timerB > 20) {
   targetX = knight.position.x;
  float dx = targetX - x[2];
  if (abs(dx) > 1){
    x[2] += dx * easing[2];
    }
  targetY = knight.position.y;
  float dy =targetY - y[2];
  if (abs(dy) > 1){
    y[2] += dy * easing[2];}
}   
  
    

   timerB += 0.016;

if (timerB > 20) {
  targetX = knight.position.x;
  float dx = targetX - x[3];
  if (abs(dx) > 1){
  x[3] += dx * easing[1];
    }
 targetY = knight.position.y;
  float dy =targetY - y[3];
  if (abs(dy) > 1){
    y[3] += dy * easing[3];}
}  
    timer += 0.016;  
    if (timer > 80) {
   targetX = knight.position.x;
  float dx = targetX - x[4];
  if (abs(dx) > 1){
    x[4] += dx * easing[4];
                  }
  targetY = knight.position.y;
  float dy =targetY - y[4];
  if (abs(dy) > 1){
    y[4] += dy * easing[1];}

}
    
    
    
 
  image(death, x[0], y[0], 50, 80);
  image(death, x[1], y[1], 50, 80);
  image(death3, x[2], y[2], 50, 100);
  image(death3, x[3], y[3], 50, 100);
  image(death2, x[4], y[4], 200, 210);



   
  knight.velocity.x = knight.speed * (left + right);
  knight.velocity.y = knight.speed * (up + down);
  knight.position.add(knight.velocity);
   
  knight.frameTimer += 0.08; // 0.1 is the framerate or speed of animation.
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
    knight.frameRow = 2; // column 3 is the right facing animation
  }
  if (up != 0)
  {
    knight.frameRow = 3; // etc.
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
  PImage frameImage = getSubImage(knight.image, knight.frameRow, knight.frameColumn, 64, 128);
   
  // Draw this image instead of knight.image
  image(frameImage, 0, 0);
   
  popMatrix();
  
  

}

  }

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


