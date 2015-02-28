
//HW_5
//copyright Joanne Lo jylo 2014

//variable1
float x, y, wd, ht,dx; 
color ellipseColor;

//variable2
float x1, y1, wd1,ht1,dx1;
color rColor;

//background color
color bgColor;

void setup( ) 
{
size( 400, 400 ); 
fill( 0 ); 
//variable1
x =0;
y = 0;
wd=20;
ht=25;
dx = 10;
ellipseColor = color(80,50,235); 
//variable2
x1=width;
y1=height;
wd1=25;
ht1=30;
dx1=20;
rColor= color(50,150,150);
//backgroundcolor
bgColor = color(0,10); 
//noStroke ( );
}

void draw( )
{
prepareWindow( ); 
drawEllipse( x, y, wd, ht);
drawEllipse( x1, y1, wd1, ht1, rColor);
moveEllipse( ); 
}

void prepareWindow()
{
  fill (bgColor);
  rect(0,0,width,height);
}

void drawEllipse( float x, float y, float wd, float ht)
{
 ellipseMode(CORNER);
  //ellipse1
  fill(ellipseColor);
  ellipse(x,y,wd,ht);
}

void drawEllipse( float x, float y, float wd, float ht, color rColor)
  //ellipse2
{
ellipseMode(CORNER);
  fill(rColor);
  ellipse(x,y,wd,ht);
}

void moveEllipse()
  //ellipse 1
  {
  if ((x < width - wd) && (y == height - height)) {
    x += dx;
  }
  else if ((x > width - width) && (y >= height - ht)) {
    x -= dx;
  }
  else if ((x >= width - wd) && (y <= height - ht)) {
    y += dx;
  }
  else if ((x <= wd) && (y > height - height)) {
    y -= dx;
  }
    
  //ellipse 2
   if ((x1 < width - wd1) && (y1 == height - height)) {
    x1 += dx1;
  }
  else if ((x1 > width - width) && (y1 >= height-ht1)) {
    x1 -= dx1;
  }
   else if ((x1 >= width - wd1) && (y1 <= height - ht1)) {
    y1 += dx1;
  }
  else if ((x1 <= wd1) && (y1 > height - height)) {
    y1 -= dx1;

  }
}









