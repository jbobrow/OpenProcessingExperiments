
//declaraciÛn de variables eje

int size = 50;
float xpos = 1;
float ypos = 0;
float x1pos = 1;
float y1pos = 0;
float x2pos = 1;
float y2pos = 0;
float x3pos = 1;
float y3pos = 0;

//variables de direcciÛn

int xdirection = 1;
int ydirection = 3;
int x1direction = 1;
int y1direction = 3;
int x2direction = 1;
int y2direction = 3;
int x3direction = 1;
int y3direction = 3;

//variables de velocidad

float xspeed = 3.4;
float yspeed = 1.3;
float x1speed = 6.8;
float y1speed = 2.45;
float x2speed = 13;
float y2speed = 0.5;
float x3speed = 2.6;
float y3speed = 1.2;


void setup()

{

  size (400,400);

  frameRate(24);//web fps

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
  background(020,100,150);
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

  if (ypos >= 400 || ypos < 0){
    ydirection *= -1;
  }

  if (x1pos > width-size || x1pos < 0){
    x1direction*= -1;
  }

  if (y1pos >= 400 || y1pos < 0){
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
  rect(xpos,160,size,size);
  if ((xpos < 71.5)&&(xpos > 0)){
    xspeed = 2; //velocidad de este segmento
    fill(0,0,0,100); //color de la figura en este segmento
  }
  if ((xpos < 266)&&(xpos > 71.5)){
    xspeed = 1.25;
    fill(255,255,255,100);
  }
  if ((xpos > 266)&&(xpos < 200)){
    xspeed = xspeed + 4;
    fill(255,0,0,100);
  }

  ellipse(x1pos,250,70,50);
  if ((x1pos < 133)&&(x1pos > 5)){
    x1speed = 0.25;
    fill(0,255,0,100);
  }
  if ((x1pos < 266) && (x1pos > 133)){
    x1speed = x1speed +4;
    fill(0,0,255,100);
  }
  if ((xpos > 266)&&(xpos < 400)){
    x1speed = x1speed +0.5;
    fill(270,50,213,100);
  }
  triangle(200,ypos,30,y1pos,130,y1pos);
  if ((ypos <=200) && (ypos >=0)) {
    yspeed = 3;
    fill(120,100,200,100);
  }

  if ((y1pos <=200) && (y1pos >=0)) {
    y1speed = 1;
    fill(120,130,75,100);
  }
  if ((ypos >= 200) && (ypos <=height)){

    yspeed = 8;
    fill(100,020,200,50);
  }
  if ((y1pos >= 200) && (y1pos <= height)){
    y1speed = 3;
    fill(100,80,050,100);
  }
  rect (250, y3pos, 60,60);
  if ((y3pos<=200) && (y3pos>=0)) {
    y3speed= 2;
    fill(250,120,255,100);
  }
  if ((y3pos>= 200) && (y3pos<=height)){
    y3speed= 1.25;
    fill (050,100,100,20); 
  }
  if ((y3pos >= 200) && (y3pos <= height)){
    y3speed = 7.6;
    fill(100,200,150,100);
  }

}


