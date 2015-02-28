
float lineaY=0;
float posX;
float posY;
float velX;
float velY;


int diametro=10;

void setup() {

  size (400,400);
  posX=width/2;
  posY=height/2;
  velX=1.5;
  velY=2;
}

void draw() {

  background(0);
 
 
  smooth();
  stroke(255);
  strokeWeight(10);
  line (0,lineaY,width,lineaY);
  lineaY=lineaY%height;
  lineaY=lineaY+2;


  if(posX <= 0 || posX >=width)
  {
    velX=-velX;
  }

  if(posY <= 0 || posY >=height)
  {
    velY=-velY;
  }

  ellipse(posX,posY,diametro,diametro);

  posX=posX+velX;
  posY=posY+velY;



}



