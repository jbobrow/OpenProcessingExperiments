
void setup(){ // construção da imagem de fundo
 
 size(500,500); // definir tamanho da janela
 background(245, 240, 190); // cor de fundo da janela
 smooth(); // suavizar a imagem
 //noLoop(); // serve para repetir apenas 1 vez
 frameRate(4); // apenas 4 frames por segundo
}

void draw(){ // setup do desenho
 for( int i = 0; i < 700; i++){ // formação da variável
    
    stroke(i); // variável, em que até 700, as bolas vão ter stroke
  
  float posX = random (0, 500); // define a posição X, qe vai ser numa posição random na janela toda
  float posY = random (0, 500); // define a posição Y, qe vai ser numa posição random na janela toda
  float diametro = random (0, 100); // o diâmetro das bolas é random até 100
  float r = random (0, 255); // random das cores vermelhas
  float g = random (0, 255); // random das cores verdes
  float b = random (0, 255); // random das cores azuis
  
 fill(r, g, b, 80); // cor de preenchimento das elipses, e tem 80 de transparência
 ellipse(posX, posY, diametro, diametro); // elipse
 
  }
  
  //saveFrame("briefing1.jpg") // serve para guardar a imagem feita
  
}  

