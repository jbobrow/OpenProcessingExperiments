
/* @pgs preload="dogHouseBackground.jpg, dog1Image.png, dogHappyImage.png, dogAngryImage.png, catImage.png, dog2Image.png, dog3Image.png, boneImage.png";*/
/*Adinamis Z. Corchado
GAM 240
Made with help from Prof. Devin Scott Tunkin
*/
void rotate2D(PVector v, float theta)
{
  float m = v.mag();
  float a = v.heading2D();
  a += theta;
  v.x = m * cos(a);
  v.y = m * sin(a);
}

class LeftAndRight
{
  PImage backgroundImage;
  PImage dogHappy;
  PImage dogAngry;
  PImage dog1;
  PImage dog2;
  PImage dog3;
  PImage bone;
  PImage cat;
  
  PImage image;
  PVector position;
  PVector direction;
  PVector velocity;
  //float rotateSpeed;
  float speed;
}

LeftAndRight dogSprite;
float left = 0;
float right = 0;

void setup()
{
  // all of the variables are declared in the class and defined in the main setup
  size(700, 500);
  dogSprite = new LeftAndRight ();
  dogSprite.backgroundImage = loadImage("dogHouseBackground.jpg");
  dogSprite.image = loadImage("dog1Image.png");
  dogSprite.dogHappy = loadImage("dogHappyImage.png");
  dogSprite.dogAngry = loadImage("dogAngryImage.png");
  dogSprite.cat = loadImage("catImage.png");
  dogSprite.dog1 = loadImage("dog1Image.png");
  dogSprite.dog2 = loadImage("dog2Image.png");
  dogSprite.dog3 = loadImage("dog3Image.png");
  dogSprite.bone = loadImage("boneImage.png");
  
  
  dogSprite.position = new PVector(350, 450); //default was 0, 0 to start at origin
  dogSprite.direction = new PVector(0, 1);
  dogSprite.velocity = new PVector(1, 0);
  dogSprite.speed = 9;
  //car.rotateSpeed = .1;
}

void draw()
{
  background(100);
  pushStyle();
  imageMode(CORNER);
  image(dogSprite.backgroundImage, 0, 0, width, height);
  popStyle();

  dogSprite.direction.mult(dogSprite.direction, dogSprite.speed, dogSprite.velocity);  // mult is built into processing
  //car.direction.rotate(car.rotateSpeed * (left + right));
  //car.velocity.x = car.direction.x * (car.speed * left + right);
  //car.velocity.y = car.direction.y * (car.speed * up + down);
  //car.position.add(car.velocity);  // have to use built in add insetad of car.position += car.velocity

if (dogSprite.position.x <= width - 50)
    {
      dogSprite.position.x += right;
    }
    if (dogSprite.position.x >= 0 + 50)
    {
      dogSprite.position.x += left;
    }

    //car.rotateSpeed += 0.1; // just rotated continuously
  pushMatrix();
  translate(dogSprite.position.x, dogSprite.position.y);
  //rotate(car.rotateSpeed);  //constant rotation
  //rotate(car.direction.heading());  // heading is built in to processing
  imageMode(CENTER);  // so all rotations will happen around the center instead of the image's point of origin
  image(dogSprite.image, 0, 0); //original was 350
  popMatrix();
  
  if (keyPressed) {
      if (key == 'a')
        {
          dogSprite.image = dogSprite.dog1;
        }
        else
        if (key == 's')
        {
          dogSprite.image = dogSprite.dog2;
        }
        else
        if (key == 'd')
        {
          dogSprite.image = dogSprite.dog3;
        }
        else 
        if (key == 'f')
        {
          dogSprite.image = dogSprite.dogHappy;
          image(dogSprite.bone, 530, 440, 90, 33);
        }
        else
        if (key == 'g')
        {
          dogSprite.image = dogSprite.dogAngry;
          image(dogSprite.cat, 500, 100, 120, 130);
        }
        
  }
          
}

void keyPressed()
{
  if (keyCode == RIGHT)
  {
    right = 4;

  }


  if (keyCode == LEFT)
  {
    left = -4;
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
}



