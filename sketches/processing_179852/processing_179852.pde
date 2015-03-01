
Car c1,c2,c3,c4,c5,c6,c7,c8,c9,c0;
Ball b;
float theta;
int velx;
float vely;
int posx;
int posy;
int col;
float height;
float width;
ArrayList<Car> cars = new ArrayList<Car>();
boolean keyup,keyleft,keyright,keyspace,keydown;

void setup()
{
  size(700,700);
  b = new Ball(200,200,5,1);
  c1 = new Car();
  c2 = new Car();
  c3 = new Car();
  c4 = new Car();
  c5 = new Car();
  c6 = new Car();
  c7 = new Car();
  c8 = new Car();
  c9 = new Car();
  c0 = new Car();
}

void draw()
{
  background(0);
  b.drawBall();
  c1.drawCar();
  c2.drawCar();
  c3.drawCar();
  c4.drawCar();
  c5.drawCar();
  c6.drawCar();
  c7.drawCar();
  c8.drawCar();
  c9.drawCar();
  c0.drawCar();

  if (keyleft) c1.left();
  if (keyright)c1.right();
  if (keyup)c1.up();
  if (keydown) c1.down();
  
  if (keyleft) c2.left();
  if (keyright)c2.right();
  if (keyup)c2.up();
  if (keydown) c2.down();
  
  if (keyleft) c3.left();
  if (keyright)c3.right();
  if (keyup)c3.up();
  if (keydown) c3.down();
  
  if (keyleft) c4.left();
  if (keyright)c4.right();
  if (keyup)c4.up();
  if (keydown) c4.down();
  
  if (keyleft) c5.left();
  if (keyright)c5.right();
  if (keyup)c5.up();
  if (keydown) c5.down();
  
  if (keyleft) c6.left();
  if (keyright)c6.right();
  if (keyup)c6.up();
  if (keydown) c6.down();
  
  if (keyleft) c7.left();
  if (keyright)c7.right();
  if (keyup)c7.up();
  if (keydown) c7.down();
  
  if (keyleft) c8.left();
  if (keyright)c8.right();
  if (keyup)c8.up();
  if (keydown) c8.down();
  
  if (keyleft) c9.left();
  if (keyright)c9.right();
  if (keyup)c9.up();
  if (keydown) c9.down();
  
  if (keyleft) c0.left();
  if (keyright)c0.right();
  if (keyup)c0.up();
  if (keydown) c0.down();
}
void keyPressed()
{
  if (keyCode == LEFT) keyleft = true;
  if (keyCode == RIGHT) keyright = true;
  if (keyCode == UP) keyup = true;
  if (key == ' ') keyspace = true;
  if (keyCode == DOWN) keydown = true;
}
void keyReleased()
{
  if (keyCode == LEFT) keyleft = false;
  if (keyCode == RIGHT) keyright = false;
  if (keyCode == UP) keyup = false;
  if (key == ' ') keyspace = false;
  if (keyCode == DOWN) keydown = false;
}


class Car
{
  int s;
  public int posx;
  public int posy;
  float velx;
  float vely;
  int size;
  color c;
  int col;
  
  Car()
  {
    s = int(random(175));
    posx = int(random(600));
    posy = int(random(600));
    c = color(random(255),random(255),random(255));
    
    
  }
  
  Car(int s, int px, int py)
  {
    size = s;
    posx = px;
    posy = py;
    c = color(random(255) , random(255) , random(255));
    println(c);
    velx = 0;
    vely = 0;
  }
  void drawCar()
  {
    fill(c);
    posx = int(posx + velx);
    posy = int(posy + vely);
    rect(posx,posy,s,s);
    if (b.calculateDistance <= 30)
    {
      fill(255,0,0);
    }
    if (b.calculateDistance(posx,posy) > 30)
    {
      fill(c);
    }

     if ((posx < 0) || (posx > 700))  velx *= -1;
    if ((posy < 0) || (posy > 700))  vely *= -1;
    
    if (posx > 699)
    { 
     velx = 0;
    }
    else if (posx < 0)
    {
      velx =0;
    }
    if (posy > 699)
    {
      vely = 0;
    }
    else if (posy < 0)
    {
      vely = 0;
    }
  }
    
  void left()
  {
    velx = velx-0.25;
  }
  void right()
  {
    velx = velx+0.25;
   
  }
  void up()
  {
    vely = vely-0.25;
  }
  void down()
  {
    vely = vely+0.25;
     println(vely);
  }
  
  void Break()
  {
    velx = 0;
    vely = 0;
  }
  
  void display()
  {
    rectMode(CENTER);
    fill(c);
    rect(posx,posy,100,50);
    
  }
}
  
  class Ball
{
  public float xpos;
  public float ypos;
  float xvel;
  float yvel;
  color c;
  float s;
  float calculateDistance;
  Ball(float x, float y, float xv, float yv)
  {
    xpos = x;
    ypos = y;
    c = color(random(255),random(255),random(255));
    xvel = xv;
    yvel = yv;
    s = 30;
    
  }
  
  void drawBall()
  {
    xpos += xvel;
    ypos += yvel;
    
    if ((xpos < 0) || (xpos > 700))  xvel *= -1;
    if ((ypos < 0) || (ypos > 700))  yvel *= -1;
    
    
    fill(c);
    noStroke();
    ellipse(xpos,ypos,s,s);
  }
  float  calculateDistance(float posx, float posy)
  {
    return dist(posx,posy,xpos,ypos);
     
}

}



