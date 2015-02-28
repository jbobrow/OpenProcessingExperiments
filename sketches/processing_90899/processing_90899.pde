
/*
Eaí meu pai, é o seguinte.. Esse desenho é um exercício que fiz
para tirar uma velha dúvida de perspectiva.. Eu não sabia calcular 
a distância exata da profundidade.. dúvida besta, que está resolvida!!
*/

int bg; // declaração de váriável para cor de background
int stk; // declaração de váriavel para cor de contorno


void setup() { // atrbuição dos valores das variáveis
  size(400, 500); // chamada de função para tamanho do canvas
  bg = int(random(255)); // conversão de ponto flutuante aleatório para int
  background(bg,bg,bg); // chamada de função para cor de background
  stk = int(random(255)); // conversão de ponto flutuante aleatório para int
  stroke(stk,stk,stk);// chamada de função para cor de contorno
  noFill(); // chamada de função para remover cor de preenchimento
  strokeWeight(5); // chamada de função para expessura do contorno
}

void draw() { // loop
  background(bg,bg,bg); // chamada de função para cor de background
  stroke(stk,stk,stk); // chamada de função para cor de contorno
  line(56, 168, 56, 204); // desenho do cubo
  line(56, 168, 200, 52);
  line(200, 52, 344, 168);
  line(344, 168, 344, 204);
  line(80, 148, 80, 204);
  line(116, 120, 116, 204);
  line(200, 52, 200, 180);
  line(284, 120, 284, 204);
  line(320, 148, 320, 204);
  line(132, 204, 200, 180);
  line(200, 180, 268, 204);
  rect(44, 204, 104, 104);
  rect(148, 204, 104, 104);
  rect(252, 204, 104, 104);
  line(56, 308, 56, 344);
  line(56, 344, 200, 460);
  line(200, 460, 344, 344);
  line(344, 344, 344, 308);
  line(80, 308, 80, 364);
  line(116, 308, 116, 392);
  line(200, 332, 200, 460);
  line(284, 308, 284, 392);
  line(320, 308, 320, 364);
  line(132, 308, 200, 332);
  line(200, 332, 268, 308); // fim do desenho do cubo
  bg = int(random(255));  // mudança de cor do background
  stk = int(random(255)); // mudança de cor do contorno
}
