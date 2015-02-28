
//Lya Campozano - DEZ/2013 - Trabalho 2 - Algoritmo

/* Este desenho representam trÃªs coisas boas que aconteceram neste ano de 2013
 1º Simboliza a aquisicao da minha casa. Depois de 28 anos, finalmente a casa
 agora e minha e esta¡ documentada em meu nome.
 2º A vinda para Curitiba, sempre quis vir para a cidade a passeio e agora
 eu moro aqui; e,
 3º O MARAVILHOSO, estrondoso, MAGNIFICO, show d' O Teatro MA¡gico. Faziam
 mais de dois anos que eu nao ia a  um show deles e este foi simplesmente
 ESPETACULAR, como eles dizem: "So para Raros!"*/
 
 
int y =0, x = 0;

void setup()
{
  
  size(1200, 600);
  smooth();
  background(55,55,155);

for (int y = 0; y <=500; y += 15)
{
  for(int x = 0; x<=500; x += 15)
  {
    if (x <= 500)
    {
      line(x,y,x-5,y-5);
    }
  }
}

  strokeWeight(10); //CalÃ§adas (fundo)
  stroke(15);
  fill(98, 58, 38);
  rect(-20, 450, 700, 400);

  strokeWeight(5);//TriÃ¢ngulo vermelho (fundo)
  stroke(255);
  fill(255, 0, 0);
  triangle(300, 700, 1500, 700, 1850, -500);

  strokeWeight(3);//TriÃ¢ngulo roxo (fundo)
  stroke(255);
  fill(90, 30, 160);
  triangle(-10, -10, 600, 500, 1300, -10);

  //Ã�nibus
  strokeWeight(2);
  fill(29, 49, 139);
  rect(150, 385, 90, 60, 5);
  fill(98);
  rect(240, 385, 5, 60, 5);
  rect(245, 385, 5, 60, 5);
  rect(250, 385, 5, 60, 5);
  rect(255, 385, 5, 60, 5);
  rect(260, 385, 5, 60, 5);
  fill(29, 49, 139);
  rect(265, 385, 50, 60, 5);
  fill(95);
  rect(315, 385, 5, 60, 5);
  rect(320, 385, 5, 60, 5);
  rect(325, 385, 5, 60, 5);
  rect(330, 385, 5, 60, 5);
  fill(29, 49, 139);
  rect(335, 385, 70, 60, 5);
  
  //Janelas (bus)
  strokeWeight(3);
  fill(180);
  rect(170, 395, 15, 13, 2);
  rect(185, 395, 15, 13, 2);
  rect(200, 395, 15, 13, 2);
  rect(215, 395, 15, 13, 2);

  rect(270, 395, 10, 13, 2);
  rect(280, 395, 10, 13, 2);
  rect(290, 395, 10, 13, 2);
  rect(300, 395, 10, 13, 2);

  rect(340, 395, 10, 13, 2);
  rect(350, 395, 10, 13, 2);
  rect(360, 395, 18, 7, 2);
  rect(360, 402, 9, 6, 2);
  rect(369, 402, 9, 6, 2);
  rect(377, 395, 20, 13, 2);

  //Rodas (bus)
  fill(0);
  stroke(0);
  ellipseMode(CENTER);
  ellipse(180, 445, 15, 15);
  ellipse(220, 445, 15, 15);
  ellipse(290, 445, 15, 15);
  ellipse(350, 445, 15, 15);
  ellipse(390, 445, 15, 15);
  fill(158);
  noStroke();
  ellipse(180, 445, 7, 7);
  ellipse(220, 445, 7, 7);
  ellipse(290, 445, 7, 7);
  ellipse(350, 445, 7, 7);
  ellipse(390, 445, 7, 7);

  //Portas
  fill(150);
  rect(172, 412, 15, 28, 2);
  rect(212, 412, 15, 28, 2);
  rect(282, 412, 15, 28, 2);
  rect(342, 412, 15, 28, 2);
  rect(382, 412, 15, 28, 2);
  fill(255);
  ellipse(180, 420, 11, 11);
  ellipse(220, 420, 11, 11);
  ellipse(290, 420, 11, 11);
  ellipse(350, 420, 11, 11);
  ellipse(390, 420, 11, 11);
  fill(255, 0, 0);
  stroke(2);
  text("5", 176, 425);
  text("4", 216, 425);
  text("3", 286, 425);
  text("2", 346, 425);
  text("1", 386, 425);

  //Casa
  stroke(255);
  fill(55, 55, 255);
  rect(850, 400, 70, 110);
  fill(55, 55, 255);
  rect(920, 400, 200, 110);
  fill(77, 16, 16);
  triangle(850, 400, 920, 400, 885, 330);
  fill(33, 2, 2);
  quad(885, 330, 920, 400, 1120, 400, 1120, 330);
  rect(870, 440, 30, 70);
  fill(116, 166, 206);
  ellipse(970, 430, 70, 30);
  ellipse(1070, 430, 70, 30);


  //Olho Esquerdo
  /*strokeWeight(2);
   stroke(255);
   fill(222);
   arc(500,150,100,100,PI/6,5*PI/6);
   arc(500,200,100,100,7*PI/6,11*PI/6);
   ellipseMode(CENTER);
   stroke(70,126,1,200);
   fill(70,126,18,200);
   ellipse(500,175,40,40);
   fill(0);
   stroke(0);
   ellipse(500,175,5,5);
   
   //Olho Direito
   strokeWeight(2);
   stroke(255);
   fill(222);
   arc(650,150,100,100,PI/6,5*PI/6);
   arc(650,200,100,100,7*PI/6,11*PI/6);
   ellipseMode(CENTER);
   stroke(70,126,1,200);
   fill(70,126,18,200);
   ellipse(650,175,40,40);
   fill(0);
   stroke(0);
   ellipse(650,175,5,5);*/

  //Maquiagem
  stroke(0);
  fill(0);
  quad(450, 185, 500, 210, 550, 185, 500, 220);
  triangle(490, 215, 510, 215, 500, 250);
  quad(600, 185, 650, 210, 700, 185, 650, 220);
  triangle(640, 215, 660, 215, 650, 250);

  noFill();
  strokeWeight(8);
  arc(500, 180, 120, 100, 7*PI/6, 11*PI/6);
  arc(650, 180, 120, 100, 7*PI/6, 11*PI/6);
  fill(0);
  quad(440, 150, 500, 120, 550, 140, 500, 70);
  quad(590, 150, 650, 120, 700, 140, 650, 70);
  ellipse(420, 180, 15, 15);
  ellipse(425, 205, 10, 10);
  ellipse(430, 225, 5, 5);
  triangle(720, 180, 730, 190, 710, 210);
  ellipse(690, 240, 5, 5);
   }
   color cor()
   {
   return color(random(150),random(255),random(90));
 }

