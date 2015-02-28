
//variaveis globais
float c = 50.0;
float x = 50.0;
int AuxCorR=90;
int AuxCorG=160;
void setup()
{
  size(300, 300);
  frameRate(2);
}

void draw()
{
  //mudança dacor do fundo(representando mudança de horario)
  if (x == c)
  {
    background(AuxCorR, AuxCorG, 255);
    AuxCorR-=10;
    AuxCorG-=5;
    x+=40;
  }

  background(AuxCorR, AuxCorG, 255);

  //Ônibus
  fill(10, 4, 203);
  rect(c+10, 276, 50, 20);
  fill(255, 255, 255);
  textSize(8);
  text("Cometa", c+15, 290);
  //roda
  ellipse(c+20, 296.5, 7, 7);
  line(c+20, 294.5, c+20, 300);
  line(c+16.5, 296.5, c+23.5, 296.5);
  ellipse(c+50, 296.5, 7, 7);
  line(c+50, 294.5, c+50, 300);
  line(c+46.5, 296.5, c+53.5, 296.5);
  //janelas
  noStroke();
  rect(c+12, 278, 5, 5);
  stroke(0);
  line(c+14.5, 278, c+14.5, 283);
  noStroke();
  rect(c+19, 278, 5, 5);
  stroke(0);
  line(c+21.5, 278, c+21.5, 283);
  noStroke();
  rect(c+26, 278, 5, 5);
  stroke(0);
  line(c+28.5, 278, c+28.5, 283);
  noStroke();
  rect(c+33, 278, 5, 5);
  stroke(0);
  line(c+35.5, 278, c+35.5, 283);
  //porta do ônibus
  rect(c+55, 280, 5, 15);
  
  //incremento do movimento do desenho
  c+=20;


  //Retorno do desenho
  if (c==210.0)
  {
    c = 50.0;
    x = 50.0;
    AuxCorR=90;
    AuxCorG=160;
  }



  //Placa São Paulo
  line(30, 270, 30, 300);
  line(20, 270, 20, 300);
  fill(255, 255, 255);
  rect(0, 260, 50, 15);
  textSize(10);
  fill(0);
  text("São Paulo", 1, 272);

  //Placa Curitiba
  line(280, 270, 280, 300);
  line(270, 270, 270, 300);
  fill(255, 255, 255);
  rect(249, 260, 50, 15);
  textSize(10);
  fill(0);
  text("Curitiba", 256, 272);
}

