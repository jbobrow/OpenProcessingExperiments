
//This code belongs to Rehan Butt

float x = 20;
float y = 20;
PImage Rocket;
float SqSize = 25;
boolean show = true;

void setup() 
{
  size(1200, 600);
  //noLoop();
  smooth();
  //Rocket = loadImage("rocket_rehan.png");
}

void draw() 
{
  if(show == true)
  {
  text("Welcome to Rocket: The Next Generation of Paint", 10, 10, 500, 500);
  text("Click the 'H' key at any time for help", 50, 30, 500, 500);
  }
  //image(Rocket, 20, 200, 100,100);
  //background(204);
  noStroke();
  rect(y*20, x*20, SqSize, SqSize);
  
  //fill(100,0,100); 
  //ellipse(width/2,height/2,30,30);
}

void keyPressed() 
{
  show = false;
  redraw();
  //text("¡WeHe!",15,20);
  if(keyCode == UP)
  {
    x -= 1;
    redraw();
  }
  else if(keyCode == DOWN)
  {
    x += 1;
    redraw();
  }
  else if(keyCode == 'W')
  {
    textSize(100);
    stroke(3);
    text("¡WeHe!",width/2,height/2);
  }
  else if(keyCode == RIGHT)
  {
    y+=1;
    redraw();
  }
  else if(keyCode == 'V')
  {
    float R = int(random(255));
    float G = int(random(255));
    float B = int(random(255));
    fill(R,G,B);
    rect(y*20, x*20, SqSize, SqSize);
    redraw();
  }
   else if(keyCode == 'B')
  {
    float R = int(random(255));
    float G = int(random(255));
    float B = int(random(255));
     background(R,G,B);
  }
  else if(keyCode == LEFT)
  {
    y-=1;
    redraw();
  }
  else if (keyCode == 'L')
  {
    SqSize +=1;
    redraw();
  }
   else if (keyCode == 'K')
  {
    SqSize -=1;
    redraw();
  }
  else if(keyCode == 'H')
  {
     text("Press ARROW KEYS to move the cursor (The Rocket); Press 'V' to randomize Rocket color; Press 'B' to clear and randomize background color; Press the 'K' to decrease The Rocket's size; Press the 'L' to increase The Rocket's size", 20, height-50, 850, 500);
  }
  
}
