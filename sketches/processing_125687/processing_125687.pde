
/* Nome: Ana Carolina de Moura Faustino 
Essa é a tentativa de uma estrada, que representa uma das melhores coisas que aconteceram esse ano, viajar sozinha de ônibus para o Rio de Janeiro ver F+TM.
O desenho ficou assim porque não consegui fazer os matos :/ */
float z = 200;
float a = 0;
void setup () {
  size (400, 600);
  smooth();
  rua (4);
}

color defineCor () {
  color cor = color (random(255), random (255), random (255));
  return cor;
}

void draw () { 
 //céu
  fill (47, 95, 222);
  noStroke();
  rect (0, 0, 450, 200);
  stroke (defineCor ());
  strokeWeight (2);
 //estrelas que pixcam
  for (int x = 15; x <= 500; x += 35){
    for (int y = 15; y <= 100; y += 35){
      if (x % 2 == 0) {
        line (x, y, x + 5, y +5);
        line (x + 5, y, x, y +5);
      }
      else {
        line (x + 5, y + 20, x + 10, y + 15);
        line (x + 10, y + 20, x + 5, y + 15);
      }
    }
  }
}

  void rua (float tamanhoLinha){
    noStroke();
    fill (88, 92, 100);
    rect (0, z, 450, 400);
    stroke (255,255,255);
    strokeWeight (tamanhoLinha);
  //linhas laterais
    line (z, z, 100, 650); 
    line (z, z, 300, 650);
  //linha do meio
    for (int t = 200; t <= 650; t += 50){
     line (z, t, z, t + 10);
    }
  }
 
