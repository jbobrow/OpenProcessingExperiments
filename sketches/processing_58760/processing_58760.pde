
void setup () {//comando para defenir as propriedades do ambiente inicial, tais como tamalho da janela, cor de fundo, carregar imagemm, etc. antes de começar a executar 

  frameRate(5); // frames que gera por segundo
  size (600, 600); // comando para defenir o tamaho da janela  em pixeis, primeiro parametro é a largura e o segundo é altura
  smooth(); // suaviza a imagem, melhora a qualidade de imagens redimensionadas 
  //noLoop();  //para o processo que continua a executar o codigo dentro do draw(), deve ser a ultima linha de codigo dentro do setup().
}

void draw() { //comando para executar 

  background (145,0,0);//random permite-me escolher uma cor aleatoria

  for (int i=1; i < 1000; i= i+1){
   
    noStroke();
    fill (random (100,150),0,21);
    float x = random (width);
    float y =  random(height);
    float x1 = random (width);
    float y1 = random(height);
    float x2 = random (width);
    float y2 = random(height);
    
    triangle(x, y, x1, y1, x2, y2);
}

  for (int i = 1 ; i < 600; i= i + 5) {
    
    fill(random (80), 152, 15);
    rectMode(CENTER);
    rect ( i, i, i, i);
    
    fill(random (80), 100, 0);
    ellipse (i ,i ,i ,i);
  }
}

