
// Pedro Artur
// Trabalho de Conclusão de Disciplina
// Baseado no Exercício de Planta de ME1

PFont fonte;
void setup () {

  size(800, 600);
  background(255);
  fonte = createFont ("Georgia", 12);
  textFont (fonte);
}
void draw () {

  //Paredes

  strokeWeight(2);
  fill(0);
  rect(180, 20, 533, 7);
  rect(706, 20, 7, 225);
  rect(348, 238, 365, 7);
  rect(180, 20, 7, 225);
  rect(180, 200, 100, 7);
  rect(280, 148, 7, 97);
  rect(7, 148, 130, 7);
  rect(70, 148, 7, 50);
  rect(7, 236, 130, 7);
  rect(7, 148, 7, 285);
  rect(7, 426, 305, 7);
  rect(531, 238, 7, 82);
  rect(338, 20, 7, 135);
  rect(438, 20, 7, 135);
  rect(538, 20, 7, 135);
  rect(338, 148, 62, 7);
  rect(438, 148, 67, 7);
  rect(538, 148, 40, 7);
  rect(438, 215, 7, 30);
  rect(438, 148, 7, 20);
  rect(305, 426, 230, 7);
  rect(531, 303, 7, 130);
  rect(280, 148, 12, 7);
  rect(412, 426, 20, 7);
  rect(531, 300, 7, 20);

  //Deck

  strokeWeight(1);
  fill(255);
  rect(305, 426, 7, 125);
  rect(305, 551, 473, 7);
  rect(771, 313, 7, 245);
  rect(531, 313, 247, 7);

  //Tábuas

  strokeWeight(1);
  for (int x=538;x<700;x=x+100) {
    for (int y=330;y<440;y=y+10) {
      line(x, y, x+132, y);
    }
  }
  strokeWeight(0);
  for (int x=312;x<700;x=x+100) {
    for (int y=440;y<550;y=y+10) {
      line(x, y, x+159, y);
    }
  }

  //Piso Banheiro

  for (int q=350;q<550;q=q+15) {
    strokeWeight(1);
    line(q, 20, q, 150);
  }
  for (int w=35;w<150;w=w+15) {
    strokeWeight(1);
    line(350, w, 540, w);
  }

  //Porta-janela

  strokeWeight(1);
  rect(312, 426, 100, 7);
  rect(426, 426, 104, 7);
  rect(531, 326, 7, 99);

  //Janelas

  strokeWeight(1);
  rect(7, 244, 7, 40);
  line(9, 195, 9, 288);
  line(12, 195, 12, 288);
  rect(29, 148, 40, 7);
  rect(78, 148, 40, 7);
  line(29, 150, 130, 150);
  line(29, 153, 130, 153);
  rect(210, 20, 100, 7);
  rect(397, 20, 40, 7);
  rect(446, 20, 40, 7);
  rect(575, 20, 100, 7);
  line(210, 22, 700, 22);
  line(210, 25, 700, 25);

  //Arrumando defeitos

  fill(0);
  rect(531, 300, 7, 20);

  //Portas

  fill(255);
  rect(175, 106, 2, 38);
  rect(333, 106, 2, 38);
  rect(433, 106, 2, 34);
  rect(533, 106, 2, 30);
  rect(447, 210, 40, 2);
  rect(120, 231, 40, 2);
  rect(65, 187, 2, 35);

  //Árvores

  for (int x=70; x<200; x=x+120) {
    for (int y=70; y<200; y=y+120) {
      fill(#006400);
      ellipse(x, 500, 100, 100);
      if (x<100) {
        fill(#228B22);
        ellipse(x, 500, 100, 100);
      }
      textAlign(RIGHT);
      fill(0);
      text("Pedro Artur - 2013", 750, 570);
    }
  }
}
