

/* @pjs preload="stars.jpg";
@pjs preload="nau.png";
 */



PImage img;
PImage img2;
PImage met;
float pX = 200;
float pY = 140;
float vX = random(+5, 5);
float vY = random(+5, 5);
int tam = 10;


void setup() {
 size(200,350); 
noCursor();
  img = loadImage("stars.jpg");
  img2 = loadImage("nau.png");
 
}
void draw() {
 fons();
 tot();
 
 
}
 
void  fons(){
  image(img, 0, 0);//imatge fons//
 
   image(img2,mouseX-45,mouseY-20);//la nau segueix el mouse//
  //image(met, pX, pY, vX, vY);
}


void tot(){
pX = pX + vX;
  pY = pY + vY;

  if ((pX >= width)|| (pX < 0)) { 
    vX = -vX;
  } 
  if ((pY >= height)|| (pY < 0)) { 
    vY = -vY;
  } 

  ellipse(pX, pY, tam, tam);

 

}

void mousePressed() {
  vX = random(vX+4);
  vY = random(vY-4);
  
  pX =100;//posició d'on torna a sortir la o//
  pY = 345;//posició d'on torna a sortir la o//
    
}




