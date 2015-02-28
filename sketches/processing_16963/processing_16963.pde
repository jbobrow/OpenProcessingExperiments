
float x = 50.0;
float y = 50.0;
float radio = 30.0;
float velocidadX = 8.0;
float velocidadY = 5.0;
int direccionX = 1;
int direccionY =1;


PImage jack;
PImage nightmare;
PImage nightmare1;

float angulo;

void setup (){
size (600,600);
smooth();

noCursor();

jack = loadImage("jack.png");
nightmare = loadImage("nightmare.jpg");
nightmare1 = loadImage("nightmare1.jpg");

}

void draw (){
  background(255);
  imageMode(CORNER);


if (mousePressed == true) {

image(nightmare1,0,0);
  } else {
    image(nightmare,0,0);
  }

imageMode(CENTER);
image(jack,x,y,60,60);
x += velocidadX * direccionX;
  if((x>width-radio) || (x <radio)){
    direccionX = direccionX *-1;
  }
  y+=velocidadY * direccionY;
  if((y>height-radio)|| (y <radio)){
    direccionY = direccionY *-1;
  }



}

