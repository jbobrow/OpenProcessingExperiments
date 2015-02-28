
/*
"ACROSS THE SKY..."

Criação de uma Ilustração Figurativa Generativa - 2D
Tecnica de composição - Imagem Estática

- Criação de primitivas 2D simples
- Geração de imagens
- Geração de texto
*/

PImage sky;//definir a variável para carregar a imagem
PFont font;//definir a fonte no sistema/variável para carregar o tipo de letra

//início da função setup
//definir propriedades gerais do ambiente, chamadas somente uma vez
void setup(){
  
  size(800,600);//tamanho da tela
  smooth();//suavizar pixelização
  sky = loadImage("sky.jpg");//carregar a imagem de fundo "sky"
  font = loadFont("AdamsHand-Plain-48.vlw");//o tipo de letra é carregado

}
//fim da função setup
//fim das definições gerais do ambiente

//função draw
//definir a composição de objectos
void draw(){
  
  image(sky,0,0);//chama/desenha a imagem "sky"
  
  //1ª parte - balão e padrão
  fill(255,76,49);//cor do preenchimento do balão
  stroke(246,255,8);//cor do contorno
  strokeWeight(5);//tamanho do contorno
  ellipse(360,180,275,275);//posição do balão (círculo) em x e y e tamanho
  
  noFill();//sem preenchimento
  //posição e ângulo dos arcos em x e y
  arc(410, 180, 300, 300, radians(115), radians(245));//arco mais à esquerda
  arc(310, 180, 300, 300, radians(295), radians(425));//arco mais à direita
  arc(495, 180, 385, 385, radians(135), radians(225));//arco médio à esquerda
  arc(225, 180, 385, 385, radians(315), radians(405));//arco médio à direita  
  line(360, 42, 360, 317);//linha do centro
  
  //2ª parte - bandeiras
  noStroke();//sem contorno
  
  //sentido da esquerda para a direita
  fill(198,0,162);//cor do preenchimento da primeira bandeira
  triangle(223,180,260,180,240,205);//posição em x e y da primeira bandeira (triângulo)
  
  fill(45,0,198);//cor do preenchimento da segunda bandeira
  triangle(260,180,302,180,280,205);//posição em x e y da segunda bandeira (triângulo)
  
  fill(0,110,198);//cor do preenchimento da terceira bandeira
  triangle(302,180,360,180,330,205);//posição em x e y da terceira bandeira (triângulo)
  
  fill(0,198,180);//cor de preenchimento da quarta bandeira
  triangle(360,180,418,180,390,205);//posição em x e y da quarta bandeira (triângulo)
  
  fill(118,198,0);//cor de preenchimento da quinta bandeira
  triangle(418,180,460,180,440,205);//posição em x e y da quinta bandeira (triângulo)
  
  fill(198,198,0);//cor do preenchimento da sexta bandeira
  triangle(460,180,497,180,480,205);//posição em x e y da sexta bandeira (triângulo)
  
  //3ª parte - bolas no balão
  noStroke();//sem contorno
  fill(167,243,255);//cor do preenchimento da bola maior e mais pequena
  ellipse(445,235,50,50);//posição em x e y e tamanho da bola maior azul
  ellipse(330,230,10,10);//posição em x e y e tamanho da bola pequena azul
  fill(5,110,252);//cor do preenchimento das bolas de tamanho intermédio
  ellipse(305,100,15,15);//posição em x e y e tamanho da bola intermédia mais pequena
  ellipse(270,250,30,30);//posição em x e y e tamanho da bola intermédia maior
  
  //4ª parte - fundo do balão
  fill(246,255,8);//cor do preenchimento do fundo do balão
  stroke(246,255,8);//cor do contorno
  strokeWeight(5);//tamanho do contorno
  
  //construção feita a partir da ligação de uma série de vértices, especificando as coordenadas de cada vértice
  beginShape();//iniciar forma
  vertex(320,312);//canto superior esquerdo
  vertex(400,312);//canto superior direito
  vertex(395,317);
  vertex(392,322);
  vertex(390,327);
  vertex(391,332);
  vertex(392,337);
  vertex(393,342);//canto inferior direito
  vertex(327,342);//canto inferior esquerdo
  vertex(328,337);
  vertex(329,332);
  vertex(330,327);
  vertex(327,322);
  vertex(325,317);
  endShape(CLOSE);//finalizar forma
  
  //5ª parte - corda
  stroke(95,46,14);//cor do contorno
  strokeWeight(5);//tamanho do contorno
  line(329,342,391,342);//linha que divide o fundo do balão das cordas
  line(327,342,320,380);//posição em x e y dos pontos da linha mais à esquerda
  line(393,342,400,380);//posição em x e y dos pontos da linha mais à direita
  line(347,342,345,380);//posição em x e y dos pontos da linha central esquerda
  line(373,342,375,380);//posição em x e y dos pontos da linha central esquerda
  
  //6ª parte - cesto
  fill(229,191,107);//cor do preenchimento do cesto
  quad(320,380,400,380,390,420,330,420);//desenhar a forma do cesto
  strokeWeight(8);//tamanho do contorno (linha)
  strokeCap(ROUND);//estilo da linha
  stroke(95,46,14);//cor do contorno
  line(320,380,400,380);//desenhar a linha do topo do cesto - posição do objecto em x e y
  
  //campo de papoilas vermelhas
  noLoop();//sem repetição
  
  for(int i = 0; i < 800; i++){//criar uma variável para desenhar a "ellipse" em loop
    fill(227,38,0);//cor do preenchimento
    noStroke();//sem contorno
    ellipse(random(width),random(height/3+280,height),4,4);//definir a posição em x e em y e o tamanho
  }
  
  //desenhar o texto
  fill(255);//cor da fonte
  smooth();//suavizar pixelização
  textFont(font,30);//chamar a fonte e definir o tamanho
  text("Across the sky…",510,200);//definir o texto e a posição no x e no y
  
  saveFrame("Across the Sky.png");//guardar a imagem
}
//fim da função draw
//fim das definições da composição de objectos

