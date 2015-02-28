
void setup(){

size(600,800); // tamanho da janela
background(0); // cor de fundo
smooth(); // suaviza o desenho
frameRate(11); // muda para 11 frames por segundo, em vez de 30 normais
stroke(2); // espessura da linha de contorno
  

}

void draw(){ 

// primeira layer, como fundo da imagem
 
 float posX1 = random(0,800); // posição variável de X dos círculos
 float posY1 = random(0,800); // posição variável de Y dos círculos
 float diam = random (0, 100); // diâmetro variável dos círculos
 float r = random (25,100); // cor variável de vermelhos
 float g = random (25,100); // cor variável de verdes
 float b = random (25,100); // cor variável de azuis
 
 fill(r, g, b); // cor de preenchimento dos círculos
 ellipse(posX1, posY1, diam, diam); // desenho dos círculos: posição X, posição Y, diâmetro, diâmetro
 
 
 stroke(185,75,69); // cor da espessura da linha
 strokeWeight(35); // espessura do stroke
 fill(253,253,253); // cor da 1ª ellipse
 ellipse(300,400,300,300); // caracteristicas da 1º ellipse
 noStroke(); // sem espessura
 fill(227,6,19); // cor da 2ª ellipse
 ellipse (300,400,75,75); // caracteristicas da 2ª ellipse


}
