
/*Aluno: Celso Luiz Chane Júnior
  Curso: BSI
  Turma: S73
  Descrição: Este trabalho consiste em representar a música  "Pela Internet" de Gilberto Gill utilizando o programa processing, o qual estamos aprendendo os principais fundamentos nas aulas de algorítimos
  O foco da minha representação foi pegar diversos acontecimentos da músicas e mostra-los atravez de imagens.
  A jangada é a maneira como o "eu-lirico" da música utiliza metaforicamente para navegar na internet.
  O bonequinho preto seria o "eu-lirico", ou internauta
  As bonequinhas rosas são as tietes citadas nas músicas
  O galão de gasolina é uma piada, citando que o internauta havia parado em Helsingue para abastecer
  A carta é a carta que o internauta entregará em caucuta
  Os numeros binarios por cima de tudo são a representação de que tudo na internet é feito em código binario*/

void setup()
{
  size(1000,800);
  background(134,186,255); //cor céu
  smooth();
  //rio
  fill(40, 40, 210);
  rect(0, 510, 1000,290);
  //madeiras da jangada 
  fill(75, 26, 26);//chão
  stroke(0);
  rectMode(CENTER);
  rect(500, 510,500,20,7); 
  rect(495, 520,500,20,7);
  rect(500, 530,500,20,7);
  rect(495, 540,500,20,7);
  rect(500, 550,500,20,7);
  rect(495, 560,500,20,7);
  rect(500, 570,500,20,7);
  rect(495, 580,500,20,7);
  rect(500, 590,500,20,7);
  rect(495, 600,500,20,7);
  rect(500, 610,500,20,7);
  rectMode(CORNER);//mastro
  rect(470,120,20,430,4);
  //bandeira da jangada
  fill(167, 0, 0);
  stroke(0);
  triangle(490, 122, 490, 300, 730, 300); 
  //Sol
  fill(255,200,0);
  noStroke ();
  ellipse(900, 100, 100, 100);
  //Capitão
  fill(0);
  ellipse(720,430,30,30);//cabeça
  stroke(0);
  strokeWeight(5);
  line(720,420,720,480);//tronco
  line(720,450,700,470);//braços
  line(720,450,740,470);
  line(720,480,700,510);//pernas
  line(720,480,740,510);
  //tiete 1
  fill(255,100,253);
  stroke(255,100,253);
  strokeWeight(0);
  ellipse(670,430,30,30);//cabeça
  stroke(255,100,253);
  strokeWeight(5);
  line(670,420,670,480);//tronco
  line(670,450,650,470);//braços
  line(670,450,690,470);
  line(670,480,650,510);//pernas
  line(670,480,690,510);
  //tiete2
  fill(255,100,253);
  stroke(255,100,253);
  strokeWeight(0);
  ellipse(590,450,30,30);//cabeça
  stroke(255,100,253);
  strokeWeight(5);
  line(590,440,590,500);//tronco
  line(590,470,570,490);//braços
  line(590,470,610,490);
  line(590,500,570,530);//pernas
  line(590,500,610,530);
  //gasolina que abasteceu a jangada em Helsingue
  fill(255,40,40);
  stroke(0);
  strokeWeight(3);
  rect(400,500,50,70,12,1,0,0);
  rectMode(CORNERS);
  fill(255);
  strokeWeight(1);
  rect(401,520,449,540);
  fill(0);
  textSize(20);
  text("GÁS",405,539);
  //e-mail pra Calcutá
  rectMode(CORNER);
  fill(255);
  stroke(0);
  rect(300,500,34,20);
  triangle(300,500,318,515,334,500);
    
  //número binários
  textSize(50);
  fill(169, 176, 178, 100);
  text("1010100010101000101010111100100010101000", 0, 30);
  text("0000011111100101010000110110110110011011", 0, 90);
  text("1101001010010000100100101000100011010010", 0, 150);
  text("1110010010110001100010110101001100110110", 0, 210);
  text("1100101011101101010101010111001101001101", 0, 270);
  text("1110010101110011100011100000110101101101", 0, 330);
  text("1110010011101111000110101010010100101101", 0, 390);
  text("1101101011100010110011001101100101010001", 0, 450);
  text("1010100101100110011100101011010111101101", 0, 510);
  text("1010100010101000101010111100100010101000", 0, 570);
  text("1010101010101110001010101010101010100001", 0, 630);
  text("1110101011101101010101010111001101001101", 0, 690);
  text("0000110101101011101110110101010001010110", 0, 750);
  text("1101011010110100110110101001010110000011", 0, 810);
}
