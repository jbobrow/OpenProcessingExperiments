
void setup(){ //para imagens não estáticas
  
  size(500, 500); // define o tamanho da janela
  background(255); // define a cor de fundo da janela
  smooth(); // suaviza o desenho
  frameRate(5); // muda para 5 frames por segundo, em vez de 30 normais
  noStroke(); //  serve para a imagem não ter contorno
  
}

void draw(){ // definições do desenho

// primeira layer, como fundo da imagem
 
 float posX1 = random(0,500); // posição variável de X dos círculos
 float posY1 = random(0,500); // posição variável de Y dos círculos
 float diam = random (0, 100); // diâmetro variável dos círculos
 float r = random (0, 255); // cor variável de vermelhos
 float g = random (0, 255); // cor variável de verdes
 float b = random (0, 255); // cor variável de azuis
 
 fill(r, g, b); // cor de preenchimento dos círculos
 ellipse(posX1, posY1, diam, diam); // desenho dos círculos: posição X, posição Y, diâmetro, diâmetro
 
 // segunda layer, círculo no centro da imagem
 
 fill(0, 0, 0); //preenchimento a preto do círculo
 ellipse(width/2, height/2, 300, 300); // posição X e Y divididas por 2, para que o círculo fique no centro da imagem, e diâmetro de 300
 
 // terceira layer, triângulo dentro da segunda layer
 
 fill(255); // preenchimento a branco do triângulo
 triangle(255, 150, 175, 330, 330, 330); // desenho do triângulo: posição X1, Y1 (posições para um vértice), X2, Y2 (posições para o segundo vértice), X3 e Y3 (posições do terceiro vértice)

 //saveFrame("briefing1_2.jpg"); // serve para guardar a imagem feita 
 
// utilização de filtros na imagem

//smooth(); //suaviza o desenho
//noLoop(); // não faz repetições

//PImage img; // img é a imagem que queremos utilizar

//img = loadImage("briefing1_2.jpg"); // utiliza-se para fazer o load da imagem para o processing

//image(img, 0, 0); // espaço onde a imagem está colocada

//tint(255,0,0,80); // utilização do filtro tint, com a cor vermelha
//img.resize(250, 0); // resize da imagem
//image(img, 0, 0); // espaço onde a imagem vai ficar colocada

//tint(0, 0, 255, 80); // utilizaçõ de um filtro azul
//img.resize(250, 0); // define o tamanho da imagem
//image(img, 250, height/2); // define o espaço onde a imagem vai ficar colocada

} 
