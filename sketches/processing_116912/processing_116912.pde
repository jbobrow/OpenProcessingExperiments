


float timer = 10;
int gameState = 0;
int clickCount = 0;


PImage cigar;
PImage wb;
PImage nosmoke;
PImage forest;
PImage flood;
PImage house;


float imageTimer = 0;
float randX = 0;
float randY = 0;
float imgSize = 150;

int playState = 0;
int gameOverState = 1;
int winState = 2;

int winClickCount = (int)random(20);


void setup()
{
  
  size(500, 500);
  
  textSize(25);
  
  
  cigar = requestImage("cigar.png");
  wb = requestImage("wb.png");
  nosmoke = requestImage("nosmoke.jpg");
  forest = requestImage("forest.jpg");
  flood = requestImage("flood.jpg");
  house = requestImage("house.jpg");
  
}




void draw()
{
  
    imageMode(CORNER);
  if(forest.width>0)
  {
image(forest,0,0,500,500);
  }

  
  if (clickCount > winClickCount)
  {
    clickCount = 0;
  }
  
  if (nosmoke.width > 0)
  {
    float alphaColor = ((float)clickCount / (float)winClickCount);
    
    alphaColor = alphaColor * 255;
    
    tint(255, alphaColor);
    image(nosmoke, 0, 0, width, height);
  }
  
  imageTimer += 0.0167;
  
  if (imageTimer > 1)
  {
    randX = random(20, 380);
    randY = random(20, 380);
    imageTimer = 0;
  }
  
  noTint();
  image(cigar, randX, randY, 150, 150); 
  
  
  if (gameState == playState)
  {
    
    timer -= 0.0167;
    
    if (timer < 0)
    {
      
      timer = 0;
      
      if (clickCount != winClickCount)
      {
        gameState = gameOverState;
      }
      else 
      {
        gameState = winState; 
      }
    }
  
  fill(#E0F500);
  text("TIME: " + (int)timer, 0, 40);
  }
  
  if (gameState == gameOverState)
  {
    fill(255, 0, 0);
    textSize(50);
    image(house, 0, 0, width, height);
    text("GAME OVER", 0, 100);
    
  }
  
  if (gameState == winState)
  {
    fill(0, 255, 0);
    textSize(50);
    image(flood, 0, 0, width, height);
    text("YOU WON!", 0, 100);
    
  }
  
  textSize(25);
  text("CLICK COUNT: " + clickCount, 0, 60);
  
  image(wb, mouseX, mouseY, 50, 50);
}


void mouseReleased()
{
  if (gameState == playState)
  {
    if (overRect(randX, randY, imgSize, imgSize) == true)
    {
      clickCount += 1;
    }
  }
}


boolean overRect(float x, float y, float width, float height)
{
  if (mouseX >= x && mouseY <= x+width && mouseY >= y && mouseY <= y+height)
  {
    return true;
  }
  else
  {
    return false;
  }
}


boolean overCircle(float x, float y, float diameter)
{
  float disX = x - mouseX;
  float disY = y - mouseY;
  
  if (sqrt(sq(disX) + sq(disY)) < diameter/2)
  {
    return true;
  }
  else
  {
    return false;
  }
}


