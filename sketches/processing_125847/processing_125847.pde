
/*
Separei meu desenho em trÃªs partes. A bandeira dos Estados Unidos, pois gosto muito do seu idioma e pretendo fazer o ciÃªncia sem fronteiras para lÃ¡. Mas o motivo de eu tÃª-la desenhado Ã© que conseguir desenhar as estrelas da bandeira usando um 'for' aninhado me deixou muito feliz. Abaixo da bandeira desenhei o horizonte, pois acho que nÃ£o a coisa melhor do que poder olhar para um cÃ©u e um mar tranquilamente e poder admirar sua beleza. E o desenho da direita, representa uma paisagem chovendo, quando se clica com o mouse a nuvem vai ficando branca conforme chove. A intenÃ§Ã£o erÃ¡ fazer os traÃ§os da chuvaa sumirem quando a nuvem ficasse branca, pois a nuvem branca significa que toda a Ã¡gua jÃ¡ caiu. Mas a melhor coisa que me aconteceu em 2013 foi entrar na UTFPR e aprender a fazer vÃ¡rios desenhos em vÃ¡rias linguagens de programaÃ§Ã£o, e os desenhos representam o que aprendi!

Obs.: Copie e cole meu cÃ³digo no processing da sra., pois como te falei em sala, as minhas funÃ§Ãµes "barco" nÃ£o estÃ£o aparecendo no site, era para ter vÃ¡rios barcos no oceano. Obrigado a atenÃ§Ã£o.

*/
void setup() {
  size(1400, 700);
  //CÃ³digo que desenha a bandeira dos Estados Unidos da AmÃ©rica
  background(0);
  for (int x=0; x<=240; x+=20) {
    rectMode(CORNERS);
    rect(100, x+20, 600, x+40);//define retangulos brancos
  }
  for (int x=0; x<=260; x+=40) {
    rectMode(CORNERS);
    fill(#FF0000);
    rect(100, x+20, 600, x+40);//define retangulos vermelhos
  }
  rectMode(CORNERS);
  fill(#0628CB);
  rect(100, 20, 350, 160);//define retangulo azul
  noStroke();
  fill(250);
  for (int x=5; x<=205; x+=40) {//repete fileira com 6 estrelas
    for (int y=30;y<=150;y+=30) {
      beginShape();
      vertex(x+110, y);
      vertex(x+117, y);
      vertex(x+120, y-5);
      vertex(x+123, y);
      vertex(x+130, y);
      vertex(x+123, y+3);
      vertex(x+130, y+10);
      vertex(x+120, y+5);
      vertex(x+110, y+10);
      vertex(x+117, y+3);
      endShape(CLOSE);
    }
  }
  for (int x=0; x<=160; x+=40) {//repete fileira com cinco estrelas
    for (int y=45;y<=135;y+=30) {
      beginShape();
      vertex(x+135, y);
      vertex(x+142, y);
      vertex(x+145, y-5);
      vertex(x+148, y);
      vertex(x+155, y);
      vertex(x+148, y+3);
      vertex(x+155, y+10);
      vertex(x+145, y+5);
      vertex(x+135, y+10);
      vertex(x+142, y+3);
      endShape(CLOSE);
    }
  }
  textSize(30);
  fill(250);
  textAlign(CENTER);
  text("UNITED STATES OF AMERICA", 350, 320);//escreve o nome da bandeira
  //PrÃ³ximo desenho
  rectMode(CORNERS);
  fill(#A6C1D1);
  rect(700, 0, 1400, 700);//fundo de cÃ©u claro
  //fill(100);
  //noStroke();
  //ellipse(1050, 100, 600, 160);//nuvem cinzenta
  for (int x=700; x<=1400; x+=30) {
    fill(#2E8B3A);
    quad(x, 650, x+30, 600, x+70, 700, x, 700);
  }//grama verde
  stroke(0);
  for (int x=750; x<=1300; x+=60) {
    for (int y=185; y<=600; y+=50) {
      line(x, y+30, x+15, y);
    }
  }
  for (int x=750; x<=1300; x+=60) {
    for (int y=185; y<=600; y+=50) {
      line(x+30, y+45, x+45, y+15);
    }
  }

  fill(corNuvem);
  noStroke();
  ellipse(1050, 100, 600, 160);//nuvem cinzenta

  noStroke();
  fill(#FFB134);
  rectMode(CORNERS);
  rect(0, 350, 700, 700);//cÃ©u alaranjado do lado inferior esquerdo da figura
  rectMode(CORNERS);
  fill(#2589F2);
  noStroke();
  rect(0,550,700,700);//mar
  fill(250);
  nuvens();//desenha as nuvens
  sol();//desenha o sol
  barco(50,600);
  barco(300,600);
  barco(500,580);
  barco(650,630);
  barco(150,650);
  barco(670,550);//desenha os barcos da imagem
}
float corNuvem = 100;
int corChuva = #A6C1D1;

void draw() {
  if (mousePressed==true) {
    corNuvem+=0.5;
    fill(corNuvem);
    noStroke();
    ellipse(1050, 100, 600, 160);//nuvem cinzenta
    for (int x=750; x<=1300; x+=60) {
      for (int y=185; y<=600; y+=50) {
        stroke(corChuva);
        line(x+30, y+45, x+45, y+15);//chuva
      }
    }
  }
  if (corChuva!=0) {
    corChuva=0;
  }
  else {
    corChuva=#A6C1D1;
  }
  fill(corNuvem);
  noStroke();
  ellipse(1050, 100, 600, 160);//nuvem cinzenta
  stroke(0);
}

void sol() {
  stroke(0);
  fill(#FFFF00);
  arc(700,350,250,250,HALF_PI,PI);
}
void nuvens(){
  ellipse(80,400,140,60);
  ellipse(200,450,200,50);
  ellipse(350,400,160,80);
  ellipse(400,450,160,80);
  ellipse(500,430,220,80);
}
void barco(int x, int y){
  fill(#483A01);
  arc(x,y,30,30,0,PI,CHORD);
  fill(250);
  triangle(x,y,x,y-30,x+15,y-15);
}
