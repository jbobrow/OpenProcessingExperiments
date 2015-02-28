
//cambio de direccion

float x= 80.0;
float y= 70.0;
float radio= 30.0;
float velocidadX= 9.0;
float velocidadY= 6.0;
int direccionX=5;
int direccionY=-4;

void setup(){
  size(800,800);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
}

void draw (){
  fill (255,4);
  rect(0,0,width, height);
  fill (73,22,245);
  ellipse (x,y,radio,radio);
  x += velocidadX * direccionX;
  if ((x>width+radio)||(x<radio)){
    direccionX = direccionX * -1;
  }
  y +=velocidadY * direccionY;
  if ((y>width-radio)||(y <radio)){
    direccionY = direccionY *-1;
  }
}  

