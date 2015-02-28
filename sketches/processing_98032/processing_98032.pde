
//declaraciÛn de variables eje

int size = 50;
float xpos = 0;
float ypos = 0;
float x1pos = 0;
float y1pos = 0;
float x2pos = 0;
float y2pos = 0;
float x3pos = 0;
float y3pos = 0;

//variables de direcciÛn

int xdirection = -1;
int ydirection = 1;
int x1direction = -1;
int y1direction = 1;
int x2direction = -1;
int y2direction = 1;
int x3direction = -1;
int y3direction = 1;

//variables de velocidad

float xspeed = 3;
float yspeed = 2;
float x1speed = 4;
float y1speed = 5;
float x2speed = 3;
float y2speed = 0.1;
float x3speed = 1;
float y3speed = 2;


void setup()

{

  size (400,400);

  frameRate(60);//web fps

  //posiciÛn inicial de las variables

  xpos = xpos;
  ypos = ypos;
  x1pos = x1pos;
  y1pos = y1pos;
  x2pos = x2pos;
  y2pos = y2pos;
  x3pos = x3pos;
  y3pos = y3pos;
}
void draw()
{
  background(251,232,196);
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );  
  x1pos = x1pos +( x1speed * x1direction );
  y1pos = y1pos + ( y1speed * y1direction );
  x2pos = x2pos + ( x2speed * x2direction );
  y2pos = y2pos + ( y2speed * y2direction );
  x3pos = x3pos + ( x3speed * x3direction );
  y3pos = y3pos + ( y3speed * ydirection );
  //condicionales de regreso

  if (xpos > width-size || xpos < 0){
    xdirection *= -1;
  }

  if (ypos >= 10 || ypos < 0){
    ydirection *= -1;
  }

  if (x1pos > width-size || x1pos < 0){
    x1direction*= -1;
  }

  if (y1pos >= 200 || y1pos < 0){
    y1direction *= -1;
  }
  if (x2pos > width-size || x2pos < 0){
    x2direction *= -1;
  }

  if (y2pos > height-size || y2pos < 0){
    y2direction *= -1;   
  }
  if (x3pos > width-size || x3pos < 0){
    x3direction *= -1;
  }
  if (y3pos >  height-size || y3pos < 0){
    y3direction *= -1;
  }

  //figuras
  rect(xpos,80,size,size);
  if ((xpos < 30)&&(xpos > 40)){
    xspeed = 0.2; //velocidad de este segmento
    fill(04,82,255,80); //color de la figura en este segmento
  }
  if ((xpos < 40)&&(xpos >45)){
    xspeed = 0.5;
    fill(181,19,91,20);
    fill( random(255), random(255), random(255), random(255)); 
    if ((xpos<42)&&(xpos>44)){
      fill(241,119,7,100);
      fill( random(255), random(255), random(255), random(255)); 
    }
  }
  if ((xpos > 50)&&(xpos < 100)){
    xspeed = xspeed + 2;
    fill(120,250,250,30);
    fill( random(255), random(255), random(255), random(255)); 
  }

  ellipse(x1pos,220,60,60);
  if ((x1pos < 30)&&(x1pos > 40)){
    x1speed = 0.8;
    fill(165,0,86,50);
    fill( random(255), random(255), random(255), random(255)); 
  }
  if ((x1pos < 40) && (x1pos > 50)){
    x1speed = 0.5;
    fill(92,43,198,100);
    fill( random(255), random(255), random(255), random(255)); 
  }
  if ((xpos > 50)&&(xpos <100)){
    x1speed = x1speed +1;
    fill(280,0,100,100);
    fill( random(255), random(255), random(255), random(255)); 
  }
  

}


