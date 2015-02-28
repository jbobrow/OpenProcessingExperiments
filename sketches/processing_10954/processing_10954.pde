
int largura = 30;
int altura = 30;

float circleX = largura/2;
float circleY = altura/2;

float velocidadeX = 5;
float velocidadeY = 2;

float gravidade = 0.5;
float perda = 0.9;
float desaceleracao = 0.005;

void setup(){
  size(400, 500);
  smooth();
  background(0);
  colorMode(HSB);
}

void draw(){
  background(0);
  fill(100, 100, 100);
  noStroke();
  
  ellipse(circleX, circleY, largura, altura);

  velocidadeY += gravidade;
  if(0.5 < velocidadeX || velocidadeX < -0.5){
    velocidadeX -= desaceleracao;
  }else{
    velocidadeX = 0;
  }
  
  circleY += velocidadeY;
  circleX += velocidadeX;
  
  if(circleX >= width - largura/2 || circleX <= 0 + largura/2){
    velocidadeX = - velocidadeX;
    desaceleracao = - desaceleracao;    
  }

  if(circleY > height - altura/2 || circleY < 0 + altura/2){
    println(velocidadeX);
    circleY = height - altura/2;
    velocidadeY = - velocidadeY * perda;
  }

}

