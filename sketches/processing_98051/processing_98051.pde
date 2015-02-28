
int size = 30;
float xpos = 0;
float ypos = 0;
float x1pos = 0;
float y1pos = 0;
float x2pos = 0;
float y2pos = 0;
float x3pos = 0;
float y3pos = 0;



int xdirection = 1;
int ydirection = 1;
int x1direction = 1;
int y1direction = 1;
int x2direction = 1;
int y2direction = 1;
int x3direction = 1;
int y3direction = 1;



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

  size (400,1000);

  frameRate(300);//web fps

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
  background(020,200,150);
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );  
  x1pos = x1pos +( x1speed * x1direction );
  y1pos = y1pos + ( y1speed * y1direction );
  x2pos = x2pos + ( x2speed * x2direction );
  y2pos = y2pos + ( y2speed * y2direction );
  x3pos = x3pos + ( x3speed * x3direction );
  y3pos = y3pos + ( y3speed * ydirection );


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


  rect(xpos,mouseY,size,size);
  if ((xpos < 133)&&(xpos > 0)){
    xspeed = 1; //velocidad de este segmento
    fill(120,130,130,100); 
  }
  if ((xpos < 266)&&(xpos > 133)){
    xspeed = 2.5;
    fill(0,030,200,100);
  }
  if ((xpos > 266)&&(xpos < 1000)){
    xspeed = xspeed + 2;
    fill(120,250,250,100);
  }

  ellipse(mouseX,mouseY,60,60);
  if ((x1pos < 133)&&(x1pos > 0)){
    x1speed = 0.5;
    fill(250,100,150,100);
  }
  if ((x1pos < 266) && (x1pos > 133)){
    x1speed = x1speed +2;
    fill(0,070,050,100);
  }
  if ((xpos > 266)&&(xpos < 400)){
    x1speed = x1speed +1;
    fill(280,0,100,100);
  }
  triangle(mouseX,ypos,60,y1pos,130,y1pos);
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
  rect (mouseX, y3pos, 60,60);
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


