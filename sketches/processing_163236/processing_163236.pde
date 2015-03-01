
float t = 0, dxo = 400, dx, dyo = 800, dy, vx = 50, vy= -30, g = 10; //Como no Processing o valor y cresce para baixo, para termos uma simulação condizente com o mundo real, a bola sendo lançada para cima, sua velocidade vertical deve ser negativa. O valor de x cresce como no convencional, da esquerda pra direita, então vx é positivo. Como pedido, coloquei o objeto partindo do centro horizontal, na base da tela (dxo = 400, dyo = 800).
int fps = 20;

void setup() {
  size(800, 800);
  frameRate(fps);
  background(0);
  stroke(255);
}

void draw() {

  //background(0); //Como foi pedido que mantivesse-se o rastro da esfera, essa função é removida.  desenharCenario();
  desenharTexto(); //Coloquei os dados do texto e simulação em uma função para facilitar a legibilidade e modularidade do código.
  if (dy+dyo <= 800) {
    MRU_horizontal();
    MRUV_vertical();
    t += (float) 1 / fps;    //>FPS = Frames por Segundo, logo, como a função frameRate() determina quantas vezes por segundo a função draw() será chamada, para sabermos o tempo em segundos, devemos dividir 1 segundo pela quantidade de FPS.
    text("Simulando...", 5, 70);
  } else {
    text("Simulação Finalizada!", 5, 70);
    text("O corpo levou "+t+" segundos para atingir o chão.", 5, 110);
  }
  fill(255); //Atribui cor branca a esfera
  ellipse(dx+dxo, dy+dyo, 10, 10);
}

void MRU_horizontal() {
  dx = vx * t;
}

void MRUV_vertical() {
  dy = (vy * t) + ((g * pow(t, 2) / 2));
}

void desenharTexto() {
  noStroke();
  fill(0);
  rect(0, 0, 800, 120); //Em compensação, para que o texto não se overlap durante a simulação, desenha-se um quadrado no fundo da parte do texto antes de desenhar os textos com informação.
  desenharCenario();
  fill(32, 155, 153);  //Atribui uma cor diferente aos textos, para que se destaquem melhor em relação ao cenário.
  text("Velocidade Vertical Inicial(m/s): "+(-1*vy), 5, 10); //Ao contrário do Processing, usualmente velocidades verticais para cima são positivas, por isso inverti o sinal
  text("Velocidade Horizontal Inicial (m/s): "+vx, 5, 30);
  text("Tempo (s): "+t, 5, 50);
  text("Posição Horizontal (m): "+(dx+dxo), 350, 10);
  text("Posição Vertical (m): "+(dy+dyo), 350, 30);
  text("Gravidade (m/s²): "+g, 350, 50);
  fill(102, 153, 51); //Atribui cor diferente a barra de carregamento e texto que diz o estado da simulação e seu resultado.
  rect(5, 80, dx/5, 10); //Desenha barra de carregamento da simulação
}

void desenharCenario() {
  stroke(255);
  for (int i = 0; i<=16; i++) {
    line(i*50, 0, i*50, 800);
    line(0, i*50, 800, i*50);
  }
}

