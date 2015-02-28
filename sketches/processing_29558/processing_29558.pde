
// Rodrigo Ortega (based on Daniel Shiffman)

int maxImages = 2; // numero de imagens
int imageIndex = 0; // imagem a iniciar é a primeira

// array de imagens
PImage[] images = new PImage[maxImages]; 

void setup() {
  size(900,592);
  
  // carregando as imagens no array
  for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage( "barroco" + i + ".jpg" ); 
  }
}

void draw() {
  // mostrando uma imagem
  image(images[imageIndex],0,0); 
}

void mousePressed() {
  // incremente o indice de imagens uma por vez a cada ciclo
  // use modulo " % "para retornar a 0 assim que chegar ao final do array
  imageIndex = (imageIndex + 1) % images.length;
}




