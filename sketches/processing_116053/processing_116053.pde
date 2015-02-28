
float timer = 5;
int clickCount = 0;
int gameState = 0;

float rectX = 0;
float rectY = 0;
float rectSize = 100;
color rectColor;
float rectTimer = 0;

int PLAY_STATE = 0;
int GAMEOVER_STATE = 1;
int WIN_STATE = 2;
int WINNING_CLICK_COUNT = 10;

void setup()
{
  size(500, 500);
}

void draw()
{
  timer -= 0.0167;
  
  if (gameState == PLAY_STATE)
  {
    background(0);
    textSize(30);
    fill(255, 0, 0);
    text("TIME: " + (int)timer, 0, 30);
    text("CLICKS: " + clickCount, 0, 400);
    
    rectTimer += 0.0167;
    
    if (rectTimer > 0.5)
    {    
      rectColor = color(random(255), random(255), random(255));
      rectX = random(width);
      rectY = random(height);
      rectTimer = 0;
    }
    
    fill(rectColor);
    rect(rectX, rectY, rectSize, rectSize);
    
    if (timer < 0)
    {
      if (clickCount < WINNING_CLICK_COUNT)
      {
        gameState = GAMEOVER_STATE;
      }
      else
      {
        gameState = WIN_STATE;
      }
    }
  }
  
  if (gameState == WIN_STATE)
  {
    background(255);
    fill(0, 255, 0);
    text("YOU WON!!!!", 0, 30);
  }
  if (gameState == GAMEOVER_STATE)
  {
    background(255, 0, 0);
    fill(0);
    text("YOU SUCK SO MUCH, ASSHOLE!!!!", 0, 30);
  }

}

void mouseReleased()
{
  if (gameState == PLAY_STATE)
  {
    if (mouseInRect(rectX, rectY, rectSize, rectSize) == true)
    {
      clickCount += 1;
    }
  }
}

boolean mouseInRect(float x, float y, float w, float h)
{
  if (mouseX > x  && mouseX < x + w && mouseY > y && mouseY < y + h)
  {
    return true;
  }
  else
  {
    return false;
  }
}


