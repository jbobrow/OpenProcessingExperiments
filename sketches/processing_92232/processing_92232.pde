
/* @pjs preload="car.png"; */

// Here we define what types our class type "TopDownRotater" will contain
class TopDownRotater
{
  PImage image;
  PVector position;
  PVector direction;
  PVector velocity;
  float rotateSpeed;
  float speed;
}

// Here we actually create the variable "car" of type TopDownRotater which we will access by name in the rest of the code.
TopDownRotater car;

// We use these variables both to keep track of whether a key is pressed down
// and also to store the related direction of the keys (right 1 over in x, left -1 in x, etc,)
float left = 0;
float right = 0;
float down = 0;
float up = 0;

class Bullet
{
  PImage image;
  PVector position;
  PVector direction;
  PVector velocity;
  float speed;
  boolean dead;
}

Bullet bullet;
 
void setup()
{
  size(800, 800);
  
  // Our car has not been initialized so we do it in setup
  // First make sure to call "new" and then the name of the class with () to allocate it so
  // it can be used.
  car = new TopDownRotater();
  
  // Load the image from the hard drive.
  car.image = loadImage("car.png");
  
  // Set the spawn position. We are using PVectors which are their own type that 
  // has .x and .y floats stored inside.
  car.position = new PVector(200, 200);
  
  // Set the initial direction to be down. Directions should always be of 1 length. 
  // Here it is 1 length because we are just pointing down 1 in the y.
  car.direction = new PVector(0, 1);
  
  // Velocity is another PVector and will be used to store the direction multiplied by the speed.
  // Adding this to the position each fram will move the car.
  car.velocity = new PVector(0, 0);
  
  // Speed of forward and back movement (how many pixels to move each frame)
  car.speed = 3;
  
  // Turning speed (how much angle to rotate each frame)
  car.rotateSpeed = .1;
  
  bullet = new Bullet();
  bullet.dead = true;
}

void draw()
{
  // Clear the screen
  background(100);
  
  // We have defined rotate2D below, it is the equivalent of PVectors rotate() method
  // we used before, but that method does not work in javascript so use this instead.
  // What happens is we are rotating our current direction by the rotateSpeed (angle)
  // in order to know how much to turn the car when we draw it later. 
  // We are multiplying it by (left + right) in order to determine whether to rotate
  // left or right (positive or negative direction) based on what keys are pressed down.
  rotate2D(car.direction, car.rotateSpeed * (left + right));
  //car.direction.rotate(car.rotateSpeed * (left + right)); // old version for comparison, don't use this.
  
  // Here we store the actual amount of forward movement we need to change position.
  // We get that by multiplying our direction by our speed which tells us to move
  // speed pixels in that direction. Again we are multiplying it by (up + down) in
  // order to know whether to apply this forward or back depending on what keys are held down
  // and move 0 if both are held down.
  car.velocity.x = car.direction.x * (car.speed * (up + down));
  car.velocity.y = car.direction.y * (car.speed * (up + down));
  
  // Here we add the velocity to the position in order to actually displace the position
  // and simulate moving the car on screen when we draw it.
  car.position.add(car.velocity);

  pushMatrix(); // Time to transform the original image
  
  // We call translate first always so it gets applied last!
  // We're using translate instead of manually setting the position in
  // image() so the rotation works correctly.
  translate(car.position.x, car.position.y);
  
  // Always call rotate after translation but before scale to get expected results.
  // car.direction.heading2D() gets the angle that the direction represents
  // compared to the original image direction, so we know how much to rotate
  // to match that direction. Use heading2D() instead of heading() because it works
  // in both js and java.
  rotate(car.direction.heading2D());
  
  // Set imageMode to CENTER so we rotate around the center instead corner of image.
  imageMode(CENTER);
  
  // Draw the car.image. Making sure to be at 0, 0 so translate and rotate apply correctly.
  image(car.image, 0, 0);
  
  popMatrix(); // clear the transformations so they don't apply to whatever we draw next.
  
  if (bullet.dead == false)
  {
    fill(255, 0, 0);
    bullet.position.add(bullet.velocity);
    ellipse(bullet.position.x, bullet.position.y, 40, 40);
  }
}

// Rotate a vector in 2D, we use this function up above.
void rotate2D(PVector v, float theta) 
{
  float m = v.mag();
  float a = v.heading2D();
  a += theta;
  v.x = m * cos(a);
  v.y = m * sin(a);
}

void keyPressed()
{
    // We set our right, left, up, down variables instead of setting
    // car.position or car.velocity directly here. This allows us to have smooth
    // movement. Otherwise holding down a key only gets caled every second or so
    // and creates jerky movement because of Windows 7/Mac key repeat.
    // To get smooth movement you need to keep track of the states yourself.
    // We use 1 and -1 to also store direction of the keys and cancel each other out.
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
      up = 1;
    }
    if (keyCode == DOWN) 
    {
      down = -1;
    }
}

void keyReleased()
{
    // Reset our key states to 0 when released.
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
    if (key  == ' ')  
    {
      bullet = new Bullet();
      bullet.speed = car.speed + 2;
      bullet.direction = new PVector(car.direction.x, car.direction.y);
      bullet.position = new PVector(car.position.x, car.position.y);
      bullet.velocity = new PVector(bullet.direction.x * bullet.speed, bullet.direction.y * bullet.speed);
      bullet.dead = false;
    }
} 
