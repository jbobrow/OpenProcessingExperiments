

import ddf.minim.*;
Minim minim;
AudioSample Voidscream;
AudioPlayer bgsound;


void setup()
{minim = new Minim(this);
  bell = minim.loadSample("Voidscream"); 
  bgsound = minim.loadFile("Alarm.mp3");
  bgsound.loop();
  
  noStroke();
  ellipseMode(RADIUS);
  size(800, 600);
    
  score = 0;
  in_play = true;
  green_ball = generate_ball();
  blueballx = new Ball[100];
  blueballx[0] = generate_ball();
  x_mouse = new int[shadow_size];
  y_mouse = new int[shadow_size];
  for (int i = 0; i < x_mouse.length; i++)
  {
    x_mouse[i] = mouseX;
    y_mouse[i] = mouseY;
  }
  frameRate(60);
}
}
  
void draw()
{
  if (in_play)
  {
    background(400, 200, 400); // set background color
      
    fill(0);
    textSize(20);
    text("Score: " + score, 20, 40); //add score
      
    ball = (int) map(mouseX, 0, width, 15, 30);
    int ball_alpha = (int) map(mouseY, 0, height, 255, 0);
     
    for (int i = 0; i < x_mouse.length; i++)
    {
      fill(255, 0, 0, (i + 1)/(float) shadow_size * ball_alpha);
      ellipse(x_mouse[i], y_mouse[i], (i + 1)/(float) shadow_size * ball, (i + 1)/(float) shadow_size * ball);
    }
     
    for (int i = 0; i < x_mouse.length-1; i ++ )
    {
      x_mouse[i] = x_mouse[i+1];
      y_mouse[i] = y_mouse[i+1];
    }
     
    x_mouse[x_mouse.length - 1] = mouseX;
    y_mouse[y_mouse.length - 1] = mouseY;
      
    blueball = (int) map(mouseX, 0, width, 40, 15);  // 
      
    fill(0, 255, 0);
    ellipse(green_ball.x, green_ball.y, blueball, blueball);
    green_ball.update(); // draw and update green ball
      
    fill(0, 0, 255);
    for (int i = 0; i < score + 1; i++) // draw and update blueball
    
    {
     blueballx[i].update();
      ellipse(blueballx[i].x, blueballx[i].y, blueball, blueball);
        
      if (dist(mouseX, mouseY, blueballx[i].x, blueballx[i].y) < (blueballx + blueball) * 0.9) // check for collision between blue balls and red ball
      {
        in_play = false;
      }
    }
      
    if (dist(mouseX, mouseY, green_ball.x, green_ball.y) < ball + blueball) // check for collision between red ball
    {
      score++;
      blueballx[score] = generate_ball();
      green_ball = generate_ball();
    }
  }
  else
  {
    fill(0);
    textSize(70);
    text("GAME OVER!", width / 2 - 230, height / 2);
  }
}
  
Ball generate_ball()
{
  int x, y, vx, vy;
    
  //keep distance of red ball from green ball
  do
  {
    x = (int) random(width);
    y = (int) random(height);
  } while (dist(mouseX, mouseY, x, y) < ball + blueball + 50);
  vx = (int) random(4);
  vy = (int) random(4);
  return new Ball(x, y, vx, vy);
}
  
void mousePressed()
{
  setup();
}

class Ball
{
  int x, y, vx, vy;
  Ball(int start_x, int start_y, int x_vel, int y_vel)
  {
    x = start_x;
    y = start_y;
    vx = x_vel;
    vy = y_vel;
  }
    
  void update()
  {
    x += vx; // update position with velocity
    y += vy;
      
    if (x <= 0 || x >= width) { // check for collision on x axis
      vx = -vx;
    }
      
    if (y <= 0 || y >= height) { // check for collision on y axis
      vy = -vy;
  }
  }
  }
  
int blueball;
int ball;
int score;
int shadow_size = 20;
boolean in_play;
Ball[] blueballx;
Ball green_ball;
int[] x_mouse;
int[] y_mouse;

