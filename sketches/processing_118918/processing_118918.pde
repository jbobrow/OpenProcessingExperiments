
float x1, y1, sz1, speedx1, speedy1;
float x2, y2, sz2, speedx2, speedy2;
color col1, col2;

void setup()
{
  size(400, 400);
  rectMode(CENTER);
  x1 = random(width);
  y1 = random(height);
  sz1 = 100;
  speedx1 = random(2, 4);
  speedy1 = 2;

  x2 = random(width);
  y2 = random(height);
  sz2 = 40;
  speedx2 = random(2, 4);
  speedy2 = 2;
}

void draw() 
{
  prepWindow();
  drawThing1(x1, y1, sz1);
  moveThing1();
  drawThing2(x2, y2, sz2);
  moveThing2();
  checkCollision();
}

void prepWindow()
{
  fill(190,162,255);
  rect(width/2, height/2, width, height);
}

void drawThing1(float x, float y, float z)
{
  fill(255,162,251);
  
  ellipse(x-z*.1,y-z/1.5,z/6,z/2);
  ellipse(x+z*.1,y-z/1.5,z/6,z/2);
  ellipse(x, y, z/1.5, z);
  fill(50);
  ellipse(x-z*.15, y+z/20,z/8,z/8);
  ellipse(x+z*.15, y+z/20,z/8,z/8);
  fill(250,45,37);
  ellipse(x, y+z/3,z/3,z/6);
  
  
  
}

void moveThing1()
{
  x1 += speedx1;
  y1 += speedy1;
  if (x1 > width)
  {speedx1 = -speedx1;}
  else if(x1 < 0)
  {
   speedx1 = -speedx1;
  };
  
  if (y1 > height)
  {
    speedy1 = -speedy1;}
    
    else if( y1 < 0)
    {
    speedy1 = -speedy1;
  };
}


void drawThing2(float x, float y, float z)
{
   fill(255,255,random(255));
  ellipse(x,y,z,z); 

  fill(0);
  ellipse(x-z*.2,y-z*.3,z*.1,z*.1);
  ellipse(x+z*.2,y-z*.3,z*.1,z*.1);
  fill(255,60,70);
  arc(x, y-z/11, z*.8, z*.8, 0, PI);

}
void moveThing2()
{
  x2 += speedx2;
  y2 += speedy2;
  if (x2 > width || x2 < 0)
  {
    speedx2 = -speedx2;
    x2 += speedx2;
  }
  else if (y2 > height|| y2 < 0)
  {
    speedy2 = -speedy2;
    y2 += speedy2;
  }
}


void checkCollision()
{
  //  float colDist = sz1/2 +sz2/2;
  //  if (d <+ colDist)
  float speed = dist(x1, y1, x2, y2);
  if ( speed < (sz1/2 +sz2/2))
  {
    speedx1 = speedx2;
    noStroke();
    fill( 255, 220, 200);
    rect(width/2, height/2, width, height);
  }
}


void keyPressed()
{
  if (keyCode == RIGHT)
  {
    speedx1++;
  }
  else if (keyCode == LEFT)
  {
    speedx1--;
  }
  else if (keyCode == UP)
  {
    speedy2++;
  }
  else if (keyCode == DOWN)
  {
    speedy2--;
  }

  else if (keyCode == ' ')
  {
    x1 = random(width);
    y1 = random(height);
    x2 = random(width);
    y2 = random(height);
    speedx1 = random(0, 10);
    speedy1 = random(0, 10);
    speedx2 = random(0, 10);
    speedy2 = random(0, 10);
  }
}
