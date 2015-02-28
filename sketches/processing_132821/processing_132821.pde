

PImage img;
PImage[] myimages = new PImage[8];

int backgroundIndex = 0;
float timer = 0;

float y = 60.0;
float speed = 2.5;
float radius = 20.0;


void setup()
{
size (400, 400);
frameRate(30);

img = loadImage ("sunnyday.JPG");

smooth();
noStroke();
ellipseMode(RADIUS);

myimages[0] = requestImage("gampicwalk1.png");
myimages[1] = requestImage("gampicwalk2.png");
myimages[2] = requestImage("gampicwalk3.png");
myimages[3] = requestImage("gampicwalk4.png");
myimages[4] = requestImage("gampicwalk5.png");
myimages[5] = requestImage("gampicwalk6.png");
myimages[6] = requestImage("gampicwalk7.png");
myimages[7] = requestImage("gampicwalk8.png");

}

void draw()
{

image(img, 0, 0, 400, 400);


fill(#FF4500);
pushMatrix();
translate(0, y);
ellipse(35, 0, radius, radius);

translate(0, y + 1);
ellipse(85, 0, radius, radius);
popMatrix();


y = y + speed;

if (y > height + radius)
{
 y = -radius; 
}

timer = timer + 5 / 30.0;

if (timer > 3)//when it starts
{
  backgroundIndex = backgroundIndex + 1;
  timer = 0;
}

if (backgroundIndex < 0 || backgroundIndex >= myimages.length)
  {
  backgroundIndex = 0;
  }

if (backgroundIndex >= myimages.length)
  {
  backgroundIndex = 0;
  }

image(myimages[backgroundIndex], 0, 0, width, height);

}

void keyReleased()
{
  if (keyCode == LEFT)
    {
    backgroundIndex = backgroundIndex - 1;
    }
  if (keyCode == RIGHT)  
    {
    backgroundIndex = backgroundIndex +1;
    }
      
}

