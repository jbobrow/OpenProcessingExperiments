
// global variables that change
float timer = 10;
int gameState = 0;
int clickCount = 0;

// troll image variable
PImage troll;

// variables we store for random rects
float rectX = 0;
float rectY = 0;
float rectSize = 100;
color rectColor;
float rectTimer = 0;

// constant variables we don't change
int PLAY_STATE = 0;
int GAMEOVER_STATE = 1;
int WIN_STATE = 2;

// set the number of clicks we need to win to random 0->50 each time it's run.
// use (int) to convert it to an int
int WIN_CLICK_COUNT = (int)random(50);

void setup()
{
  size(500, 500);
  
  // sets text size
  textSize(25);
  
  // loads troll image
  troll = requestImage("troll.png");
}

void draw()
{
  // black background
  background(0);
  
  // make the click count and troll image reset if we go over
  if (clickCount > WIN_CLICK_COUNT)
  {
    clickCount = 0;
  }
  
  // check if troll image loaded  
  if (troll.width > 0)
  {
    // convert clickCount to a fraction between 0 and 1 over WIN_CLICK_COUNT
    float alphaColor = ((float)clickCount / (float)WIN_CLICK_COUNT);
    
    // scale that fraction to 255 so we can use it for alpha
    alphaColor =  alphaColor * 255;
    
    // set the image alpha transparency to be alphaColor
    tint(255, alphaColor); 
    image(troll,0,0,width,height);
  }
  
  rectTimer += 0.0167;
  
  // change the rect after 1 second by changing the variables and reset the rect timer
  if (rectTimer > 1)
  {
    rectX = random(width);
    rectY = random(height);
    rectColor = color(random(255), random(255), random(255));
    rectTimer = 0;
  }
  
  // always draw a rect
  fill(rectColor);
  rect(rectX, rectY, 100, 100);
  
  // do this only when gameState == PLAY_STATE which is 0
  if (gameState == PLAY_STATE)
  {
    // count timer down
    timer -= 0.0167;
  
    // game ends after 10 seconds
    if (timer < 0)
    {
      timer = 0;
      
      // if we didn't get perfect click count we lose otherwise we win!
      if (clickCount != WIN_CLICK_COUNT)
      {
        gameState = GAMEOVER_STATE;
      }
      else
      {
        gameState = WIN_STATE;
      }
    }
    
    // draw white text with out timer variable
    fill(255);
    text("TIME: " + (int)timer, 0, 30);
  }
  
  // this is what we draw if we set the gameState to GAMEOVER_STATE
  if (gameState == GAMEOVER_STATE)
  {
    fill(255, 0, 0);
    textSize(50);
    text("GAME OVER", 0, 100);
  }
  
  // this is what we draw if we set the gameState to WIN_STATE
  if (gameState == WIN_STATE)
  {
    fill(0, 255, 0);
    textSize(50);
    text("YOU WON!!!", 0, 100);
  }

  // always show the clickCount
  textSize(25);
  text("CLICK COUNT: " + clickCount, 280, 480);
}

void mouseReleased()
{
  // Only record the clickCount during PLAY_STATE
  if (gameState == PLAY_STATE)
  {
    // Here we call the overRect function using the variables of our random rect 
    // if it == true then the mouse is inside and we increment our clickCount.
    if (overRect(rectX, rectY, rectSize, rectSize) == true)
    {
      clickCount += 1;
    }
  }
}


// overRect and overCircle functions from http://processing.org/examples/button.html

// This checks if the mouse position is inside a rect defined by x, y, width, height)
boolean overRect(float x, float y, float width, float height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

// This checks if the mouse position is inside a circle defined by x, y, diameter
boolean overCircle(float x, float y, float diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

