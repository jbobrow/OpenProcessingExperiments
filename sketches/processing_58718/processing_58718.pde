
void setup(){ //para imagens não estáticas
  
  size(500, 500); // define o tamanho da janela
  background(255); // define a cor de fundo da janela
  smooth(); // suaviza o desenho
  frameRate(11); // mudanumero de frames por segundo
  stroke(2); //  imagem não ter contorno
  
}

void draw(){ // definições do desenho

// primeira layer, fundo da imagem
 
 float posX1 = random(0,500); // posição variável de X dos circulos
 float posY1 = random(0,500); // posição variável de Y dos circulos
 float diam = random (0, 100); // diâmetro variável dos círculos
 float r = random (0, 255); // cor variável de vermelho
 float g = random (0, 255); // cor variável de verde
 float b = random (0, 255); // cor variável de azul
 
 fill(r, g, b); // cor de preenchimento dos círculos
 ellipse(posX1, posY1, diam, diam); // desenho dos círculos: posição X, posição Y, diâmetro, diâmetro
 
 // segunda layer, círculo no centro da imagem
 

 
  fill(255,255,255,90 ); // preenchimento
 ellipse(width/2, height/2, 300, 300);  // desenho rectangulo  
     
 // terceira layer, circulo dentro do circulo
 
 fill(205); // preenchimento 
 ellipse(width/2, height/2, 200, 200);  // desenho docirculo
}
