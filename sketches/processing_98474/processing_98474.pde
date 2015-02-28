
//Homework 11
//Copyright Lila Fagen
//Lila.Fagen@gmail.com (ldf)

//final int MAX = 50;

float [] x = {50, 50, 50, 50};
float [] y = {50, 100, 150, 200};
float [] boxSize = {100, 150, 200, 300};
float [] deltaX = {20, 20, 20, 20};
color [] col = {color(100, 200, 30, 100),
              color(40, 70, 200, 50),
              color(60, 80, 150, 200),
              color(200, 200, 70, 50)};


//float [] boxX = {200, 100, 100};
//float [] boxY = {100, 200, 100};
//float [] boxZ = {100, 100, 200};

void setup ( )
{
  size (screen.width, screen.height, P3D);
  noStroke ( );
  smooth ( );
}

void draw ( )
{
  background (30, 10, 100);
  lights ( );
  drawBox ( );
  moveBox ( );
}

void drawBox ( )
{
  for (int i= 0; i<y.length; i++)
  {
    fill(col[i]);
    translate(x[i], y[i], 0);
    rotateY(radians(frameCount*2));
    rotateZ(radians(15));
//    rotateX(radians(20));
    drawShape ( );
    noFill( );
    stroke (col[i]);
    box(boxSize[i]);
  }
}

void drawShape ( )
{
    noStroke ( );
    box (200, 100, 100);
    box (100, 100, 200);
    box (100, 200, 100); 
}

void moveBox ( )
{
  for (int i = 0; i<y.length; i++)
  {
   x[i] += deltaX[i]/2;
   if (x[i] >= width || x[i] <=0)
   {
    x[i] = -x[i]; 
   } else if (y[i] >= height || y[i] <= 0)
   {
    y[i] = -y[i]; 
   }
  }
}





