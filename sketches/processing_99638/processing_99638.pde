
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
float xspeed = 3.4;
float yspeed = 2.6;
float x1speed = 6.8;
float y1speed = 8;
float x2speed = 6.5;
float y2speed = 1.0;
float x3speed = 2.6;
float y3speed = 2.4;
void setup()
{
  size (400,400);
  frameRate(12);//web fps
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
  if (xpos > 395 || xpos < 0){
    xdirection *= -1;
  }
  if (ypos >= 400 || ypos < 0){
    ydirection *= -1;
  }
  if (x1pos > 400 || x1pos < 0){
    x1direction*= -1;
  }
  if (y1pos >= 400 || y1pos < 0){
    y1direction *= -1;
  }
  if (x2pos > 400 || x2pos < 0){
    x2direction *= -1;
  }
  if (y2pos > 400 || y2pos < 0){
    y2direction *= -1;   
  }
  if (x3pos > 400 || x3pos < 0){
    x3direction *= -1;
  }
  if (y3pos >  400 || y3pos < 0){
    y3direction *= -1;
  }
  //figuras
  rect(mouseX + 40,mouseY,size,size);
  if ((xpos < 133)&&(xpos > 0)){
    xspeed = 5 ; //velocidad de este segmento
    fill(280,130,120,100); //color de la figura en este segmento
  }
  if ((xpos < 250)&&(xpos > 130)){
    xspeed = 5;
    fill(200,030,0,100);
  }
  if ((xpos > 250)&&(xpos < 400)){
    xspeed = xspeed + 1;
    fill(250,250,120,100);
  }
  ellipse(xpos,mouseY+50,60,60);
  if ((x1pos < 133)&&(x1pos > 0)){
    x1speed = 1;
    fill(150,100,250,100);
  }
  if ((x1pos < 266) && (x1pos > 133)){
    x1speed = x1speed +1;
    fill(050,070,0,100);
  }
  if ((xpos > 266)&&(xpos < 400)){
    x1speed = x1speed +2;
    fill(100,0,280,100);
  }
  triangle(xpos,ypos,xpos-30,ypos-30,mouseX+200,ypos+50);
  if ((ypos <=200) && (ypos >=0)) {
    yspeed = 0.75;
    fill(120,100,200,100);
  }
  if ((y1pos <=200) && (y1pos >=0)) {
    y1speed = 1;
    fill(130,120,100,100);
  }
  if ((ypos >= 200) && (ypos <=height)){
    yspeed = 8;
    fill(200,020,100,100);
  }
  if ((y1pos >= 200) && (y1pos <= height)){
    y1speed = 3;
    fill(50,100,100,100);
  }
  rect (mouseX-50,ypos,60,60);
  xspeed = 20; 
  if ((y3pos<=200) && (y3pos>=0)) {
    y3speed= 1;
    fill(100,120,250,100);
  }
  if ((y3pos>= 200) && (y3pos<=height)){
    y3speed= 1.25;
    fill (100,100,050,100); 
  }
  if ((y3pos >= 200) && (y3pos <= height)){
    y3speed = 7.6;
    fill(150,200,100,100);
  }
  if (mousePressed) {

    xspeed = xspeed +5;
    yspeed = yspeed +14;
    x1speed = x1speed +7.5;
    y1speed = y1speed+14;
    x2speed = y2speed +4.5;
    y2speed = y2speed +20;
   size = size-1;
   fill(250,250,250,100);
  } 
  else {
    x1speed = x1speed;
    fill(0,0,100);
  
  }
}




