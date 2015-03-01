
PImage nosey;
Circle boney;

void setup() {
  size(729, 944);
  nosey = loadImage("nosey.png");
  background(0);
  tint(255, 126);
  boney = new Circle();;
}

void draw() 
{
  for (int i = 0; i < 100; i++)
  {
    float x = random(width);
    float y = random(height);
    color c = nosey.get(int(x),int(y));
    boney.drawCircle();
    if (mousePressed == true) {
    fill(c,100);
  } else {
    fill(c,25);
    noStroke();
    smooth();
    ellipse(x,y,16,16);
  }
}
}

void keyPressed()
{
   if (keyCode == UP)
  {
    boney.moveup();
  }
   if (keyCode == DOWN)
  {
    boney.movedown();
  }
   if (keyCode == LEFT)
  {
    boney.moveleft();
  }
   if (keyCode == RIGHT)
  {
    boney.moveright();
  }
}

class Circle
{
  float posx=0;
  float posy=0;
  float h;
  float w;
  color c;
  
  Circle()
  {
    posy = (height);
    posx = (width);
    h = (25);  
    c = color((255),(255),(255));
    w = (25); 
  }
  
  void drawCircle()
  {
    ellipse(posx, posy, 55, 55);
  }
  
  void moveup() 
  {
    posy-=1;
}
  void movedown() 
  {
    posy-=-1;
}
  void moveleft() 
  {
    posx-=1;
}
  void moveright() 
  {
    posx-=-1;
}
}


