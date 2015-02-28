
void setup() {

  size(500, 450);

  background(172, 198, 247);
}

void draw() {

  scale  (0.5);

  noStroke(); // chão
  fill(70, 70, 70);
  quad(1200, 550, -500, 582, 50, 1100, 1200, 1000);

  noStroke(); // face com parte branca
  fill(147, 36, 63);
  quad(390, 230, 390, 480, 530, 490, 530, 280);

  noStroke(); // parte branca
  fill(220);
  quad(425, 370, 425, 445, 530, 455, 530, 389);

  noStroke(); // janela da parte branca
  fill(100);
  quad(485, 400, 485, 438, 520, 442, 520, 405);
  stroke(140); // sombra
  strokeWeight(4);
  line(486, 402, 519, 407);
  line(518, 407, 518, 440);

  noStroke(); // face com grelha
  fill(106, 27, 46);
  quad(140, 320, 140, 500, 390, 480, 390, 230);

  stroke(210); // janelas da face com grelha
  strokeWeight(2);
  fill(150);
  quad(155, 365, 155, 410, 330, 367, 330, 310);
  quad(155, 440, 155, 465, 330, 437, 330, 405);

  noStroke(); // grelha
  fill(235, 235, 235, 120);
  quad(135, 350, 135, 475, 350, 443, 350, 278);
  fill(220, 220, 220, 120);
  triangle(135, 475, 350, 443, 360, 443);
  fill(250, 250, 250, 120);
  quad(350, 278, 350, 443, 360, 443, 360, 281);

  noStroke(); // face escura com tela
  fill(106, 27, 46);
  size(1100, 900);

  noStroke(); // face escura com tela / bloco frontal
  fill(106, 27, 46);
  quad(530, 280, 530, 530, 700, 525, 700, 250);

  noStroke(); // tela
  fill(235, 235, 235, 80);
  quad(530, 243, 530, 530, 700, 525, 700, 205);

  noStroke(); // face clara com tela
  fill(147, 36, 63);
  quad(700, 250, 700, 525, 830, 528, 830, 304);

  noStroke(); // tela
  fill(255, 255, 255, 80);
  quad(700, 205, 700, 525, 830, 528, 830, 268);

  stroke(210); // janelas maiores da face escura com tela
  strokeWeight(2);
  fill(150);
  quad(564, 330, 564, 380, 643, 370, 643, 320);
  quad(564, 380, 564, 430, 643, 422, 643, 370);
  quad(564, 430, 564, 480, 643, 475, 643, 422);
  quad(564, 480, 564, 530, 643, 527, 643, 475);
  quad(564, 530, 564, 580, 643, 582, 643, 527);

  stroke(210); // janelas menores da face escura com tela
  strokeWeight(2);
  fill(150);
  quad(643, 320, 643, 370, 693, 364, 693, 314);
  quad(643, 396, 643, 446, 693, 442, 693, 390);
  quad(643, 465, 643, 515, 693, 513, 693, 461);

  stroke(225); // janelas da face clara com tela
  strokeWeight(2);
  fill(160);
  quad(708, 315, 708, 363, 821, 390, 821, 350);
  quad(708, 391, 708, 441, 821, 455, 821, 415);
  quad(708, 462, 708, 512, 821, 515, 821, 472);

  noStroke(); // face escura da base
  fill(106, 27, 46);
  quad(530, 530, 530, 579, 564, 580, 564, 529);
  quad(643, 527, 643, 582, 650, 582, 650, 527);

  noStroke(); // face clara da base
  fill(147, 36, 63);
  quad(650, 527, 650, 582, 685, 580, 685, 526);
  quad(710, 526, 710, 578, 765, 572, 765, 527);

  noStroke(); // pilar 1 da base
  fill(220);
  quad(700, 525, 700, 590, 710, 589, 710, 526);
  fill(180);
  quad(685, 526, 685, 589, 700, 590, 700, 525);

  noStroke(); // pilar 2 da base
  fill(220);
  quad(765, 527, 765, 582, 773, 581, 773, 527);
  fill(180);
  quad(752, 527, 752, 581, 765, 582, 765, 527);

  noStroke(); // pilar 3 da base
  fill(220);
  quad(824, 528, 824, 574, 830, 573, 830, 528);
  fill(180);
  quad(813, 528, 813, 574, 824, 574, 824, 528);

  noStroke(); // interior galpão
  fill(73, 106, 66);
  quad(140, 500, 390, 480, 530, 490, 325, 505);

  noStroke(); // pílar 1 do galpão
  fill(220);
  quad(501, 488, 501, 575, 520, 574, 520, 489);
  fill(180);
  quad(485, 487, 485, 575, 501, 575, 501, 488);

  noStroke(); // pilar 2 do galpão
  fill(220);
  quad(429, 483, 429, 577, 448, 577, 448, 484);
  fill(180);
  quad(413, 482, 413, 576, 429, 577, 429, 483);

  noStroke(); // pilar 3 do galpão
  fill(220);
  quad(357, 482, 357, 581, 378, 581, 378, 481);
  fill(180);
  quad(343, 483, 343, 581, 357, 580, 357, 482);

  noStroke(); // pilar 4 do galpão
  fill(220);
  quad(294, 487, 294, 578, 313, 579, 313, 486);
  fill(180);
  quad(283, 488, 283, 577, 294, 578, 294, 487);

  noStroke(); // pilar 5 do galpão
  fill(220);
  quad(148, 500, 148, 571, 163, 572, 163, 501);
  fill(180);
  quad(140, 500, 140, 570, 148, 571, 148, 500);

  for (int y=80; y<=150; y++) {
    
    if (mouseY*2<135)
      ellipse(mouseX*2, mouseY*2, random(10, 50), random(10, 50));

    if (mouseY<=140) 
      fill(mouseX/2); 

    else
      fill(2, 9, 6, 0);
  }
}



