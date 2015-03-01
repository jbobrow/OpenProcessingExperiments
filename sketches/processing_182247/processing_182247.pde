
PImage labyrinth;
Player p1;
boolean keyup,keyleft,keyright,keydown;


void setup() {
  size(412,412);
  labyrinth = loadImage("labyrinth.jpg");
  background(0);
  p1 = new Player(206,206);
}



void draw() {
  background(0);
  
  if (keyleft)
  {
    color c= labyrinth.get(p1.posx-1,p1.posy);
    if (c==color(255))
    {
      p1.posx-=1;
    }
  }
  if (keyright)
  {
    color c= labyrinth.get(p1.posx+1,p1.posy);
    if (c==color(255))
    {
      p1.posx+=1;
    }
  }
  if (keyup)
  {
    color c= labyrinth.get(p1.posx,p1.posy-1);
    if (c==color(255))
    {
      p1.posy-=1;
    }
  }
  if (keydown)
  {
    color c= labyrinth.get(p1.posx,p1.posy+1);
    if (c==color(255))
      {
        p1.posy+=1;
      }
  }
  for (int i = 0; i < 1500; i++) {
    float x = p1.posx - 40/2 + random(40);
    float y = p1.posy - 40/2 + random(40);
    float r = red(labyrinth.get(int(x), int(y)) );
    float g = green(labyrinth.get(int(x), int(y)) );
    float b = blue(labyrinth.get(int(x), int(y)) );
    fill(r,g,b);
    noStroke();
    ellipse(x,y,2,2);
  }
  p1.drawPlayer();
}
void keyPressed()
{
  if (keyCode == UP)    keyup = true;
  if (keyCode == LEFT)  keyleft = true;
  if (keyCode == RIGHT) keyright = true;
  if (keyCode == DOWN)  keydown = true;
}
void keyReleased()
{
  if (keyCode == UP)    keyup = false;
  if (keyCode == LEFT)  keyleft = false;
  if (keyCode == RIGHT) keyright = false;
  if (keyCode == DOWN)  keydown = false;

}

class Player
{
  int posx;
  int posy;
  float theta;
  float velx;
  float vely;
  float v;
  
  Player(int x, int y)
  {
    posx = x;
    posy = y;
    theta = 0;
  }
  
  void drawPlayer()
  {
    posx = int( posx + velx );
    posy = int( posy + vely );
    fill(250,0,0);
    rect(posx,posy,3,3);
    
  }
}


