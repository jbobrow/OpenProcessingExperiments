
final int NONE = 0;
final int HAUT = 1;
final int BAS = 2;
final int GAUCHE = 3;
final int DROITE = 4;
final int MORT = 1;
final int VIVANT = 2;
final int H_OFFSET = 50;
final int VOID = 0;
final int OBSTACLE = -1;
final int CLEAR_TAIL = -2;
final int SLOW_DOWN = -3;
final int BONUS = -4;
final int NB_PUP = 3;

import ddf.minim.*;

PFont font;
int px, py;
int tailx,taily;
int len;
int speed;
int slowdown;
boolean slow;
int nextpup;
int[][] gmap;
int dir,nexdir;
boolean lockdir;
int state, score, maxscore;
Minim minim;
AudioSample explode;
AudioSample beep;

void setup()
{
  size(800,400+H_OFFSET);
  font = loadFont("BerlinSansFB-Bold-40.vlw");
  textFont(font);
  minim = new Minim(this);
  explode = minim.loadSample("explosion.mp3", 2048);
  beep = minim.loadSample("beep.mp3", 2048);
  background(0);
  ellipseMode(CORNER);
  smooth();
  lockdir = false;
  len = 1;
  speed = 5;
  dir = NONE;
  nexdir = NONE;
  state = VIVANT;
  gmap = new int[width/10][(height)/10];
  px = tailx = width/2;
  py = taily = (height-H_OFFSET)/2 + H_OFFSET;
  score = -1;
  score();
  place(px,py);
  obstacle();
  nextpup = int(random(50,150));
}

void draw()
{
  if(frameCount%speed == 1)
  {
    redraw();
  }
  if(frameCount%speed == 0)
  {    
    if (slow)
      if (slowdown-- == 0)
      {
        speed = 5;
        slow = false;
      }
    dir = nexdir;
    move(dir);
    if (dir != NONE)
    {
      if (nextpup-- == 0)
      {
        nextpup = int(random(50,150));
        placePowerUP();
      }
      col(px,py);
      if (state == MORT)
      {
        clear();
        return;
      }
      place(px,py);
    }
  }
}

void move(int direction)
{
  switch(direction)
  {
    case HAUT:
    py-=10;
    break;
    case BAS:
    py+=10;
    break;
    case GAUCHE:
    px-=10;
    break;
    case DROITE:
    px+=10;
    break;
    default:
    break;
  }
  
  lockdir = false;
}

void place(int x, int y)
{
  gmap[x/10][y/10] = len++;
  score++;
}

int col(int x, int y)
{
  if (x/10 < 0 || x/10 >= (width/10) || y/10 < H_OFFSET/10 || y/10 >= (height/10))
  {
   explode.trigger();
   state = MORT;
   return 1;
  }
  if (gmap[px/10][py/10] > 0 || gmap[px/10][py/10] == -1)
  {
    explode.trigger();
    state = MORT;
    return 1;
  }
  if (gmap[px/10][py/10] < -1)
  {
    switch(gmap[px/10][py/10])
    {
      case CLEAR_TAIL:
      beep.trigger();
      clearTail();
      break;
      case SLOW_DOWN:
      beep.trigger();
      slowdown = 50;
      speed = 10;
      slow = true;
      break;
      case BONUS:
      beep.trigger();
      score+=250;
      break;
      default:
      break;
    }
  }
  return 0;
}

void clear()
{
  if(score>maxscore)
    maxscore = score;
  setup();
}

void keyPressed() {
  
  if (lockdir)
    return;
    
  if (key == CODED)
  {
    if (keyCode == UP) 
    {
      if (dir == BAS) return;
      nexdir = HAUT;
    }
    else if (keyCode == DOWN) 
    {
      if (dir == HAUT) return;
      nexdir = BAS;
    }
    else if (keyCode == LEFT) 
    {
      if (dir == DROITE) return;
      nexdir = GAUCHE;
    }
    else if (keyCode == RIGHT) 
    {
      if (dir == GAUCHE) return;
      nexdir = DROITE;
    }
    else 
    {
    nexdir = nexdir;
    } 
  }
  else if(key == ' ')
    clear();
  else if(key == 't')
    placePowerUP();
  else if(key == 'c')
    clearTail();
  
  lockdir = true;
}

void score()
{
  stroke(30,23,142);
  strokeWeight(3);
  fill(205,202,247);
  rect(0, 0, width, H_OFFSET-2);
  fill(0,0,200);
  text("             Score: "+score+"           Max: "+maxscore/*+" Par Frédérick Blais"*/, 10, H_OFFSET/2 + 10);
}

void obstacle()
{
  int num = int(random(50,125));
  for(int i = 0; i < num; i++)
  {
    int x,y;
    x = int(random(0,width/10));
    y = int(random(H_OFFSET/10,height/10));
    gmap[x][y] = -1;
  }
}

void redraw()
{
  background(0);
  for(int i = 0; i < width/10; i++)
    for(int j = 0; j < height/10; j++)
    {
      switch(gmap[i][j])
      {
        case OBSTACLE:
          strokeWeight(2);
          stroke(167,152,152);
          fill(85,79,79);
          rect(i*10,j*10,10,10);
          break;
        case VOID:
          break;
        case SLOW_DOWN:
          strokeWeight(0);
          fill(203,23,232);
          ellipse(i*10,j*10,10,10);
          break;
        case CLEAR_TAIL:
          strokeWeight(0);
          fill(44,240,104);
          ellipse(i*10,j*10,10,10);
          break;
        case BONUS:
          strokeWeight(0);
          fill(247,221,20);
          ellipse(i*10,j*10,10,10);
          break;
        default:
          strokeWeight(2);
          fill(250,91,91);
          stroke(255,0,0);
          rect(i*10,j*10,10,10);
          break;
        
      }
    }
    score();
}

void placePowerUP()
{
  int x,y;
  int PUP = int(random(-2-NB_PUP,-2));
  do
  {
    x = int(random(0,width/10));
    y = int(random(H_OFFSET/10,height/10));
  }
  while(gmap[x][y] != 0);
  gmap[x][y] = PUP; 
}

void clearTail()
{
  int x = tailx/10;
  int y = taily/10;
  int offset = 1;
  int tail = gmap[x][y];
  
  if (len-tail < 4)
    return;
  
  do
  {
    gmap[x][y] = 0;
    
    if (x-1 >= 0)
    if (gmap[x-1][y] == tail+offset)
    {
      x--;
      offset++;
      continue;
    }
    if(y-1 > 0)
    if (gmap[x][y-1] == tail+offset)
    {
      y--;
      offset++;
      continue;
    }
    if(y+1 < height/10)
    if (gmap[x][y+1] == tail+offset)
    {
      y++;
      offset++;
      continue;
    }
    if(x+1 < width/10)
    if (gmap[x+1][y] == tail+offset)
    {
      x++;
      offset++;
      continue;
    }
  }
  while(gmap[x][y] != int(len-(len-tail)/4));
  tail = int(len-(len-tail)/4);
  tailx = x*10;
  taily = y*10;
}


