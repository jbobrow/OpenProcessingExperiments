

int x = 10;
int y = 10;
PImage z;

void setup (){
  size (400,400);
  z = loadImage ("caribe.jpg");

}

void draw(){

  image (z,0,0,400,400);

  x =  x + 1;
  if (x > 255)
    x = 255;



  tint (255-x); 

  PFont font;
  font = loadFont("Georgia-10.vlw"); 
  fill (64 , 89,100 + x);
  textFont(font,20); 
  text("BP     vis     GOLFO DE MEXICO",40,240);
}







