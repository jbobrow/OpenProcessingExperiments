
/* @pjs preload="andy.jpg"; */
ArrayList<Circle> circles;
float counter = 0;
float maxTime;
float growSpeed = 12;
PImage andyImage;

void setup()
{
  colorMode(HSB);
  size(450, 720);
  smooth();
  frameRate(30);
  
  andyImage = loadImage("andy.jpg");
  maxTime = growSpeed * .3;

  circles = new ArrayList<Circle>();
  makeCircle();

  background(255);
}

void draw()
{
  for (int i = 0; i < circles.size(); i++)
  {
    Circle currentCircle = circles.get(i);
    currentCircle.update();
    if (currentCircle.size > width * 1.2)
      circles.remove(i);
    }

    counter++;
  if (counter > maxTime)
  {
    makeCircle();
    counter = 0;
  }
}

void makeCircle()
{
  circles.add(new Circle(andyImage, growSpeed));
}

class Circle
{
 public float size;
 private float _growSpeed;
 private float _hue;
 private PImage _img;
 
 
 Circle(PImage img, float growSpeed)
 {
   _growSpeed = growSpeed;
   size = 2;
   _hue = random(255);
   _img = img;
 }
 
 void update()
 { 
    imageMode(CENTER);
    rectMode(CENTER);
    image(_img, width * .5, height * .5, size, size);
    size += _growSpeed;   
 }
}




