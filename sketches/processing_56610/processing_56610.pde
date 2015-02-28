
/* pinta una linea controlada per les tecles del cursor.
 permet pulsant la 1 fer linees fines i pulsant els 2 linees
 de tamany 5*/

int tecla;
int u;
int d;
int posX;
int posY;
//la variable "figura" 1=point; 2=rodona de radi 5 ;
int figura;
void setup()
{
  figura=1;
  posX=200;
  posY=200;
  u=0;
  d=0;

  size (400, 400);
  background(255);
  fill(120, 75, 99);
  stroke(0);
}
/* asigna el valor a figura per dibuixar punts o rodones
 en funcio de si pulsem 1 o 2*/

void keyPressed() {
  if (key=='1' || key=='2')
  {
    if (key=='1')
    {
      figura=1;
    }
    else
    {
      figura=2;
    }
  }
  
}

void draw()
//interroga les tecles del cursor
{
  //controla la tecla de UP

  if (keyCode==UP)
  {
    d=-1;
    u=0;
    posX=posX+u;
    posY=posY+d;
    if (figura==1)
    {
      ellipse(posX, posY, 5, 5);
    }
    point(posX, posY);
  }
  //controla la tecla DOWN
  if (keyCode==DOWN)
  {
    d=1;
    u=0;
    posX=posX+u;
    posY=posY+d;
    if (figura==1)
    {
      ellipse(posX, posY, 5, 5);
    }
    point(posX, posY);
  }
  //controla la tecla LEFT
  if (keyCode==LEFT)
  {
    d=0;
    u=-1;
    posX=posX+u;
    posY=posY+d;
    if (figura==1)
    {
      ellipse(posX, posY, 5, 5);
    }
    point(posX, posY);
  }
  //controla la tecla RIGHT
  if (keyCode==RIGHT)
  {
    d=0;
    u=1;
    posX=posX+u;
    posY=posY+d;
    if (figura==1)
    {
      ellipse(posX, posY, 5, 5);
    }
    point(posX, posY);
  }
}

