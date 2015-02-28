
float x = 50;
float y = 50;
float radio = 15.0;
float velocidadX = 4.0;
float velocidadY = 4.0;
int direccionX = 1;
int direccionY =1;

void setup(){
background(0);
  
  size(600, 400);
  smooth();
  noStroke();
  rectMode(CENTER);
}

void draw(){
    // fill(0,5);
//  rect(0,0, width, height);
  //fill(0, 150);
 // rect (0 ,0, width, height);
  fill(random(23,55),random(223,235),random(13,55),100);
  rect(x, y, radio, radio-10);
  
  x -= velocidadX * direccionX;
  if((x>width-radio) || (x <radio)){
    direccionX = direccionX *-1;
  }
  y+=velocidadY * direccionY;
  if((y>height-radio)|| (y <radio)){
    direccionY = direccionY *-1;
  }
}

