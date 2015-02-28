
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
float x1speed = 3.4;
float y1speed = 4.9;
float x2speed = 6.5;
float y2speed = 1.0;
float x3speed = 1.3;
float y3speed = 2.4;
void setup()
{
  size (600,600);
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
  background(0);
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
   ellipse(mouseX, mouseY + 40,size/xspeed,size*xspeed);
  if ((xpos < 200)&&(xpos > 0)){
    xspeed = 1 ; //velocidad de este segmento
    fill(0,50,280,100); //color de la figura en este segmento
  }
  if ((xpos < 400)&&(xpos > 200)){
    xspeed = 2.5;
    fill(0,030,250,100);
  }
  if ((xpos > 400)&&(xpos < 600)){
    xspeed = xspeed + 2;
    fill(0,15,150,100);
  }
  ellipse(xpos,mouseY+50,60,mouseY*x1speed/2);
  if ((x1pos < 133)&&(x1pos > 0)){
    x1speed = 0.5;
    fill(0,200,15,100);
  }
  if ((x1pos < 266) && (x1pos > 133)){
    x1speed = x1speed +2;
    fill(10,240,050,100);
  }
  if ((xpos > 266)&&(xpos < 400)){
    x1speed = x1speed +1;
    fill(0,280,10,100);
  }
  rect (mouseX-50,ypos,60,60);
  if ((ypos <=200) && (ypos >=0)) {
    yspeed = 1.5;
    fill(200,100,120,100);
  }
  if ((y1pos <=200) && (y1pos >=0)) {
    y1speed = 2;
    fill(100,120,130,100);
  }
  if ((ypos >= 200) && (ypos <=height)){
    yspeed = 4;
    fill(100,020,200,100);
  }
  if ((y1pos >= 200) && (y1pos <= height)){
    y1speed = 6;
    fill(100,100,050,100);
  }
  triangle(mouseX,mouseY*yspeed,mouseX-30,mouseY*yspeed,(mouseX+200)*x1speed,mouseY+50);
  xspeed = 10; 
  if ((y3pos<=200) && (y3pos>=0)) {
    y3speed= 1;
    fill(200,0,200,100);
  }
  if ((y3pos>= 200) && (y3pos<=height)){
    y3speed= 2.5;
    fill (5,180,180,100); 
  }
  if ((y3pos >= 200) && (y3pos <= height)){
    y3speed = 3.8;
    fill(0,150,150,100);
  }
  if (mousePressed) {

    xspeed = xspeed +10;
    yspeed = yspeed +7;
    x1speed = x1speed +15;
    y1speed = y1speed+7;
    x2speed = y2speed +9;
    y2speed = y2speed +10;
    size = size + 3;
  } 
  else {
    x1speed = x1speed;
    size = size -3;
  }
}




