
int r = 10;
float x0 = r, y0 = r;
float v = 30;
float theta = (PI/8)*3;

float t = 0;
float x = x0, y = y0; 
float vx = v * cos(theta), vy = v * sin(theta);

void setup()
{
  size(300,300);
  colorMode(RGB,255,255,255,100);
  ellipseMode(RADIUS);
  background(0,0,0);
  frameRate(30);
}

void draw()
{
 stroke( 0, 0, 0, 10 );
 fill( 0, 0, 0, 10 );
 rect( 0, 0, width, height );

 x = x0 + vx*t;
 y = y0 + vy*t;

 stroke( 0, 0, 100, 100 );
 fill( 0, 200, 255, 100 );
 ellipse( x, y, 10, 10 );
 t = t + 0.1;
 
 if( y > height-r )
 {
   vy = -vy;
   x0 = x;
   y0 = height-r;
   t = 0;
 }
}



