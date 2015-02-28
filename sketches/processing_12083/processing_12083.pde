
int x = 150;
int y = 150;
int w = 50 ;
int h = 50;
color c;
int hSpeed = 2;
int vSpeed = 2;
int SIZE = 60;
int topY = y + h /3;

void setup( )
{
  size(300, 300);
  smooth();
  x = int(random(SIZE/2, width - SIZE));
  y = int(random(SIZE/2, height - SIZE));

}

void draw()
{
  background(00,00,33);
  smooth();
  drawHouse(10,100,40,90,color(0,200,100)); 
  drawHouse(150,130,90,80, color(0,200,100)); 
  drawHouse(10,150,110,100, color(200,200,0));
  drawMoon();
  drawBalloon();
  move();
  bounce();
}
void drawBalloon()
{
  color trans = color(255, 150, 70, 28);  
  fill(trans);
  ellipse( x, y, w/1.20, h);
  line( x, y + h/2, x + w/3, y + h);
}

void move()
{
  x = x- hSpeed;
  y = y - vSpeed;
}

void bounce()
{
  if (x > width - SIZE/3 || x < SIZE/3 )
  {
    hSpeed = -1 * hSpeed;
  }

  if (y > height -SIZE/2 || y < h/2)
  {
    vSpeed = -1 * vSpeed;
  }


}

void drawHouse(int x, int y, int w, int h, color c)
{

  ///first house
  rectMode(CORNERS);
  stroke(255);
  fill(c);
  triangle(x, topY, x+ w/2, y-SIZE/3, x+w,topY);//top
  rect(x, topY, x+w, topY + h *2 /3);//house

  ///second house

  triangle (x + w * 2.10, y - h/1.5, x + w * 2.5 , y,  x + w * 5/3, y );//top
  rect(x + w * 2.5, y + h, x + w * 5/3, y);//house


  fill(00);
  rect(x + w/8, topY + h/8, x + w/4, topY + h/4);//window
  rect(x + w * 5/8, y + h * 3/5, x + w * 13/16, topY + h * 2/3);//door
  rect(x + w * 2.1 , y + h , x + w * 2.3, topY + h * 2/3.5);//door
  rect(x + w/5, topY + h/8,  x +w/6, topY + h/4); //window stripes
  rect(x + w * 2, y + h/5 , x * w * 2/9, y + h/3); //window
} 
void drawMoon()
{
  int x = 160;
  int y = 60;
  int size= 30;
  stroke(255);

  fill(00,00,33);
  arc (x, y, size, size, 0, PI/1.5);

}















