
void setup () {//comando para defenir as propriedades do ambiente inicial, tais como tamalho da janela, cor de fundo, carregar imagemm, etc. antes de começar a executar 

  frameRate(5); // frames que gera por segundo
  size (600, 600); // comando para defenir o tamaho da janela  em pixeis, primeiro parametro é a largura e o segundo é altura
  smooth(); // suaviza a imagem, melhora a qualidade de imagens redimensionadas 
  //noLoop();  para o processo que continua a executar o codigo dentro do draw(), deve ser a ultima linha de codigo dentro do setup(). 
  
}

void draw() { //comando para executar 

  background ( 255, random (100),0);//random permite-me escolher uma cor aleatoria

  for (int i=0 ; i < 800 ; i = i+10) {//isto define um ciclo que vai de 0 a 800 icrementando sempre mais 1 linha

    int x1 = width/2;//gera uma variavel inteira  x1 que corresponde a metade da largura da tela 
    int y1 = height/2;// gera uma variavel inteira que corresponde a metade da altura da tela 
    float x2 = random (width);//gera uma varaivel que corresponde a aqualquer valor da tela neste ca so no eixo x
    float y2 = random (height);//gera uma varaivel que corresponde a aqualquer valor da tela neste ca so no eixo y
    stroke(0, random (255), 0);// gera valores aleatóriso para a componente verde para a linha
    strokeWeight(random(5));// gera valores aleatórios para a espessura da linha entre 5 e 10
    line (mouseX, mouseY, x2, y2); //linha e os seus dois pontos extremos 
   
   
    float d = random (50);
    fill(random(255),0,0);
    noStroke();
    ellipse (x2, y2, d, d);  
  }
  
}

