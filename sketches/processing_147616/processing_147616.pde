
// projecto lição 2: usar a função random
//1. cor e transparência aleatória
//2. posição aleatória
//3. tamanho aleatório
//4. quando se carrega numa tecla recomeça outra vez

int corR;
int corY;
int corB;
int transparencia;

int localizacaoX;
int localizacaoY;

int diametro; // círculo maior

void setup() {
  size(600, 600);
  frameRate(30);
  background(152, 126, 126);
  smooth();
}

void draw() {
  //stroke(abs(mouseX-mouseY),abs(mouseX-mouseY),abs(mouseX-mouseY));
  //line(mouseX,mouseY,pmouseX,pmouseY);

// os valores das variáveis têm de ser colocados no draw.
/* como eu quero que os valores das variáveis sejam inteiros, tenho que pôr int
antes da função random. As variásveis estão indicadas como inteiras
em cima*/

corR = int(random(255));
corY = int(random(255));
corB = int(random(255));
transparencia = int(random(255));
localizacaoX = int(random(width));
localizacaoY = int(random(height));
diametro = int(random(20,80));

  //círculos
  noStroke();
  fill(corR,0,0,transparencia);
  ellipse(localizacaoX,localizacaoY,diametro,diametro);
  fill(corY,corY,0,transparencia);
  ellipse(localizacaoX,localizacaoY,diametro-20,diametro-20);
  fill(0,0,corB,transparencia);
  ellipse(localizacaoX,localizacaoY,diametro-40,diametro-40);
}

void keyPressed() {
   background(152, 126, 126);
}


