
int x1, y1, r1, x2, y2, r2; //Variáveis x1, y1 e r1 referem-se a posição horizontal, vertical e raio do círculo 1. x2, y2 e r2 referem-se ao círculo 2.

void setup() {
  size(800, 800);
  r1 = (int)random(401); //Faz com que o raio do círculo seja entre 0 e 400, não sendo permitido que ele seja maior que a tela.
  x1 = (int)random(r1, 801-r1); //Força que o valor de x1 esteja entre o valor do raio do círculo 1 e o valor do tamanho da tela (800) menos o valor do raio do círculo 1, fazendo com que o círculo criado esteja necessariamente inteiramente dentro da tela.
  y1 = (int)random(r1, 801-r1); //O mesmo que o anterior, mas para o valor de y1.
  r2 = (int)random(401); //Faz com que o raio do círculo seja entre 0 e 400, não sendo permitido que ele seja maior que a tela.
  x2 = (int)random(r2, 801-r2); //Repete-se as operações anteriores para x2 e y2, forçando com que o novo círculo criado esteja completamente dentro da tela.
  y2 = (int)random(r2, 801-r2);
}

void draw() {
  checaColisao(x1, y1, r1); //Chama a função para checar a colisão para o círculo 1.
  checaColisao(x2, y2, r2); //Chama a função para checar a colisão para o círculo 2.
}

void checaColisao(int x, int y, int r) {
  float d; 
  d = distanciaMouse(x, y); //Calcula a distância do ponto x, y em relação ao mouse.
  if (d <= r) fill(0);      //Checa se a distância é menor ou igual ao raio. Caso seja, isso indica que o mouse encontra-se dentro do círculo. Se ele estiver, muda a cor para preto.
  else fill(255);           //Caso o mouse esteja fora, o círculo mantém-se com cor branca.
  ellipse(x, y, 2*r, 2*r);  //Desenha-se o círculo
}

float distanciaMouse(int x, int y) { //Função para cálculo da distância usando a fórmula de pitágoras.
  float d;
  d = sqrt(pow((x - mouseX), 2) + pow((y - mouseY), 2)); //d² = (x - mouseX)² + (y - mouseY)² (Pitágoras)
  return d; //Retorna o valor da distância a ser recebido por outra variável na função "checaColisao"
}

