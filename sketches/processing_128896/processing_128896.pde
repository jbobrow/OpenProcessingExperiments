
//Andressa Schartner-UTFPR S53
//Pátio
//Pátio de Andressa está licenciado com uma Licença Creative Commons - Atribuição-NãoComercial 4.0 Internacional
//http://creativecommons.org/licenses/by-sa/3.0/

 int pombas=10;
float[]voox;
float[]vooy;
void boneco (int x, int y, int tamanhox, int tamanhoy) {
  // Pessoa
  fill(246, 140, 113);
  //Corpo
  ellipse (x, y, 50, 30);
  quad (x-20, y+20, x+23, y+25, x+21, y-8, x-19, y-8);
  // Pescoco
  fill (236, 240, 213);
  ellipse (x, y-23, 17, 50);
  //braco
  ellipse (x-16, y+12, 29, 14);
  ellipse (x+12, y+17, 33, 14);
  ellipse (x-23, y+6, 14, 29);
  ellipse (x+22, y+8, 14, 33);
  //Cabeca
  ellipse(x, y-43, 45, 60);
  // olhos
  fill (156, 221, 252);
  ellipse(x-10, y-45, 8, 14);
  ellipse (x+5, y-45, 8, 14);
  fill(0);
  ellipse (x-10, y-44, 4, 7);
  ellipse (x+5, y-44, 4, 7);
  //Nariz
  fill(236, 240, 213);
  arc(x-2, y-33, x-413, y-84, 0, PI);
  // Cabelo
  fill (255);
  line(x+17, y-38, x+21, y-53);
  line(x+21, y-53, x+25, y-38);
  line(x-27, y-53, x-23, y-53);
  line(x-23, y-53, x-20, y-38);
}
void setup() {
  size(500, 500);
  frameRate (10);
  voox=new float[pombas];
  vooy=new float[pombas];
  for (int i=0;i<pombas;i++)
  {
    voox[i]=floor(random(width));
    vooy[i]=floor(random(300, 450));
    background (110, 118, 56);
  }
}
int fase=0;
int b=0;
void draw() {

  background (110, 118, 56);
  stroke(5);

  switch (fase) {
  case 0:
    desenho();
    // Janela fechada
    fill (110, 118, 95);
    quad (350, 100, 410, 110, 410, 10, 350, 10);
    quad (410, 110, 480, 120, 480, 10, 410, 10); 
    break;
  case 1:
    desenho();
    // Pessoa
    boneco (420, 88, 420, 88);
    // boca
    line (412, 65, 422, 65);
    // Janela entre aberta
    fill (110, 118, 95);
    quad (350, 100, 390, 115, 390, 10, 350, 10);
    quad (440, 120, 480, 120, 480, 10, 440, 7);
    break;
  case 2:
    desenho();
    // Pessoa
    fill(236, 150, 113);
    boneco (410, 89, 420, 88);
    // boca
    line (405, 65, 413, 65);
    // Janela aberta
    fill (110, 118, 95);
    quad (350, 100, 340, 110, 340, 10, 350, 10);
    quad (490, 125, 480, 120, 480, 10, 490, 10);
    break;
  case 3:
    desenho();
    // Pessoa inclinada
    pushMatrix();
    rotate (-0.1);
    translate (-7, 42);
    boneco (410, 88, 420, 88);
    // boca
    line (405, 64, 413, 64);
    popMatrix();

    //janela
    fill (110, 118, 95);
    quad (350, 100, 340, 110, 340, 10, 350, 10);
    quad (490, 125, 480, 120, 480, 10, 490, 10);
    break;
  case 4:
    desenho();
    pushMatrix();
    rotate (-0.1);
    translate (-8, 42);
    boneco (410, 88, 420, 88);
    // boca
    line (405, 64, 413, 64);
    popMatrix();
    fill (110, 118, 95);
    quad (350, 100, 340, 110, 340, 10, 350, 10);
    quad (490, 125, 480, 120, 480, 10, 490, 10);
    //queda   
    fill(255);
    ellipse (400, b, 5, 5);
    b++;
    if (b==30)
    {
      b=0;
    }
    break;
  case 5:
    desenho ();
    pushMatrix();
    rotate (-0.1);
    translate (-9, 42);
    boneco (410, 88, 420, 88);
    // boca
    line (405, 64, 413, 65);
    //surpresa
    fill(255);
    ellipse (410, 28, 37, 22);
    curve(410, 20, 390, 40, 410, 40, 390, 20);
    curve(410, 30, 410, 40, 430, 30, 390, 60);
    curve(410, 20, 390, 30, 410, 30, 390, 10);
    curve(420, 20, 420, 20, 410, 20, 410, 50);
    popMatrix();
    fill(246, 140, 113);
    //janela
    fill (110, 118, 95);
    quad (350, 100, 340, 110, 340, 10, 350, 10);
    quad (490, 125, 480, 120, 480, 10, 490, 10);
    break;
  }
}

void desenho () {
  // predio
  fill (201, 205, 211);
  quad (180, 100, 0, 150, 0, 400, 180, 300);
  quad (180, 100, 500, 150, 500, 400, 180, 300);
  quad (180, 0, 0, 0, 0, 150, 180, 100);
  quad (180, 100, 500, 150, 500, 0, 180, 0);
  // portas 1
  fill (177, 177, 177);
  arc (80, 220, 150, 150, PI, TWO_PI);
  fill (201, 205, 211);
  arc (70, 225, 135, 135, PI, TWO_PI);
  line (3, 218, 3, 400);
  line (154, 215, 154, 315);
  line (136, 218, 136, 310);
  line (154, 315, 136, 310);
  // portas 2
  fill (177, 177, 177);
  arc(280, 200, 150, 150, PI, TWO_PI);
  fill (201, 205, 211);
  arc (290, 205, 135, 135, PI, TWO_PI);
  line (357, 200, 355, 355);
  line (222, 205, 222, 300);
  line (205, 200, 205, 307);
  line (222, 300, 205, 307);
  // portas 3
  fill (177, 177, 177);
  arc(480, 235, 150, 150, PI, TWO_PI);
  fill (201, 205, 211);
  arc (490, 240, 135, 135, PI, TWO_PI);
  line (422, 230, 422, 367);//aqui
  line (405, 230, 405, 370);
  line (405, 370, 422, 367);
  // Janela 1
  fill (0);
  quad (135, 15, 20, 20, 20, 120, 135, 90);
  fill (110, 118, 95);
  quad (135, 15, 145, 10, 145, 95, 135, 90);
  quad (20, 20, 10, 15, 10, 130, 20, 120);
  //Janela 2
  fill (0);
  quad (200, 80, 300, 95, 300, 10, 200, 10);
  fill (110, 118, 95);
  quad (200, 80, 190, 85, 190, 5, 200, 10);
  quad (300, 10, 310, 5, 310, 107, 300, 95);
  //Janela fechada fundo
  fill (0);
  quad (350, 100, 480, 120, 480, 10, 350, 10);



  for (int i=0;i<pombas;i++) {
    fill (255);
    ellipse (voox[i]+6, vooy[i]-3, 9, 9);
    ellipse(voox[i], vooy[i], 12, 8);
     ellipse(voox[i], vooy[i]-4, 13, 8); 
    vooy[i]=vooy[i]-random(-0.5, 50);
    voox[i] =voox [i] -random (-10, 0.1);
    if (vooy[i]> height)
    {
      voox [i] = floor(random(width));
      vooy[i]=400;
    }
  }
}
void mouseClicked () {
  fase ++;
  if (fase==6)
    fase=0;
}
