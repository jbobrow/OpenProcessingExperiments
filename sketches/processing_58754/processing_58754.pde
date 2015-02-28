

float x, y, x1, y1, x2, y2, x3, y3 ;// variavéis de pontos 
float d; // variavel para o diametro (tamanho) do circulo
float r, g, b; // variaveis para a cor do circlo

float limiteH; //variável para os valores do limite horizontal
float limiteV; // variavel para valores limite vertical 




void setup () {//comando para defenir as propriedades do ambiente inicial, tais como tamalho da janela, cor de fundo, carregar imagemm, etc. antes de começar a executar 


  frameRate(7);// especifica o número de frames a serem exibidos a cada segundo.
  size (600, 600); // comando para defenir o tamaho da janela  em pixeis, primeiro parametro é a largura e o segundo é altura
  smooth(); // suaviza a imagem, melhora a qualidade de imagens redimensionadas 
  noStroke(); //retira todos os traços que possam existir.
  //noLoop(); // para o processo que continua a executar o codigo dentro do draw(), deve ser a ultima linha de codigo dentro do setup().


  limiteH = 200; 
  limiteV = 250;
}

void draw() {

  background (255); // cor do fundo 

  for ( int i = 0; i < 100 ; i++) {// criar um ciclo em que começa em 0 e vai até as 100 formas, incrementando sempre mais uma 
    x = random (width/2-limiteH, width/2+limiteH);// gerar um numero para posição horizonral 
    y = random (height/2-limiteV, height/2+limiteV); // gerar um numero para posição vertical
    x1 = random (width/2-limiteH, width/2+limiteH);//gerar um numero para posição horizonral  
    y1 = random (width/2-limiteH, height/2+limiteV);// gerar um numero para posição vertical
    x2 = random (width/2-limiteH, width/2+limiteH);//gerar um numero para posição horizonral
    y2 = random (width/2-limiteH, height/2+limiteV); // gerar um numero para posição vertical
    x3 = random (width/2-limiteH, width/2+limiteH); //gerar um numero para posição horizonral
    y3 = random (width/2-limiteH, height/2+limiteV);// gerar um numero para posição vertical

    r = random(255); // gerar um valor para a componente vermelha entre 0 e 255
    g = 0; 
    b = 0; 

    //stroke(0);
    //strokeWeight(5);
    fill(r, g, b); // preencgher as formas com as cores r,g,b, neste caso com componentes de vermelho 
    quad( x, y, x1, y1, x2, y2, x3, y3 ); // desenhar uma forma com 4 arestas com valores  aleatorios com os limites detro da bounding boxe
  }


  for ( int i = 0; i < 35; i++) {// gerar um ciclo que vai de 0 até as 35 formas, incrementando sempre mais uma 


    d = random (10, 100); // gerar um diametro entre 10  e 100
    float eR = d/2; //dimensão do raio 

    x = random (width/2-limiteH+eR, width/2+limiteH-eR);/* gerar um numero para posição horizonral, neste caso uma valor que não sai dos limites da
     bounding boxe, as coordenads inseridas sem os raios iriam fazer com que o centro dos circulços ficasse efectivamente dentro da bounding boxe, mas correria 
     o risco de a largura do circulo tranparecer a caixa, assim primeiro subtraio ou adiciono o raio consoante o liminte */
    y = random (height/2-limiteV+eR, height/2+limiteV-eR); // a mesma coisa que na anterior 

    r = 0;
    g = random(255); // gerar um valor para a componente verde entre 0 e 255
    b = 0;

    //noStroke ();
    //stroke (255, 0, 0, 150);
    //strokeWeight(5);
    fill(r, g, b);// prencher com as cores r,g,b
    ellipse ( x, y, d, d); // desenhar a elipse com os valores gerados
  }
}

