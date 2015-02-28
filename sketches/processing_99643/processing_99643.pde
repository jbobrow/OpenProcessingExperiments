
//declaraciÛn de variables eje

int size = 30;
float xpos = 0;
float ypos = 0;
float x1pos = 0;
float y1pos = 0;
float x2pos = 0;
float y2pos = 0;
float x3pos = 0;
float y3pos = 0;
int x,y;
int x1, y1;

//variables de direcciÛn

int xdirection = 1;
int ydirection = 1;
int x1direction = 1;
int y1direction = 1;
int x2direction = 1;
int y2direction = 1;
int x3direction = 1;
int y3direction = 1;

//variables de velocidad

float xspeed = 1.7;
float yspeed = 2.6;
float x1speed = 3.4;
float y1speed = 4.9;
float x2speed = 6.5;
float y2speed = 1.0;
float x3speed = 1.3;
float y3speed = 2.4;


void setup()

{
  background(230);
  size (400,400);

  frameRate(30);//web fps

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
  x1=mouseX;
  y1=mouseY;
  //background(0,100,150);
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
//  rect(xpos,40,mouseX-size,mouseY-size);
//  if ((xpos < 133)&&(xpos > 0)){
//    xspeed = 1; //velocidad de este segmento
//    fill(x1,y1,0); //color de la figura en este segmento
//  }
//  if ((xpos < 266)&&(xpos > 133)){
//    xspeed = 2.5;
//    fill(255-x1,255-y1,255);
//  }
//  if ((xpos > 266)&&(xpos < 400)){
//    xspeed = xspeed + 2;
//    fill(x1,y1,250,100);
//  }

  ellipse(x1pos,150,200-mouseX-4,200-mouseY-4);
  if ((x1pos < 13)&&(x1pos > 0)){
    x1speed = 2.5;
    fill(250,100,157,100);
  }
  if ((x1pos < 26) && (x1pos > 13)){
    x1speed = x1speed +2;
    fill(0,070,050,100);
  }
  if ((xpos > 26)&&(xpos < 40)){
    x1speed = x1speed +1;
    fill(280,0,100,100);
  }
  triangle(100,ypos,60,y1pos,130,y1pos);
  if ((ypos <=20) && (ypos >=0)) {
    yspeed = 1.5;
    fill(255-x1,255-y1,120,100);
  }
  if ((y1pos <=20) && (y1pos >=0)) {
    y1speed = 2;
    fill(100,120,130,100);
  }
  if ((ypos >= 50) && (ypos <=height)){

    yspeed = 2.5;
    fill(100,020,200,100);
  }
  if ((y1pos >= 50) && (y1pos <= height)){
    y1speed = 6;
    fill(100,100,050,100);
  }
//  rect (250, y3pos, 100,100);
//  if ((y3pos<=200) && (y3pos>=0)) {
//        y3speed= 1;
//    fill(250,120,100,100);
//  }
//  if ((y3pos>= 200) && (y3pos<=height)){
//    y3speed= 2.5;
//    fill (050,100,100,100); 
//  }
//  if ((y3pos >= 200) && (y3pos <= height)){
//    y3speed = 3.8;
//    fill(100,200,150,100);
//  }

//   fill(255);
// if( mouseX > 100 )
// {
// rect
// ( 50 , 50 , 100 , 100 );
// }
// fill(255,255,0,150);
// rect(100,0,100,200);
 }
  


