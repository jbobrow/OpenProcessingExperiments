
/*
  Charles Carr
  Game 1: Snake
*/

// Variable for the font
PFont font;

// The size of the snake
int snakesize;

// Variables for the snake's head that increases in size over time.
int head;
int headrate;

// Holds all of the body pieces' x and y values and the head piece's x and y into 2 500 cell integer arrays.
int[] snakex = new int[500];
int[] snakey = new int[500];

// Moving rate for my snake. I started off using an array, but then I realized I don't need an array, so I only really use the first cell.
int[] xrate = new int[2];
int[] yrate = new int[2];

// x and y value of the pellet.
int circlex = 0;
int circley = 0;

// Keep track of the score of the game.
int score;

// Keep track of the phase of the game that I'm on.
int gametime;

// Variables used to animate the pellet moving through the body when you eat a pellet.
int colortime;
int colortime2;

// Some color and an alpha variable for changing the alpha value of the body over time.
color c;
int c_alpha = 255;

// Some color 
int s = 0;
int c2 = 255;
int c3 = 245;
boolean updown = true;

// Variables for the portal.
int randtime;
int randx;
int randy;
boolean isPortalOpen = false;
boolean portalClosing = false;
int portalOpen;
int portalsize;
int p1x;
int p1y;
int p2x;
int p2y;

// Variables for the obsticles.
int obs = 0;
int[] obx = new int[200];
int[] oby = new int[200];
int[] obh = new int[200];
int[] obw = new int[200];
int[] obz = new int[200];
boolean[] sob = new boolean[200];

// Variables to hold all of the x and y positions of each point of the obsticles.
int bads;
int[] badx = new int[500];
int[] bady = new int[500];

// Setup()
void setup()
{
  // Sets the window size to 500 by 500.
  size(500,500);
  
  // Makes sure we're in the right drawing mode.
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  // Set the fps to 14.
  frameRate(14);
  
  // Start off with the snake in the middle of the screen.
  snakex[0] = 250;
  snakey[0] = 250;
  
  // The xrate and yrate start at 0, meaning the snake starts off in a non-moving state.
  xrate[0] = 0;
  yrate[0] = 0;
  
  // Put the pellet in a random position on a 10x10 grid.
  circlex = (floor(random(49))+1)*10;
  circley = (floor(random(49))+1)*10;
  
  // I have no idea what this is for, but it sets all of the obz[] cells to 5. It has something to do with the idea that a new obsticle appears every 5 points.
  for (int count = 0; count < 200; count++)
  {
    obz[count] = 5;
    sob[count] = false;
  }
  
  // Load the fancy looking system-like font and sets the fontsize to 24.
  font = loadFont("CourierNewPS-BoldMT-48.vlw");
  textFont(font, 24);
  
  bads = 0;
  
  isPortalOpen = false;
  portalClosing = false;
  p1x = 0;
  p1y = 0;
  p2x = 0;
  p2y = 0;
  randtime = 0;
  snakesize = 0;
  headrate = 0;
  head = 0;
  colortime = 1;
  colortime2 = 1;
  score = 0;
  gametime = 0;
}

