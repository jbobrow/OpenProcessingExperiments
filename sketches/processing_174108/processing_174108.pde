
int sorteado;
float um = 0, dois = 0, tres = 0, quatro = 0, cinco = 0, seis = 0;
int lance = 100;
float rad, rad2, rad3, rad4, rad5, rad6;
float b1, b2, b3, b4, b5, b6;

void graficoPizza () {

  
  rad = um*(2*PI)/lance;
  rad2 = dois*(2*PI)/lance;
  rad3 = tres*(2*PI)/lance;
  rad4 = quatro*(2*PI)/lance;
  rad5 = cinco*(2*PI)/lance;
  rad6 = seis*(2*PI)/lance;

  
  fill(255);
  arc(375, 150, 175, 175, 0, rad, PIE);
  fill(#887D6B);
  arc(375, 150, 175, 175, rad, rad2+rad, PIE);
  fill(#F7C27C);
  arc(375, 150, 175, 175, rad2+rad, rad3 + (rad2+rad), PIE);
  fill(#5E3D5C);
  arc(375, 150, 175, 175, rad3 + (rad2+rad), rad4 + (rad3 + (rad2+rad)), PIE);
  fill(#FF9DD9);
  arc(375, 150, 175, 175, rad4 + (rad3 + (rad2+rad)), rad5 + (rad4 + (rad3 + (rad2+rad))), PIE);
  fill(#20082A);
  arc(375, 150, 175, 175, rad5 + (rad4 + (rad3 + (rad2+rad))), rad6 + (rad5 + (rad4 + (rad3 + (rad2+rad)))), PIE);
}

void texto() {
  fill(225);
  text("Número 1: obtido " + (int)um + " vezes", 80, 30);
  text("Número 2: obtido " + (int)dois + " vezes", 80, 60);
  text("Número 3 : obtido " + (int)tres + " vezes", 80, 90);
  text("Número 4: obtido " + (int)quatro + " vezes", 80, 120);
  text("Número 5: obtido " + (int)cinco + " vezes", 80, 150);
  text("Número 6: obtido " + (int)seis + " vezes", 80, 180);
  fill(255);
  rect(50, 14, 20, 20);
  fill(#887D6B);
  rect(50, 44, 20, 20);
  fill(#F7C27C);
  rect(50, 74, 20, 20);
  fill(#5E3D5C);
  rect(50, 104, 20, 20);
  fill(#FF9DD9);
  rect(50, 134, 20, 20);
  fill(#20082A);
  rect(50, 164, 20, 20);
}

void graficoBarra() {

  b1 = (um*400)/lance;
  b2 = (dois*400)/lance;
  b3 = (tres*400)/lance;
  b4 = (quatro*400)/lance;
  b5 = (cinco*400)/lance;
  b6 = (seis*400)/lance;

  fill(255);
  rect(50, 395, 50, b1*(-1));
  fill(#887D6B);
  rect(120, 395, 50, b2*(-1));
  fill(#F7C27C);
  rect(190, 395, 50, b3*(-1));
  fill(#5E3D5C);
  rect(260, 395, 50, b4*(-1));
  fill(#FF9DD9);
  rect(330, 395, 50, b5*(-1));
  fill(#20082A);
  rect(400, 395, 50, b6*(-1));
}

void setup () {
  size(500, 400);
  background(127);

  //Simulação do lançamento do dado de 6 lados.
  
  for (int i = 0; i < lance; i++) {
    sorteado = (int(random(6)));
    if (sorteado == 1)
      um++;
    else if (sorteado == 2)
      dois++;
    else if (sorteado == 3)
      tres++;
    else if (sorteado == 4)
      quatro++;
    else if (sorteado == 5)
      cinco++;
    else
      seis++;
  }

  graficoPizza();
  graficoBarra();
  texto();
}





