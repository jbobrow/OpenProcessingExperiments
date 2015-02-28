
//declaraciÛn de variables eje

int size = 50;
float xpos = 2;
float ypos = 0;
float x1pos = 2;
float y1pos = 0;
float x2pos = 2;
float y2pos = 0;
float x3pos = 2;
float y3pos = 0;

//variables de direcciÛn

int xdirection = 2;
int ydirection = 2;
int x1direction = 2;
int y1direction = 2;
int x2direction = 2;
int y2direction = 2;
int x3direction = 2;
int y3direction = 2;

//variables de velocidad

float xspeed = 5.8;
float yspeed = 2.7;
float x1speed = 3.5;
float y1speed = 5.0;
float x2speed = 6.6;
float y2speed = 1.1;
float x3speed = 1.4;
float y3speed = 2.5;


void setup()

{

  size (500,500);

  frameRate(80);//web fps

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
  background(010,150,250);
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

  if (ypos >= 600 || ypos < 0){
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
    x3direction *= 1;
  }
  if (y3pos >  height-size || y3pos < 0){
    y3direction *= -1;
  }

  //figuras
  rect(xpos,90,size,size);
  if ((xpos < 133)&&(xpos > 0)){
    xspeed = 2; //velocidad de este segmento
    fill(120,100,250,100); //color de la figura en este segmento
  }
  if ((xpos < 266)&&(xpos > 130)){
    xspeed = 2;
    fill(200,020,100,100);
  }
  if ((xpos > 266)&&(xpos < 400)){
    xspeed = xspeed + 3;
    fill(120,250,120,100);
  }

  ellipse(x1pos,220,60,60);
  if ((x1pos < 133)&&(x1pos > 0)){
    x1speed = 0.9;
    fill(250,250,100,100);
  }
  if ((x1pos < 266) && (x1pos > 130)){
    x1speed = x1speed +2;
    fill(0,90,100,100);
  }
  if ((xpos > 266)&&(xpos < 400)){
    x1speed = x1speed +5;
    fill(250,0,120,100);
  }
  triangle(100,ypos,60,y1pos,130,y1pos);
  if ((ypos <=200) && (ypos >=0)) {
    yspeed = 1.8;
    fill(200,100,120,100);
  }

  if ((y1pos <=200) && (y1pos >=0)) {
    y1speed = 2;
    fill(120,120,100,100);
  }
  if ((ypos >= 200) && (ypos <=height)){

    yspeed = 4;
    fill(100,020,200,100);
  }
  if ((y1pos >= 200) && (y1pos <= height)){
    y1speed = 6;
    fill(100,100,050,100);
  }
  
    triangle(300,ypos,180,y1pos,330,y1pos);
  if ((ypos <=400) && (ypos >=200)) {
    yspeed = 1.8;
    fill(200,100,120,100);
  }

  if ((y1pos <=200) && (y1pos >=0)) {
    y1speed = 2;
    fill(120,120,100,100);
  }
  if ((ypos >= 200) && (ypos <=height)){

    yspeed = 4;
    fill(100,020,200,100);
  }
  if ((y1pos >= 200) && (y1pos <= height)){
    y1speed = 6;
    fill(100,100,050,100);
  }
    ellipse(y1pos,300,10,10);
  if ((y1pos < 133)&&(y1pos > 0)){
    y1speed = 10;
    fill(250,250,100,100);
  }
  if ((y1pos < 266) && (y1pos > 130)){
    y1speed = y1speed +2;
    fill(0,90,100,100);
  }
  if ((ypos > 266)&&(ypos < 400)){
    y1speed = y1speed +5;
    fill(250,0,120,100);
  }
  rect (250, y3pos, 60,60);
  if ((y3pos<=200) && (y3pos>=0)) {
    y3speed= 1;
    fill(250,120,100,100);
  }
  if ((y3pos>= 200) && (y3pos<=height)){
    y3speed= 2.5;
    fill (050,100,100,100); 
  }
  if ((y3pos >= 200) && (y3pos <= height)){
    y3speed = 3.8;
    fill(100,200,150,100);
  }

}


