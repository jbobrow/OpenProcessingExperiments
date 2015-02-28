
/* Allie Cashel - May 11, 2010
 Final CSMC 117 Project
 Based on the Bored.com Game: Boomshine
 Thank you to Keith O'Hara for help with the code.
 My current high score is 109... Can you beat it?
 */

float max_acc = 1.0;
float max_vel = 1.6;
int max_bubbles = 50;
int numBubbles = 0;

boolean growing;

Bubble my_bubbles[] = new Bubble[max_bubbles];

class Bubble
{
  int diameter;
  boolean growing = false;
  float x, y;
  float dx, dy;

  Bubble (float init_x, float init_y, int init_diameter)
  {
    x = init_x;
    y = init_y;
    diameter = init_diameter;
    growing = false;
    float dx = random(-max_vel,max_vel);
    float dy = random(-max_vel,max_vel);
  }

  void move()
  {
    //Tells Bubbles how big they should grow.
    if (growing && diameter <= 75)
    {
      diameter = diameter + 1;
    }

    // Move the Bubbles
    fill(random(0,255),random(0,255),random(0,255),150);
    x += dx;
    y += dy; 


    // Keep the Bubble in the Window

    if(x > width) 
    {
      x = width; 
      dx = 0;
    }
    if(x < 0)
    {
      x = 0; 
      dx = 0;
    }
    if(y > height)
    {
      y = height; 
      dy = 0;
    }
    if(y < 0) 
    {
      y = 0; 
      dy = 0;
    }

  }
  
  // Momentum of Bubbles
  void momentum()
  {
    dx += random(-max_acc, max_acc);
    dy += random(-max_acc, max_acc);

  }

  // Draw the Bubbles
  void display()
  {
    noStroke();
    ellipse(x, y, diameter, diameter);
  }

  //Tells the Bubbles to shrink once they reach the biggest possible diameter
  void die()
  {
    if(diameter == 75)
    {
      growing = false;
      diameter = diameter - 75;

    }
  }

}

void setup()
{
  size(500, 500);
  smooth();
  PFont textFont;

  for(int i = 0; i < my_bubbles.length; i++)
  {
    my_bubbles[i] = new Bubble(random(width), random(height), 25);
  }
}

void draw()
{
  background(0);
  noStroke();

  //Opening Slide

    PFont font;
  font = loadFont("Monospaced-48.vlw");
  textFont(font);
  textSize(15);
  fill(255);
  textAlign(CENTER, CENTER);
  text("Press 'S' To Start", width/2, height/2+45);
  text("Object: Pop as Many Bubbles as Possible in 15 seconds!", width/2, height/2-45);
  textSize(14);
  text("Click Anywhere on the Screen to Start Popping Bubbles.", width/2, height/2-15);
  text("Click Multiple Times to Maximize Number of Popped Bubbles", width/2, height/2+ 15);


  // ACTUAL GAME
  if (key == 's')
  {

    background(0);

    // Start Chain Reaction
    if(mousePressed)
    {
      my_bubbles[0] = new Bubble(mouseX, mouseY, 75);
      my_bubbles[0].growing = true;
    }
    //Check for collision of bubbles

    for(int i = 0; i < my_bubbles.length; i++)
    {
      for(int j = 0; j <my_bubbles.length; j++)
      {
        {
          float distance = sqrt(sq(my_bubbles[i].x-my_bubbles[j].x) + sq(my_bubbles[i].y - my_bubbles[j].y));
          float minDist = my_bubbles[i].diameter/2 + my_bubbles[j].diameter/2;

          if(distance < minDist)
          {
            if(my_bubbles[i].growing == true)
            {
              if(my_bubbles[j].growing == false)
              {
                my_bubbles[j].growing = true;

                //Starts keeping score
                numBubbles = numBubbles + 1;
              }
            }
          }
        }
      }

      my_bubbles[i].momentum();
      my_bubbles[i].move();
      my_bubbles[i].display();
      my_bubbles[i].die();


      //Timer
      textSize(30);
      text((17*1000 - millis())/1000, width/2, height/2);

      // Score Keeper

      if(17*1000 - millis() <= 1000)
      {
        for(int a = 0; a < my_bubbles.length; a++)
        {
          for(int b = 0; b <my_bubbles.length; b++)
          {
            //Stop motion of bubbles so they stop expanding and the score doesn't keep growing
            float x = 0;
            float y = 0;
            float dx = 0;
            float dy = 0;
            my_bubbles[i].move();
          }
        }
        // Closing Slide
        background(0);
        text("Game Over", width/2, height/2-30);
        text("Your Score:", width/2, height/2);
        text(numBubbles, width/2, height/2+30);

      }

    }
  }

}





















