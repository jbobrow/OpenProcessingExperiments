
int Brush = 20;
int BrushType = 0;
float fountain = 0;
int Clear = 0;
float RNG = 0;
int NUM = 40;
PVector[] pos;
PVector[] vel;
int[] ttl;
void setup() 
{
  size (500, 500);
  pos = new PVector[NUM];
  vel = new PVector[NUM];
  ttl = new int[NUM];
  for ( int i = 0; i < NUM; i++) {
    pos[i] = new PVector(0, 0);
    if (i < NUM/2) {
      vel[i] = new PVector(random(-2, 2), random(-10, -5));
      ttl[i] = int(random(50, 100));
    } 
    else {
      vel[i] = new PVector(0, 0);
      ttl[i] = int(random(0, 50));
    }
  }
}

void draw()
{
  if (Clear == 1)
  {
    background(0);
  }

  if (BrushType == 2)
  {
    for ( int i = 0; i < NUM; i++) {
      ellipse( pos[i].x + width/2, pos[i].y + height,Brush,Brush );
      
    }

    for ( int i = 0; i < NUM; i++) {
      pos[i].add( vel[i] );
      ttl[i]--;
      if (ttl[i] < 0) {
        vel[i] = new PVector(random(-2, 2), random(-10, -5));
        pos[i] = new PVector(mouseX, mouseY);
        ttl[i] = int(random(50, 100));
      }
    }
    Brush = 200;
  }
}

void mouseDragged()
{
  if (BrushType == 0)
  {
    ellipse(mouseX, mouseY, Brush, Brush);
  }
  else if (BrushType == 1)
  { 
    RNG = random(0, 50);
    fill(random(0, 255), random(0, 255), random(0, 255));
    rect(mouseX - RNG, mouseY + RNG, Brush, Brush);
    fill(random(0, 255), random(0, 255), random(0, 255));
    rect(mouseX - RNG, mouseY - RNG, Brush, Brush);
    fill(random(0, 255), random(0, 255), random(0, 255));
    rect(mouseX + RNG, mouseY + RNG, Brush, Brush);
    fill(random(0, 255), random(0, 255), random(0, 255));
    rect(mouseX + RNG, mouseY - RNG, Brush, Brush);
    fill(random(0, 255), random(0, 255), random(0, 255));
    rect(mouseX, mouseY, Brush, Brush);
  }
}
void mousePressed()
{
  if (BrushType == 2)
  {
  }
}
void keyPressed()
{
  if (keyCode == UP)
  {
    fill(#FF0000);
    stroke(#FF0000);
  }
  else if (keyCode == DOWN)
  {
    if (BrushType == 0)
    {
      fill(#0000CC);
      stroke(#0000CC);
    }
    else if (BrushType == 1)
    {
      fill(random(0, 255), random(0, 255), random(0, 255));
      stroke(0);
    }
    else if (BrushType == 2)
    {
      fill(random(0, 255), random(0, 255), random(0, 255));
      stroke(random(0, 255), random(0, 255), random(0, 255));
    }
  }
  else if (keyCode == RIGHT)
  {
    Brush -= 1;
  }
  else if (keyCode == LEFT)
  {
    Brush +=1;
  }
  else if (keyCode == SHIFT)
  {
    BrushType += 1;
  }
  else if (keyCode == ALT)
  {
    BrushType -= 1;
  }
  else if (keyCode == BACKSPACE)
  {
    Clear = 1;
  }
}
void keyReleased()
{
  if (keyCode == BACKSPACE)
  {
    Clear = 0;
  }
  
  // Brush Type 3 code taken from http://www.local-guru.net/blog/2010/7/2/how-to-make-fireworks-fountains-etc-in-processing
}



