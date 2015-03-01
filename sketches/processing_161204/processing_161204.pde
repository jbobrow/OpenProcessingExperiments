
//Ellpses moving
//By Tifaine LERN

// VARIABLES

// Déplacements en diagonale
int positionX = 100;
float positionY = 100;

int positionX_1 = 400;
float positionY_1 = 400;

// Déplacements horizontaux
int horizontalX = 200;

int horizontalX_1 = 300;

//Changement de taille
int tailleX = 100;
int tailleY = 100;

// FOND

void setup() {
  
  size(500,500);
  
  noStroke();
  //noLoop();

}


// FORME

void draw() {
  
  background(0);

  fill(20,200);
  ellipse(positionX,positionY,100,100);
  
  fill(50,200);
  ellipse(150,150,tailleX,tailleY);
  
  fill(80,200);
  ellipse(horizontalX,200,100,100);
  
  fill(100,200);
  ellipse(250,250,100,100);
  
  fill(150,200);
  ellipse(horizontalX_1,300,100,100);
  
  fill(200,200);
  ellipse(350,350,tailleX,tailleY);
  
  fill(255,200);
  ellipse(positionX_1,positionY_1,100,100);

  // Déplacements en diagonale (bis)
  positionX = positionX + 1 ;
  positionY = positionY + 1 ;
  
  positionX_1 = positionX_1 - 1 ;
  positionY_1 = positionY_1 - 1 ;
  
  // Déplacements horizontaux (bis)
  horizontalX = horizontalX + 1 ;
  
  horizontalX_1 = horizontalX_1 - 1 ;
  
  //Changement de taille (bis)
  tailleX = tailleX + 1 ;
  tailleY = tailleY + 1 ;

}