void draw()
{
  // If the game is in the playing phase...
  if (gametime == 0)
  {
    // Set the Background to black.
    background(0);
    // Since the variable s starts off as 0, and this draws a 10x10 point grid across the entire game, the grid appears to be drawn invisible.
    // Later on, when you get a pellet, s will shoot up to 255 (white), and slowly fall back to 0 for a cool flashy effect.
    stroke(s);
    for (int i = 0; i < 50; i++)
    {
      for (int j = 0; j < 50; j++)
      {
        line(i*10, (j*10)+5, 500, (j*10)+5);
        line((i*10)+5, j*10, (i*10)+5, 500);
      }
    }
    // Go back to no stroke.
    noStroke();
    
    // Makes s come back to 0 if it is ever higher than 0.
    if (s > 0)
    {
      s -= 2;
    }
    
    // Restate c (the snake color) and use the alpha element.
    c = color(175,175,175,c_alpha);
    // Set the stroke color to white.
    stroke(255);
    // draw lines around the edges of the screen.
    line(5,5,495,5); 
    line(5,5,5,495);
    line(495,5,495,495);
    line(5,495,495,495);
    noStroke(); // Go back to no stroke.
    fill(255); // Set the fill back to white for the text.
    text("Score: " + score,10,30); // Display the current score.
    fill(c); // Set the fill back to default.
    
    // Make c_alpha based off of snakesize. The longer the snake, the lower the alpha, meaning the more transparent the snake will be at the tail.
    // It will get to a point where you can no longer see the end of your tail. This is to add difficulty.
    c_alpha -= snakesize*10;
    
    // This loop will draw the snake begining from the tail all the way to the head.
    for (int count = snakesize; count >= 0; count--)
    {
      // Redefine our color.
      c = color(0,255,0,c_alpha);
      // As long as count is > 0, which means we're not drawing the head.
      if (count > 0)
      {
        // Change the fill color to the snake's color.
        fill(c);
        
        // When a pellet is eaten, colortime's value is set to the value of snakesize. That allows this to understand how to do the eating animation.
        if (colortime2 != colortime && colortime2 != colortime+1)
        {
          // In the first iteration of this loop, colortime2 will be one, so when you get to drawing the first body piece, this if statement will trigger.
          if (colortime2 == count)
          {
            // and that body piece will be changed to blue.
            fill(0,0,255);
            // and this will increase colortime2 by 2, so that next time we go through the draw function, the body piece that is 2 pieces behind this one will be colored blue instead.
            // Since the next frame will move all of the body pieces over by one, it'll appear as though the next body piece is being changed to blue. This is simply an effect to make
            // it appear as though the pellet is traveling all the way through the snake when he eats it.
            colortime2 += 2;
          }
        }
        else // When the animation is over, reset the colortime and colortime2 variables.
        {
          colortime = 1;
          colortime2 = 1;
        }
        
        // The currently-being-looked-at body piece's x and y value will move to the x and y position of the body piece directly next of it.
        snakex[count] = snakex[count-1];
        snakey[count] = snakey[count-1];
        
        // draw that body piece at it's newly calculated position.
        rect(snakex[count],snakey[count],10,10);
        
        // reset the fill back to c. (The only case that it wouldn't already be c is if the program just went through the colortime animation.
        fill(c);
        
        // Make the alpha go up (raise the transparency) of the next body piece.
        // Everything should work out so that the first body piece is at full opacity and gradually decreases in opacity as the tail gets longer.
        c_alpha += 10;
      }
      else // if it's finally time to draw the head.
      {
        // Make it red.
        fill(255,0,0);
        
        // Increase/ the x and y position by their cooresponding rates...
        snakex[count] += xrate[count];
        snakey[count] += yrate[count];
        
        // Draw the head in it's newly calculated position.
        rect(snakex[count]+1,snakey[count],10+head,10+head);
        
        // and of course reset fill to c.
        fill(c);
        
        // After we calculate a new position of the snake's head, let's see if it happened to have landed on part of it's body.
        for (int count2 = 1; count2 <= snakesize; ++count2)
        {
          if (snakex[count] == snakex[count2] && snakey[count] == snakey[count2])
          {
            gametime = 1; // if gametime is ever set to 1, the game is over.
          }
        }
        
        // Reset c_alpha back to 255 (full opacity).
        c_alpha = 255;
      }
    }
    
    
    // there are obsticle(s) on the field, let's look for collisions.
    if (obs > 0)
    {
      // obs holds the amount of obsticles in existence. 
      for (int count = 0; count < obs; count++)
      {
        // sob holds whether the obsticle is forming.
        if (sob[count] == true)
        {
          // obz allows the obsticle to fade into the screen.
          obz[count] += 10;
          if (obz[count] == 255)
          {
            // as soon as it reaches full opacity, or in this case it's full color, set sob to false
            sob[count] = false;
          }
        }
        
        // Make a rectangle without any fill color at the position of the obsticle.
        noFill();
        stroke(obz[count]);
        rect(obx[count],oby[count],obw[count],obh[count]);
        fill(c);
        noStroke();
      }
      
      // bads is the variable that holds the amount of coordinates that are "bad", or in another sense: these coordinates will kill the snake if he lands on them.
      for (int count = 0; count < bads; count++)
      {
        // This checks to see if the snake has run into any of these bad coordinates.
        if (snakex[0] == badx[count] && snakey[0] == bady[count])
        {
          gametime = 1; // if so, game over.
        }
      }
    }
    
    // If the snake goes off the grid, game over.
    if (snakex[0] >= 500 || snakex[0] <= 0 || snakey[0] >= 500 || snakey[0] <= 0)
    {
      gametime = 1;
    }
    
    // If the snake head collidees with the pellet.
    if (snakex[0] == circlex && snakey[0] == circley)
    {
      // Increase the size of the snake, which will in turn increase the amount of iterations of the snake drawing loop, making the snake longer.
      snakesize++;
      
      // Increase the score by one.
      score++;
      
      // Set colortime to snakesize. 
      colortime = snakesize;
      
      // Move the pellet to a new position on the 10x10 grid.
      circlex = (floor(random(49))+1)*10;
      circley = (floor(random(49))+1)*10;
      
      // This loop will happen for however many bad coordinates there are.
      for (int count = 0; count < bads; count++)
      {
        // If the pellet lands on a bad point, then move it to another position.
        if (circlex == badx[count] && circley == bady[count])
        {
          circlex = (floor(random(49))+1)*10;
          circley = (floor(random(49))+1)*10;
          // and reset count so that it can recheck and make sure that it will NEVER land on a bad coordinate. Without this, the game would be kind of unfair.
          count = 0;
        }
      }
      
      // set s to 40, which is the variable that says what color the grid is when you pick up a point. It will gradually decrease back to black.
      s = 40;
      
      // This whole little block makes the head get larger over time.
      headrate++;
      if (headrate == 4)
      {
        head += 2;
        headrate = 0;
      }
      
      // Lowers c3 by 10.
      c3 -= 10;
      
      // This loop will calculate the position of a new obsticle if you hit the right score.
      for (int count = 1; count < obs+2; count++)
      {
        // Every 5 points will bring a new obsticle.
        if (snakesize == count*5 && obs == count-1)
        {
          // Give it a random x and y position, and a random height and width.
          obx[obs] = ((floor(random(40))+1)*10)+50;
          oby[obs] = ((floor(random(40))+1)*10)+50;
          obh[obs] = ((floor(random(3)+1))*10)*2;
          obw[obs] = ((floor(random(3)+2))*10)*2;
          
          // Since we are instantiating a new obsticle, set sob (the variable that says it should start forming) to true.
          sob[obs] = true;
          
          // This function adds those coordinates to the list of bad coordinates so that the snake will die if he hits the obsticles.
          add_bads(obx[obs],oby[obs],obh[obs],obw[obs]);
          
          // Increase the amount of obsticles by 1.
          obs++;
        }
      }
    }
    
    // If the portal isn't open...
    if (isPortalOpen == false)
    {
      // Pick a random number between 0 and 499.
      randtime = floor(random(500));
      
      // If that number is between 496 and 499 (3 out of 500 chance)
      if (randtime > 495)
      {
        // Then open the portal.
        isPortalOpen = true;
      }
      
      // If the portal is supposed to be closing, this will use the draw_portal() function to fade it in and out.
      if (portalClosing == true)
      {
        draw_portal(p1x,p1y,100);
        draw_portal(p2x,p2y,100);
      }
    }
    else // If the portal is open.
    {  
      // if it was JUST opened.
      if (portalOpen == 0)
      {
        // Put the portals in a random x and y position.
        randx = ((floor(random(40))+1)*10)+50;
        randy = ((floor(random(40))+1)*10)+50;
        p1x = randx;
        p1y = randy;
        randx = ((floor(random(40))+1)*10)+50;
        randy = ((floor(random(40))+1)*10)+50;
        p2x = randx;
        p2y = randy;
        
        // This makes sure this if statement will only happen as soon as the portal is open.
        portalOpen = 1;
        
        // This loop will make sure that the portals don't land on a bad coordinates's spot.
        for (int count = 0; count < bads; count++)
        {
          if (p1x == badx[count] && p1y == bady[count])
          {
            portalOpen = 0;
            isPortalOpen = false;
            break;
          }
          if (p2x == badx[count] && p2y == bady[count])
          {
            portalOpen = 0;
            isPortalOpen = false;
            break;
          }
        }
      }
      
      // Allow the snake to travel through the portals.
      if (snakex[0] == p1x && snakey[0] == p1y)
      {
        snakex[0] = p2x;
        snakey[0] = p2y;
      }
      else if (snakex[0] == p2x && snakey[0] == p2y)
      {
        snakex[0] = p1x;
        snakey[0] = p1y;
      }
      
      // Draw the portals.
      draw_portal(p1x,p1y,100);
      draw_portal(p2x,p2y,100);
      
      // This will cause the portal to close at a random time.
      randtime = floor(random(500));
      if (randtime > 495)
      {
        isPortalOpen = false;
        portalOpen = 0;
        portalClosing = true;
      }
    }
    
    // Makes the pellet dim in and out. The pellet will dim down farther and farther based off of your score.
    // The higher your score, the darker it will dim, and eventually, the longer it will stay dim until it lights back up.
    fill(0,0,c2);
    if (updown == true)
    {
      c2 -= 10;
      if (c2 < c3)
      {
        updown = false;
      }
    }
    else
    {
      c2 += 10;
      if (c2 > 255)
      {
        updown = true;
      }
    }
    
    // Draws the pellet.
    ellipse(circlex,circley,10,10);
    
    // Just keep fill at c.
    fill(c);
  }
  else // If game is over.
  {
    // Background to black.
    background(0);
    // Display the score.
    text("Your final score is: " + score, 95,250);
  }
}


