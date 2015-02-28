
/*
 * Uma alteração do programa "tickle", 
 * disponível nos exemplos oficiais.
 */

String messagem = "certificado";
String[] aluno = new String[21];
float x, y, hr, vr;
int i = 0;

void setup() {
  size(400, 400);
  PFont font = loadFont("ComicSansMS-24.vlw");
  textFont(font, 24);
  textAlign(CENTER, CENTER);
  hr = textWidth(messagem) / 2;
  vr = (textAscent() + textDescent());
  noStroke();
  alunos();
  x = width / 2;
  y = height / 2;
}

void draw() {
  fill(255, 70);
  rect(0, 0, width, height);
  fill(#FF5303);
  if (abs(mouseX - x) < hr && abs(mouseY - y) < vr) {
    x += random(-15, 15); 
    y += random(-15, 15);
    i++;
    if (i > 20) i = 0;
  }
  text("CERTIFICADO\n" + aluno[i], x, y);
}
void alunos() {
  aluno[0] = "Naoto";
  aluno[1] = "Bernardo";
  aluno[2] = "Bruno";
  aluno[3] = "Edson";
  aluno[4] = "Elton";
  aluno[5] = "Guilherme";
  aluno[6] = "Heitor";
  aluno[7] = "João";
  aluno[8] = "Leonardo";
  aluno[9] = "Lucas";
  aluno[10] = "Luisa";
  aluno[11] = "Marcelo";
  aluno[12] = "Marco";
  aluno[13] = "Marluce";
  aluno[14] = "Matheus Jose";
  aluno[15] = "Pablo";
  aluno[16] = "Thais";
  aluno[17] = "Thierry";
  aluno[18] = "Vanessa";
  aluno[19] = "Vinicius";
  aluno[20] = "Rafael";
}



