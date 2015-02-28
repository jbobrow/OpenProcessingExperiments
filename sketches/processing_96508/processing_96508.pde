
void setup () {
  size(200, 200);
  background(#42903D);
}

void draw() {
  stroke(#3FC137);
  int x=5 ;
  int y=5;
  for (x=5;x<200;x=x+10)//Repetição de Círculos para Grama
  {
    for (y=5;y<200;y=y+10)
    {
      point(x, y);
    }
  }

  fill(#1B9D93);
  ellipse(130, 120, 100, 100);//Lago
  fill(255);
  triangle(30, 30, 20, 70, 166, 189);//Marquise
  fill(#7C4D36);
  rect(100, 30, 80, 15);//Bancos
  rect(20, 180, 80, 15);//Bancos

  fill (#93D333);//Árvores
  ellipse(20, 20, 10, 10);
  fill (#AF9F40);
  ellipse(40, 20, 10, 10);
  fill (#CE68C1);
  ellipse(60, 20, 10, 10);
  fill (136, 180, 113);
  ellipse (80, 20, 10, 10);
  fill (157, 206, 131);
  ellipse (100, 20, 10, 10);
  fill (#D88053);
  ellipse (120, 20, 10, 10);
  fill (176, 227, 149);
  ellipse (140, 20, 10, 10);
  fill (#93D333);
  ellipse(160, 20, 10, 10);
  fill (#AF9F40);
  ellipse(180, 20, 10, 10);
}