// This is the function that draws the portal.
void draw_portal(int x, int y, int shade)
{
  for (int count = portalsize; count > 0; count--)
  {
    fill(0+shade,0,0);
    ellipse(x, y, count, count);
    shade -= 4;
    if (shade < 0)
    {
      shade = 0;
    }
  }
  if (portalClosing == false)
  {
    portalsize++;
    if (portalsize > 40)
    {
      portalsize = 40;
    }
  }
  else
  {
    portalsize--;
    if (portalsize < 0)
    {
      portalsize = 0;
      portalClosing = false;
    }
  }
  fill(c);
}

// This function calculates the coordinates that are considered "bad."
void add_bads(int x, int y, int h, int w)
{
  x = x - (w/2);
  y = y - (h/2);
  for (int count1 = 0; count1 <= (h/10); count1++)
  {
    for (int count2 = 0; count2 <= (w/10); count2++)
    {
      badx[bads] = x+(count2*10);
      bady[bads] = y+(count1*10);
      bads++;
      if (bads == 500)
      {
        bads = 499;
      }
    }
  }
}

// The movement controls. This is obvious.
void keyPressed()
{
  // You can use the Arrow keys or the WASD keys to control the snake. It is entirely out of preference.
  if (keyCode == UP || key == 'w')
  {
    xrate[0] = 0;
    yrate[0] = -10;
  }
  if (keyCode == DOWN || key == 's')
  {
    xrate[0] = 0;
    yrate[0] = 10;
  }
  if (keyCode == LEFT || key == 'a')
  {
    xrate[0] = -10;
    yrate[0] = 0;
  }
  if (keyCode == RIGHT || key == 'd')
  {
    xrate[0] = 10;
    yrate[0] = 0;
  }
  if (keyCode == ENTER)
  {
      setup();
      gametime = 0;
  }
}

