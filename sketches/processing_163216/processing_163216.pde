
float d, v = 30, t = 0;
int fps = 240; //Determinei o FPS como 240 para aumentar a precisão do cálculo do tempo. Pois assim teremos mais frames acontecendo ao longo da simulação.

void setup() {
  size(1000, 600);
  frameRate(fps);
  background(0);
  stroke(255);
}

void draw() {
  background(0); //Redesenha o fundo para evitar rastro dos elementos que mudam de posição a cada quadro.
  desenhaCenario();
  fill(32, 155, 153);  //Atribui uma cor diferente aos textos, para que se destaquem melhor em relação ao cenário.
  text("Velocidade (m/s): "+v, 5, 10);
  text("Tempo (s): "+t, 5, 30);
  text("Distância (m): "+d, 5, 50);
  fill(102, 153, 51); //Atribui cor diferente a barra de carregamento e texto que diz o estado da simulação e seu resultado.
  rect(5, 80, d/5, 10); //Desenha barra de carregamento da simulação

  if (d <= 800) {
    simulaBolaMRU();
    t += (float) 1 / fps;    //>FPS = Frames por Segundo, logo, como a função frameRate() determina quantas vezes por segundo a função draw() será chamada, para sabermos o tempo em segundos, devemos dividir 1 segundo pela quantidade de FPS.
    text("Simulando...", 5, 70);
  } else {
    text("Simulação Finalizada!", 5, 70);
    text("O corpo levou "+t+" segundos para percorrer 800m a uma velocidade de 30m/s.", 5, 110);
  }
  fill(255); //Atribui cor branca a esfera
  ellipse(d, 400, 10, 10);
}

void simulaBolaMRU() {
  d = v * t;
}

void desenhaCenario() {
  for (int i = 0; i <= 20; i++) {
    line(i * 50, 0, i * 50, 600);
  }
}

