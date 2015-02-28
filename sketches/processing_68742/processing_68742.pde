

PImage img; //declara uma variavel do tipo PImage. ela pode armazenar uma area de pixel (imagem)
PImage img2;
float valor,valor2;

void setup () {
size (500,500);
background (255);
img=loadImage ("fada.png");
img2=loadImage ("asa.png");
 image(img,50,200);
frameRate (10);
}

void draw () {
valor=random(500);
valor2=random (500);
  tint(random(255),random(500), random(500), 20);

    image(img2,random(width),random(height),valor,valor2);

  

}


