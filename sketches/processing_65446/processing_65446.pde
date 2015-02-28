

int WIDTH = 800;
int HEIGHT = 600;

PImage img;
int j = 0;
float c;
float range;
float falloff = 50;//Basically, it determines how large the cloud of dust becomes
float theta;//Determines the direction of the next dust particle
float lowerAngle = 0;//Minimum angle
float upperAngle = 360;//Maximum angle
float r;
int x;
int y;
boolean createPoint = false;
boolean permanent = false;//Change this to true to make the dust stay

void setup()
{
  size(WIDTH, HEIGHT, P2D);
  img = createImage(WIDTH, HEIGHT, RGB);
  background(img);
  frameRate(300);
  noSmooth();
  fill(150);
}

void draw()
{
  loadPixels();
  for(int j = 0; j < HEIGHT; j++)
  {
    for(int i = 0; i < WIDTH; i++)
    {
      c = brightness(img.pixels[i + j * WIDTH]);
      if(c != 0)
      {
        //If the pixels is almost black, make it black
        //Drastically increases framerate
        if(c < 10)
        {
          img.pixels[i + j * WIDTH] = color(0);
        }else{
          range = (c / 255) * falloff;//Maximum range is determined by the color brightness and falloff
          r = random(1, range);//Radius for the next dust particle
          theta = random(lowerAngle, upperAngle);//Choose an angle
          c *= r / range;//The new dust color will be dimmer
          x = (int) (r * cos(radians(theta))) + i;//New x position
          y = (int) (r * sin(radians(theta))) + j;//New y position
          x = constrain(x, 0, WIDTH - 1);//Make sure to stay in the image
          y = constrain(y, 0, HEIGHT - 1);//Same here
          
          //If the dust is permanent, it can't be created on a pixel
          //that isn't already black.
          if(permanent)
          {
            if(img.pixels[x + y * WIDTH] == 0)
              img.pixels[x + y * WIDTH] = color(c);
          }else{
            img.pixels[x + y * WIDTH] = color(c);
          }
        }
      }
    }
  }
  updatePixels();
  
  background(img);
  
  drawGUI();
}

//Draws the sliders
//Note, I do not recommend creating a gui this way.
void drawGUI()
{
  fill(100);
  rect(10, 10, 100, 10);
  fill(150);
  rect(10, 10, falloff, 10);
  
  fill(100);
  rect(10, 30, 360, 10);
  fill(150);
  rect(10, 30, lowerAngle, 10);
  
  fill(100);
  rect(10, 50, 360, 10);
  fill(150);
  rect(10, 50, upperAngle, 10);
}

//Determines if the user is trying to use the gui sliders.
//This is why I don't recommend creating the gui this way.
void mouseDragged()
{
  if(mouseX >= 10 && mouseX <= 110 && mouseY >= 10 && mouseY <= 20)
  {
    falloff = mouseX - 10;
    createPoint = false;
  }else if(mouseX >= 10 && mouseX <= 370 && mouseY >= 30 && mouseY <= 40)
  {
    lowerAngle = mouseX - 10;
    createPoint = false;
  }else if(mouseX >= 10 && mouseX <= 370 && mouseY >= 50 && mouseY <= 60)
  {
    upperAngle = mouseX - 10;
    createPoint = false;
  }
}

void mousePressed()
{
  createPoint = true;//Creates a white pixels below the mouse
}

void mouseReleased()
{
  if(createPoint)
  {
    loadPixels();
    img.pixels[mouseX + mouseY * WIDTH] = color(255);
    updatePixels();
    createPoint = false;
  }
}

