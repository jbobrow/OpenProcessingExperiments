
//Practice 1, Using Arrays
//Daniel C Lee

final int MAX = 500;
int [] x, y, dx, dy, dia;
color [] col;

void setup()
{
 size (400, 400);
 frameRate(24);
 smooth();
 
 x = new int[MAX];
 y = new int [MAX];
 dx = new int [MAX];
 dy = new int [MAX];
 dia = new int [MAX];
 
 col = new color [MAX];
 
 initArray(x, 0, width- width/3);
 initArray(y, 0, height - height/3);
 initArray(dx, 1, 13);
 initArray(dy, 1, 7);
 initArray(dia, 5, 50);
 
 initColor();
}

void initArray(int [] array, int small, int big)
{
 for (int i =0; i < array.length; i++)
 {
  array[i] = int(random(small, big)); 
 }
}

void initColor()
{
 for(int i =0; i < col.length; i++)
 {
  col[i] = color(random(255), random(255), random(255), random(255)); 
 }
}

void draw()
{
 background (255); 
 moveFigure();
 drawFigure();
}

void moveFigure()
 {
  for (int i = 0; i < x.length; i++)
  {
    x[i] = x[i] + dx[i];
    y[i] = y[i] + dy[i];
  } 
  wrapFigure();
 }

void wrapFigure()
{
 for (int i = 0; i < x.length; i++)
 {
  if(x[i] + dx[i] > width+30)
 {
  x[i] = 0 - 30;
 } 
 if (y[i] + dy[i] > height+30)
 {
  y[i] = 0 - 30; 
 }
 }
}

void drawFigure()
{
 for (int i = 0; i < x.length; i++)
{
 stroke(0);
 fill(col[i]);
 ellipse(x[i], y[i], dia[i], dia[i]);
} 
}

