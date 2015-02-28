
//JiYoung Lee
//HW 8
//Copyright@Jiyoung Lee

int u, x,fx,fy,dia,y;

void setup()
{
  size (400,400);
  background(255,141,124);
  u = 0;
  dia = 20;
  fx=30;
  fy=100;
  x=20;
}
void draw ( )
{
  if ( u == 0 ) {
    forFx ( );
  } else if ( u == 1 ) {
    whileFx ( );
    x = x + 10;
    if (x > width ) {
      x = 0;
    }
  }
}

void whileFx ( )
{
  int y = 0;
  while (y < height) {
    background(255,141,124);
    noStroke();
    fill (142,random(19),random(86));
    ellipse (x, y, dia, dia);
    y = y + fy;
  }
}

void forFx ( )
{  int x = 0;
  while (x < height) {
    stroke(255);
    fill (142,random(19),random(86));
    ellipse (x, y, dia+20, dia+20);
    x = x + fx;
    
    }
  }

 
void keyPressed ( )
{
  if (key == 'a') {
    u = 1;
    background (255);
  } else if (u == 10) {
    u = 0;
  }
}