void olhos()
{
  //Direito
  strokeWeight(2);
  stroke(255);
  fill(222);  
  arc(500,150,100,100,PI/6,5*PI/6);
  arc(500,200,100,100,7*PI/6,11*PI/6);
  ellipseMode(CENTER);
  stroke(70,126,1,200);
  fill(cor());
  ellipse(500,175,40,40);
  fill(0);
  stroke(0);
  ellipse(500,175,5,5);

//Esquerdo
  strokeWeight(2);
  stroke(255);
  fill(222);
  arc(650,150,100,100,PI/6,5*PI/6);
  arc(650,200,100,100,7*PI/6,11*PI/6);
  ellipseMode(CENTER);
  stroke(70,126,1,200);
  fill(cor());
  ellipse(650,175,40,40);
  fill(0);
  stroke(0);
  ellipse(650,175,5,5);
}    

void onibus()
{   
  strokeWeight(2);
  stroke(255);
  fill(29, 49, 139);
  rect(150, 385, 90, 60, 5);
  fill(98);
  rect(240, 385, 5, 60, 5);
  rect(245, 385, 5, 60, 5);
  rect(250, 385, 5, 60, 5);
  rect(255, 385, 5, 60, 5);
  rect(260, 385, 5, 60, 5);
  fill(29, 49, 139);
  rect(265, 385, 50, 60, 5);
  fill(95);
  rect(315, 385, 5, 60, 5);
  rect(320, 385, 5, 60, 5);
  rect(325, 385, 5, 60, 5);
  rect(330, 385, 5, 60, 5);
  fill(29, 49, 139);
  rect(335, 385, 70, 60, 5);
}
void janelas()
{
  strokeWeight(3);
  fill(180);
  rect(170, 395, 15, 13, 2);
  rect(185, 395, 15, 13, 2);
  rect(200, 395, 15, 13, 2);
  rect(215, 395, 15, 13, 2);

  rect(270, 395, 10, 13, 2);
  rect(280, 395, 10, 13, 2);
  rect(290, 395, 10, 13, 2);
  rect(300, 395, 10, 13, 2);

  rect(340, 395, 10, 13, 2);
  rect(350, 395, 10, 13, 2);
  rect(360, 395, 18, 7, 2);
  rect(360, 402, 9, 6, 2);
  rect(369, 402, 9, 6, 2);
  rect(377, 395, 20, 13, 2);
}

void rodas()
{
  fill(0);
  stroke(0);
  ellipseMode(CENTER);
  ellipse(180, 445, 15, 15);
  ellipse(220, 445, 15, 15);
  ellipse(290, 445, 15, 15);
  ellipse(350, 445, 15, 15);
  ellipse(390, 445, 15, 15);
  fill(158);
  noStroke();
  ellipse(180, 445, 7, 7);
  ellipse(220, 445, 7, 7);
  ellipse(290, 445, 7, 7);
  ellipse(350, 445, 7, 7);
  ellipse(390, 445, 7, 7);
}

void portas()
{
  fill(150);
  rect(172, 412, 15, 28, 2);
  rect(212, 412, 15, 28, 2);
  rect(282, 412, 15, 28, 2);
  rect(342, 412, 15, 28, 2);
  rect(382, 412, 15, 28, 2);
  fill(255);
  ellipse(180, 420, 11, 11);
  ellipse(220, 420, 11, 11);
  ellipse(290, 420, 11, 11);
  ellipse(350, 420, 11, 11);
  ellipse(390, 420, 11, 11);
  fill(255, 0, 0);
  stroke(2);
  text("5", 176, 425);
  text("4", 216, 425);
  text("3", 286, 425);
  text("2", 346, 425);
  text("1", 386, 425);
}

void draw()
{
  olhos();
  onibus();
  janelas();
  rodas();
  portas();
}

