
//Game
//copyright benjmain corwin 2012
float a, b, c,
      r, g, bl,
      w, sd, 
      bx, by, 
      lx, ly, 
      lxSpeed, lySpeed, 
      bySpeed, bxSpeed,
      clra, clrb, clrc, //color change
      collisionnum
      ;
      //byte h;

void setup()
{
  size (400,400);
  noStroke();
  textAlign(CENTER);
  bx = random(400);//bouncing object x
  by = random(400);//bouncing object y
  lx = width/2 ;
  ly = height/2;
  sd = 60; //diameter of objects
  bxSpeed = random(-4,4);
  bySpeed = random(-4,4);
  lxSpeed = random(-2,2);
  lySpeed = random(-2,2);
  r = 225;
  g = 225;
  bl= 225;
  a = random(225);//starting color red
  b = random(225);//starting color green
  c = random(225);//starting color blue
  clra = 2;//color
  clrb = 3;//color
  clrc = 1;//color
  w = 1;// ossolation of ellipse
  collisionnum = 0;
  //byte h = loadBytes("highscore.dat")
}
void draw()
{

  prepWindow();
  drawObjectbounce(bx, by, sd);
  drawObjectloop(lx,ly,sd);
  objectBounce();
  objectLoop();
  colorObject();
  checkCollision();
  displaytext();
  gameOver();
}

void displaytext()
{
  textSize(20);
  fill(0);
  int c;
  c = int(collisionnum);
  text("Collisions: " + c, 100,100);
  int m = millis();
  text("Time: " + (60 - int (m/1000)), 100, 120);

}

void gameOver()
{
  if (millis() - 60000 >= 0)//adjust "Time: " + 6 to 60
  {
  background(0);
  fill (255);
  textSize (55);
  text("GAME OVER", width/2, height/3);
  int c = int (collisionnum);
  textSize (20);
  text("YOUR SCORE: " + c, width/2, height/2);
//  textSize(19);
//  text("HIGH SCORE: " +  h, width/2, height/2 + 25);
//    if( c > h)
//    {
//      byte[] h = Sc;
//      saveBytes ("highscore.dat", h);
//    }

  noLoop();
  }
}

void checkCollision()
{
  float d = dist(bx, by, lx,ly);
  if (d <= sd + 15 * cos(w)-sd/4)
  {
    collisionnum ++;
    bx = random(width);
    by = random(height);
    r = random (225);
    g = random (225);
    bl = random (225);
    prepWindow();
  }
}



void mouseDragged()
{
  if (mouseX > pmouseX)
  {
    lxSpeed += .1;
  }
  else if (pmouseX > mouseX)
  {
    lxSpeed -= .1;
  }
  if (mouseY > pmouseY)
  {
    lySpeed += .1;
  }
  else if (pmouseY > mouseY)
  {
    lySpeed -= .1;
  }
}
void prepWindow()
{
  fill ( r,g,bl, 100);
  rect ( 0, 0, width, height);
}

void drawObjectbounce(float x, float y, float d)
{
  w = w + .1;
  fill(a,b,c);
  ellipse(x, y ,d + 15 * cos(w) ,d + 15 * cos(w));
}

void drawObjectloop(float x, float y, float d)
{
  fill(0);
  ellipse(x, y, d/2, d/2);
  
}


void objectBounce()
{
  bx = bx + bxSpeed;
  if (bx >= width - sd/2)
  {
    bxSpeed = -bxSpeed;
  }
  else if (bx <= sd/2 )
  {
    bxSpeed = -bxSpeed;
  }
  
  by = by + bySpeed;
  if ( by >= height - sd/2)
  {
    bySpeed = -bySpeed;
  }
  else if (by <= sd/2)
  {
    bySpeed = -bySpeed;
  }
}

void objectLoop()
{
  lx = lx + lxSpeed;
  if (lx > width + sd/4)
  {
    lx = 0 - sd/4;
  }
  else if (lx < 0 - sd/4)
  {
    lx = width + sd/4;
  }
  
  ly = ly + lySpeed;
  if ( ly > height + sd/4)
  {
    ly = 0 - sd/4;
  }
  else if (ly < 0 - sd/4)
  {
    ly = height + sd/4;
  }
}


void colorObject()
{
  a = a + clra;
  b = b + clrb;
  c = c + clrc;
  
  if (a >= 225)
  {
    clra = - clra;
  }
  else if (a <= 0)
  {
    clra = - clra;
  }
  
  if (b >= 225)
  {
    clrb = - clrb;
  }
  else if (b <= 0 )
  {
    clrb = - clrb;
  }
  
  if (c >= 225)
  {
    clrc = - clrc;
  }
  else if (c >= 225)
  {
    clrc = - clrc;
  } 
}

void keyPressed()
{
  if (keyCode == UP)
  {
    bySpeed -= 1;
  }
  else if (keyCode == DOWN)
  {
    bySpeed += 1;
  }
  if (keyCode == RIGHT)
  {
    bxSpeed += 1;
  }
  else if (keyCode == LEFT)
  {
    bxSpeed -= 1;
  }
}               
