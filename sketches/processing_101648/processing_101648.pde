
size (650, 650);
background (189, 216, 217);
noStroke ();
rect (100, 500, 400, 400);
rect (400, 400, 400, 400);
rect (0, 575, 100, 100); 
fill (149, 149, 149);
triangle (100, 255, 650, 400, 640, 645);
fill (0, 0, 0);
rect (0, 230, 500, 350);
fill (189, 216, 217);
triangle (0, 300, 200, 400, 0, 0);
//chão e muros
fill (191, 191, 191);
strokeWeight (1);
rect (70, 100, 480, 480);
fill (255, 20, 20);
noStroke ();
rect (70, 100, 480, 30);
stroke (0);
line (70, 130, 550, 130);
//parte vermelha
noStroke ();
fill (80, 51, 8);
rect (70, 400, 480, 180);
//parte marrom
fill (255, 255, 255);
rect (75, 405, 470, 170);
//quadrado branco
for (int j = 0; j < 6; j++)
  for (int i = 0; i < 15; i++)
  {
    fill (random (255), random (255), random (255));
    rect (75+i*30, 410+j*29, 15, 22);
    fill (random (255), random (255), random (255));
    rect (85+i*30, 405+j*29, 15, 24);
    fill (random (255), random (255), random (255));
    rect (98+i*30, 408+j*29, 15, 25);
  }
//livros
fill (250, 245, 146, 200);
rect (75, 405, 470, 170);
//parte amarela nota: largura = 395)
stroke (80, 51, 8);
strokeWeight (5);
line (170, 405, 170, 575);
line (269, 405, 269, 575);
line (365, 405, 365, 575);
line (460, 405, 460, 575);
//vertical
line (72, 430, 547, 430);
line (72, 460, 547, 460);
line (72, 490, 547, 490);
line (72, 520, 547, 520);
line (72, 550, 547, 550);
//arrumar tamanhos
textSize(30);
fill(191, 191, 191);
text(" L I V R A R I A   D A   V I L A", 85, 130);
fill (80, 51, 8);
line (71, 576, 546, 578);
textSize(15);
fill(0,0,0);
text("Maria Fernanda Pietrobelli, Computação 1", 150, 630);
