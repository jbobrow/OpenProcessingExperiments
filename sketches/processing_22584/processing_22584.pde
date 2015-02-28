
int ballr = round(random(10,50));
Ball[] Rballs = new Ball[ballr];
int ballg = round(random(10,50));
Ball[] Gballs = new Ball[ballg];
int ballb = round(random(10,50));
Ball[] Bballs = new Ball[ballb];

boolean[] TF = {false,true};
int _width = 640;
int _height = 480;

//Ball(int x, int y, int dirX, int dirY, int speedX, int speedY, int diam, int r, int g, int b)
void setup()
{
  background(0);
  smooth();
  //noStroke();
  size(_width,_height);
  int x,y,dirX,dirY,speedX,speedY,diam,r,g,b,i;
  
  for(i = 0; i < ballr; i++)
  {
    x = round(random(0,_width));
    y = round(random(0,round(_height/3)));
    if(TF[round(random(0,1))])
      dirX = 1;
    else
      dirX = -1;
    if(TF[round(random(0,1))])
      dirY = 1;
    else
      dirY = -1;
    speedX = round(random(0,10));
    speedY = round(random(0,10));
    diam = round(random(5,10)) * 2;
    r = round(random(128,255));
    g = 0;
    b = 0;
    Rballs[i] = new Ball(x,y,dirX,dirY,speedX,speedY,diam,r,g,b,0,0,_width,round(_height/3));
  }
  for(i = 0; i < ballg; i++)
  {
    x = round(random(0,_width));
    y = round(random(round(_height/3),round(_height/3)*2));
    if(TF[round(random(0,1))])
      dirX = 1;
    else
      dirX = -1;
    if(TF[round(random(0,1))])
      dirY = 1;
    else
      dirY = -1;
    speedX = round(random(0,10));
    speedY = round(random(0,10));
    diam = round(random(5,10)) * 2;
    g = round(random(128,255));
    r = 0;
    b = 0;
    Gballs[i] = new Ball(x,y,dirX,dirY,speedX,speedY,diam,r,g,b,0,round(_height/3),_width,round(_height/3)*2);
  }
  for(i = 0; i < ballb; i++)
  {
    x = round(random(0,_width));
    y = round(random(round(_height/3)*2,_height));
    if(TF[round(random(0,1))])
      dirX = 1;
    else
      dirX = -1;
    if(TF[round(random(0,1))])
      dirY = 1;
    else
      dirY = -1;
    speedX = round(random(0,10));
    speedY = round(random(0,10));
    diam = round(random(5,10)) * 2;
    b = round(random(128,255));
    r = 0;
    g = 0;
    Bballs[i] = new Ball(x,y,dirX,dirY,speedX,speedY,diam,r,g,b,0,round(_height/3)*2,_width,_height);
  }
}

void draw()
{
    //background(0);
    for(int i = 0; i < ballr; i++)
      Rballs[i].move();
    for(int i = 0; i < ballg; i++)
      Gballs[i].move();
    for(int i = 0; i < ballb; i++)
      Bballs[i].move();
}

// Ball, a classic, well-behaved ball
class Ball
{
  int x = 20;
  int y = 20;
  int speedY = 1;
  int speedX = 1;
  int dirY = 1;
  int dirX = 1;
  int diam = 2;
  int border = diam / 2;
  int origX = 0;
  int origY = 0;
  int endX = 640;
  int endY = 480;
  int maxW = endX - border;
  int maxH = endY - border;
  int minW = 0 + diam;
  int minH = 0 + diam;
  int r = 255;
  int g = 255;
  int b = 255;

  Ball(int x, int y, int dirX, int dirY, int speedX, int speedY, int diam, int r, int g, int b, int origX, int origY, int endX, int endY)
  {
    this.x = x;
    this.y = y;
    this.dirX = dirX;
    this.dirY = dirY;
    this.speedX = speedX;
    this.speedY = speedY;
    this.diam = diam;
    this.r = r;
    this.g = g;
    this.b = b;

    this.border = this.diam / 2;
    this.origX = origX;
    this.origY = origY;
    this.endX = endX;
    this.endY = endY;
    
    this.maxW = this.endX - this.border;
    this.maxH = this.endY - this.border;
    this.minW = this.origX + this.diam;
    this.minH = this.origY + this.diam;
  }
  
  public void move()
  {
    this.x += this.speedX * this.dirX;
    this.y += this.speedY * this.dirY;
    fill(this.r,this.g,this.b,255);
    ellipse(this.x,this.y,this.diam,this.diam);

    if(this.x >= this.maxW)
      this.dirX = -1;
    else if(this.x <= this.minW)
      this.dirX = 1;
    if(this.y >= this.maxH)
      this.dirY = -1;
    else if(this.y <= this.minH)
      this.dirY = 1;
  }    
}


