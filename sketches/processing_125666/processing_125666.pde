
/* Nome: Gustavo Felipe Haus Gonçalves
Essa é a representação de uma das melhores coisas que ocorreu no ano de 2013,
foi uma viagem para o rio de janeiro,que ocorreu por volta da pascoa para o rio de janeiro.



*/
void desenha() {
  int x=280;
  noStroke();
  fill(167, 162, 162);
  rect(275, 200, 80, 210, 8);//corpo 1 e em seguida estrutura de riscos
  rect(150, 200, 150, 40, 8);//braço esquerdo1
  rect(305, 200, 165, 40, 8);//braço direito
  ellipse(313, 170, 70, 70);
  fill(11, 41, 0);
  ellipse(300, 600, 400, 300);

  stroke(1);
  fill(0);
  rect(220, 400, 180, 80, 8);//base
  for (x = 280;x <= 350;x += 10) {//linhas do corpo 1
    line(x, 400, x, 300);
  }
}
color Cor() {
  int azul =40;
  color c=color(azul);
  return c;
}


void setup() {
  size(600, 600);
  color c=Cor();
  background(c);
  desenha();
}



