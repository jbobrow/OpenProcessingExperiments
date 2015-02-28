
void setup () {

  size (500, 500); // definir o tamanho da janela
  smooth(); // suavizar as arestas dos objectos representados
}

void draw() {

  background(89,90,87); // definir a cor de fundo da janela

  float raioSegundos, raioHoras;
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI; // converter os segundos para a escala de radianos
  float h = map(hour(), 0, 24, 0, TWO_PI) - HALF_PI;  // converter as horas para a escala de radianos

 
  int m = minute(); // valores dos minutos entre 0 e 59
  int cx, cy; // 
  int escala = 200; // valor para a escala dos objectos
  
  m = (int) map (m, 0, 59, 0, escala); // mapear os valores dos minutos de 0 a 59, para o tamanho da janela
  
  cx = width / 2; // centro horizontal da janela
  cy = height / 2; // centro vertical da janela

  raioSegundos = 120; // atribuir o raio para os segundos
  raioHoras = 110; // atribuir o raio para as horas

  strokeWeight(2); // definir aresta do circulo dos segundos e a sua espessura
  fill(24,106,4); // definir a cor de preenchimento do circulo dos segundos
  ellipse(cx + cos(s) * raioSegundos, cy + sin(s) * raioSegundos, 15, 15); // definição da posição dos angulos de acordo com o mapeamento

  strokeWeight(2); // definir aresta do circulo das horas e a sua espessura
  fill(0); // definir a cor de preenchimento do circulo das horas
  ellipse(cx + cos(h) * raioHoras, cy + sin(h) * raioHoras, 5, 5); // definição da posição dos angulos de acordo com o mapeamento

  strokeWeight (2); // definir aresta do circulo dos minutos e a sua espessura
  fill (225, 226,0); // definir a cor que vai preenchendo o circulo dos minutos
  ellipse (cx, cy, m, m); // definir a posição e o tamanho do circulo de preenchimento dos minutos
  noFill(); // definir que todos os circulos pertencentes ao circulo principal dos minutos não tem preenchimento 
  ellipse (cx, cy, escala, escala); // definir o circulo maior dos minutos
  ellipse (cx, cy, escala*0.5, escala*0.5); // definir o circulo dos 30 minutos
  ellipse (cx, cy, escala*0.25, escala*0.25); // definir o circulo dos 15 minutos
  ellipse (cx, cy, escala*0.75, escala*0.75); // definir o circulo dos 45 minutos

}
