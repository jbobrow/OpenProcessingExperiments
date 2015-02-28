
//declaraciÛn de variables eje
int size = 30;
float xpos = 200;//elipse
float ypos = 0;
float x1pos = 200;
float y1pos = 0;

//variables de direcciÛn
int xdirection = 1;
int ydirection = 1;
int x1direction = 1;
int y1direction = 1;

//variables de velocidad
float xspeed = 1.7;
float yspeed = 2.6;
float x1speed = 3.4;
float y1speed = 4.9;


float radio=60;
int op=1;


void setup()
{
  size (800,400);
  frameRate(27);//web fps

  //posiciÛn inicial de las variables
  //xpos = mouseX;
  //ypos = mouseY;
  x1pos = x1pos;
  y1pos = y1pos;

}
void draw()
{
  background(020,100,150);
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );  
  x1pos = x1pos +( x1speed * x1direction );
  y1pos = y1pos + ( y1speed * y1direction );

  //condicionales de regreso
  if (xpos > 800-radio/2 || xpos < 0+radio/2 )
    {
      xdirection *= -1;
    }
  if (ypos > 400 || ypos < 0)
    {
      ydirection *= -1;
    }
  if (x1pos > 800 || x1pos < 0)
    {
      x1direction*= -1;
    }
  if (y1pos > 400 || y1pos < 0)
    {
      y1direction *= -1;
    }

  //figuras
  rect(mouseX-size/2 ,mouseY-size/2,size,size);
  if ((xpos < 400)&&(xpos > 0))
    {
      xspeed = 10 ; //velocidad de este segmento
      fill(0,0,0,100); //color de la figura en este segmento
    }
  
  ellipse(xpos,200,radio,radio);
  if ((x1pos < 133)&&(x1pos > 0))
    {
      x1speed = 0.5;
      fill(250,100,150,100);
    }
  if ((x1pos < 266) && (x1pos > 133))
    {
      x1speed = x1speed +2;
      fill(0,070,050,100);
    }
  if ((xpos > 266)&&(xpos < 400))
    {
      x1speed = x1speed +1;
      fill(280,0,100,100);
    }
 
  
  if (mousePressed) 
    {
  
      xspeed = xspeed +10;
      yspeed = yspeed +7;
      x1speed = x1speed+20;
      y1speed = y1speed+20;
      
      size=50;
      radio=random(2, 80);
      
      //background(random(0, 250),random(0, 250),random(0, 250));
      
     ellipse(xpos,200,60,60);
      if ((xpos < 800)&&(xpos > 0))
      {
        
        fill(random(0, 250),random(0, 250),random(0, 250),100); //color de la figura en este segmento
      }
      
    } 
  else
    {
      x1speed = x1speed;
      if(size<=100 && size >=5 && op==1)
        {
        size = size + 5;
          if(size==100)
          {
            op=2;
          }
        }
       if(size<=100 && size >=5 && op==2)
        {
        size = size - 5;
          if(size==5)
          {
            op=1;
          }
        }
     
    }
}




