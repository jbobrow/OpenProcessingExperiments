
PImage celt;//referir uma imagem e dar nome


void setup(){/*Função que serve para fazer as definições*/
 size(500,500);//tamanho da tela
 smooth();//suavizar as formas
 noLoop();//definir para que não haja loop na composição

}

void draw(){/*Função para desenhar*/
 background(0);//cor de fundo
 for (int i = 0; i < 150; i = i+1){//ciclo das ellipses até desenhar 150 objectos
 float PosX = random(500);//variavel da posição x das ellipses
 float PosY = random(500);//variavel da posição y das ellipses
 float tam = random(100);//variavel para o tamanho das ellipses
 float r = 0;//variavel para a cor vermelha (red)
 float g = random(255);//variavel para a cor verde (green)
 float b = 0;//variavel para a cor azul (blue)
 strokeWeight(random(3));//grossura do contorno das ellipses
   fill(r,g,b,70);//cor das ellipses
   ellipse(PosX,PosY,tam,tam);//desenho das ellipses
 } 

 celt = loadImage("images.png");//carregar imagem
 float desX = 0;//variavel do x da imagem
 float desY = 0;//variavel do y da imagem
 image(celt,desX,desY);//função para desenhar imagem
 
}

