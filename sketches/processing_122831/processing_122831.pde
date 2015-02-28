
PImage img;
PImage img2;
PImage img3;

float xPos;
float yPos;
float lightWidth = 20;
float speedMod;
boolean lightBig = true;
float lightOffset = 0;

boolean moveUp;
boolean moveDown;
boolean moveRight;
boolean moveLeft;

int quantity = 800;
float [] xPosition = new float[quantity];
float [] yPosition = new float[quantity];
int [] flakeSize = new int[quantity];
int [] direction = new int [quantity];

void setup() {
  // Images must be in the "data" directory to load correctly
  
  size(800, 350);
  frameRate(30);
  noStroke();
//  smooth();
  rectMode(CENTER);
  fill(255,255,122, 128);
  
  for(int i = 0; i < quantity; i++) {
    flakeSize[i] = round(random(1, 2));
    xPosition[i] = random(0, width);
    yPosition[i] = random(0, height) - height;
    direction[i] = round(random(0, 1));
  }
  
  img = loadImage("1.png");
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  size(728,328);
  
  xPos = width/2;
  yPos = height/2 + 20;
}

void draw() {
  
  if(yPos > height/2)
  {
    speedMod = yPos/100;
  }
  if(yPos < height/2)
  {
//    speedMod = (yPos -(height/2))/100;
  }
  
  if(lightBig)
  {
    lightOffset += speedMod * 2;
  }
  else
  {
    lightOffset -= speedMod * 2;
  }
  if(lightOffset > 100)
  {
    lightBig = false;
  }
  if(lightOffset < 0)
  {
    lightBig = true;
  }
  
  
//  quantity = 600 + round((xPos - width/2));
  
  for(int i=0;i<quantity;i++)
  {
//    direction[i] += xPos;
  }
  
  if(moveUp && yPos > 0)
  {
    yPos -= 20;
  }
  if(moveDown && yPos < height)
  {
    yPos += 20;
  }
  if(moveRight && xPos < width)
  {
    xPos += 40;
  }
  if(moveLeft && xPos > 0)
  {
    xPos -= 40;
  }

  image(img, 0, 0, width, height);
  if(lightBig)
  {
    fill(255,255,122, 80);
    rect(70 + lightOffset/2 - 25,136, 54,10);
  }
  for(int i = 0; i < quantity - 200; i++) {
    
    image(img3, xPosition[i], yPosition[i]);
      xPosition[i] += (xPos-width/2)/50;
    
    yPosition[i] += flakeSize[i] + direction[i] + (yPos - (height/2))/20; ; 
    
    if(xPosition[i] > width + flakeSize[i] || xPosition[i] < -flakeSize[i])
    {
      if(xPosition[i] < width/2)
      {
        xPosition[i] = xPosition[i]+(width);
      }
      else{
        xPosition[i] = xPosition[i]-(width);
      }
    }
    if(yPosition[i] > height + flakeSize[i])
    {
      yPosition[i] = -flakeSize[i];
    }
  }
  image(img2, 0, 0);
  if(!lightBig)
  {
    fill(255,255,122, 160);
    rect(70 + lightOffset/2 - 25,136, 54,10);
  }
  for(int i = quantity - 200; i < quantity; i++) {
    
    image(img3, xPosition[i], yPosition[i]);
      xPosition[i] += (xPos-width/2)/50;
    
    yPosition[i] += flakeSize[i] + direction[i] + (yPos - (height/2))/20; 
    
    if(xPosition[i] > width + flakeSize[i] || xPosition[i] < -flakeSize[i])
    {
      if(xPosition[i] < width/2)
      {
        xPosition[i] = xPosition[i]+(width);
      }
      else{
        xPosition[i] = xPosition[i]-(width);
      }
    }
    if(yPosition[i] > height)
    {
      yPosition[i] = yPosition[i] - height;
    }
    if(yPosition[i] < 0)
    {
      yPosition[i] = yPosition[i] + height;
    }
  }

}

void keyPressed()
{
  if(key == 'w')
  {
    moveUp = true;
  }
  if(key == 's')
  {
    moveDown = true;
  }
  if(key == 'd')
  {
    moveRight = true;
  }
  if(key == 'a')
  {
    moveLeft = true;
  }
}
void keyReleased()
{
  if(key == 'w')
  {
    moveUp = false;
  }
  if(key == 's')
  {
    moveDown = false;
  }
  if(key == 'd')
  {
    moveRight = false;
  }
  if(key == 'a')
  {
    moveLeft = false;
  }
}


