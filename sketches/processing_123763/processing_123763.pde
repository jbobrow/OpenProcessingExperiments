
void setup() {
  size(600, 600);
  //  colorMode ( RGB );
}
void draw () {//céu claro
  //noStroke();
  if (mouseX> width/2)
  {//céu
    fill(3, 15, 62);
    rect(0, 0, width, 300);
  }
  else {//céu escuro
    fill(75, 197, 240);
    rect(0, 0, width, 300);
  }
  //prédios atrás do Louvre
  stroke(162, 151, 109);//Cor da linha
  strokeWeight(2.3);//Espessura da linha
  fill(255, 236, 139);//Cor das paredes
  rect(0, 250, 600, 150);//retangulo maior
  rect(0, 320, 600, 10);//marquize
  fill(137, 117, 58);//Cor da abódoba
  ellipse(300, 150, 180, 140);//abódoba
  rect(255, 75, 90, 15);// topo da abódoba
  fill(255, 236, 139);//Cor da torre
  rect(200, 150, 200, 100);//Torre
  triangle(300, 120, 400, 150, 200, 150);//Triângulo da torre
  fill(255, 250, 205);//Cor da janela
  for (int janelas=20; janelas<=520; janelas=janelas+50) {
    {
      rect(janelas, 270, 30, 35);//janela do 2º andar
    }
  }
  for (int janelas=20; janelas<=520; janelas=janelas+50) {
    {
      rect(janelas, 345, 30, 35);//janela do 1º andar
    }
  }
  for (int janelas=212; janelas<=380; janelas=janelas+50) {
    {
      rect(janelas, 185, 30, 35);//Janelas da torre}
    }
  }
  //Piso em volta da pirâmide
  fill(180, 205, 205);
  quad(70, 410, 530, 410, 590, 527, 10, 527);
  //Pirâmide do Louvre
  fill(255, 255, 255);
  triangle(300, 200, 50, 500, 550, 500);
  stroke(0);
  if (mouseX>width/2) {//noite
    fill(#E8BA13);//azul escuro
    triangle(300, 200, 50, 500, 550, 500);
    //linhas diagonais (//)
    for (int i=0; i<20;i++)
      line (550+i*12.5, 500+i*45, 300-i*12.5, 200+i*15);
    //Linhas diagonais (\\)
    for (int i=0; i<20;i++)
      line (300+i*12.5, 200+i*15, 50+i*12.5, 500+i*15);
    //Piso NOITE
    stroke(180, 205, 205);
    rect(0, 528, 600, 100);
    fill(180, 205, 205);
    quad(50, 501, 550, 501, 550, 526, 50, 526);
    rect(0, 528, 600, 100);
    stroke(178, 166, 115);
    line(10, 527, 590, 527);
    fill(205, 205, 205);
    quad(230, 527, 370, 527, 410, 600, 190, 600);
    //Lua
    noStroke();
    fill(255);
    ellipse(90, 150, 50, 50);
  }
  else {//dia
    fill(135, 206, 235);//azul claro
    triangle(300, 200, 50, 500, 550, 500);
    //linhas diagonais (//)
    for (int i=0; i<20;i++)
      line (550+i*12.5, 500+i*45, 300-i*12.5, 200+i*15);
    //Linhas diagonais (\\)
    for (int i=0; i<20;i++)
      line (300+i*12.5, 200+i*15, 50+i*12.5, 500+i*15);
    //Sol
    noStroke();
    fill(255, 255, 0);
    ellipse(510, 50, 50, 50);
    //Piso DIA
    stroke(180, 205, 205);
    rect(0, 528, 600, 100);
    fill(180, 205, 205);
    quad(50, 501, 550, 501, 550, 526, 50, 526);
    rect(0, 528, 600, 100);
    stroke(178, 166, 115);
    line(10, 527, 590, 527);
    fill(205, 205, 205);
    quad(230, 527, 370, 527, 410, 600, 190, 600);
  }
}
