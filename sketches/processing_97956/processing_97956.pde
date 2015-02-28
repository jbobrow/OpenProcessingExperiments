
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
float xspeed = 1.7;
float yspeed = 2.6;
float x1speed = 4;
float y1speed = 3;
float x2speed = 6.5;
float y2speed = 1.0;
float x3speed = 1.3;
float y3speed = 1;
void setup()
{
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
  rect(xpos,mouseY,50,50,20);//rectangulo bordes redondeados
  if ((xpos < 200)&&(xpos > 0)){
    xspeed = 1.5; //velocidad de este segmento
    fill(0,255,0,0); //color de la figura en este segmento
  }
  if ((xpos < 300)&&(xpos > 0)){
    xspeed = 1;
    fill(0,0,0,100);
  }
  if ((xpos > 266)&&(xpos < 400)){
    xspeed =1.5;
    fill(200,0,0,0);
  }

  rect(mouseX,80,30,10);//rectangulo
  if ((xpos < 133)&&(xpos > 0)){
    xspeed = 10 ; //velocidad de este segmento
    fill(0,150,200,100); //color de la figura en este segmento
  }
  if ((xpos < 266)&&(xpos > 133)){
    xspeed = 2.5;
    fill(0,0,200,100);
  }
  if ((xpos > 266)&&(xpos < 400)){
    xspeed = xspeed + 2;
    fill(100,0,50,100);
  }
  ellipse(mouseX-100,300,80,30);
  if ((x1pos < 133)&&(x1pos > 0)){
    x1speed = 0.5;
    fill(100,100,200,100);
  }
  if ((x1pos < 266) && (x1pos > 133)){
    x1speed = x1speed +2;
    fill(0,0,0,100);
  }
  if ((xpos > 266)&&(xpos < 400)){
    x1speed = x1speed +1;
    fill(200,0,0,100);
  }
  ellipse(x1pos,y2pos,50,50);//circulo
  if ((x1pos < 133)&&(x1pos > 0)){
    x1speed = 2;
    fill(100,100,200,100);
  }
  if ((x1pos < 266) && (x1pos > 133)){
    x1speed = 1;
    fill(0,0,0,100);
  }
  if ((y2pos < 266) && (y2pos > 133)){
    x1speed = 1;
    fill(0,0,0,100);
  }
  if ((xpos > 266)&&(xpos < 400)){
    x1speed = 1;
    fill(200,0,0,100);
  }
  ellipse(80,mouseY,size,30);//circulo cambiante
  if ((x2pos < 100)&&(x2pos > 0)){
    x1speed = 1;
    fill(0,100,200,100);
  }
  if ((x2pos < 300) && (x2pos > 100)){
    x1speed = x1speed +5;
    fill(0,100,0,100);
  }
  if ((xpos > 300)&&(xpos < 400)){
    x1speed = x1speed +3;
    fill(100,0,50,100);
  }
  triangle(xpos,ypos,xpos-30,ypos-30,mouseX+10,ypos+2);
  if ((ypos <=200) && (ypos >=0)) {
    yspeed = 1.5;
    fill(0,100,200,100);
  }
  if ((y1pos <=200) && (y1pos >=0)) {
    y1speed = 2;
    fill(100,110,100,0);
  }
  if ((ypos >= 200) && (ypos <=height)){
    yspeed = 4;
    fill(100,0,0,100);
  }
  if ((y1pos >= 200) && (y1pos <= height)){
    y1speed = 6;
    fill(100,100,0,100);
  }
  rect (mouseX-50,ypos,60,60);//cuadrado
  xspeed = 10; 
  if ((ypos<=200) && (ypos>=0)) {
    y3speed= 1;
    fill(0,0,100,100);
  }
  if ((ypos>= 200) && (ypos<=height)){
    y3speed= 2.5;
    fill (100,100,100,100); 
  }
  if ((ypos >= 200) && (ypos <= height)){
    y3speed = 3.8;
    fill(100,100,0,100);
  }
   if (mousePressed) {

   x1speed = x1speed;
    size = size -1; 
}
  else {
      
    xspeed =10;
    yspeed = yspeed +5;
    x1speed =5;
    y1speed = y1speed+3;
    x2speed = y2speed +2;
    y2speed = 1;
    size = size + 1;
  }
}
