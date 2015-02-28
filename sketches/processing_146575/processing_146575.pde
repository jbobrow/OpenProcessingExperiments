
      /*¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨*\
      |*¨¨ CREATED BY MSV ¨¨*|
      |*__   27/04/2014   __*|
      \*____________________*/

/*
Releitura da música "Pela Internet" de Gilberto Gil.
  
  Título: Com quantos gigabytes se faz uma jangada?
  Autor: Wyverson Bonasoli de Oliveira
 
 O mar cheio de códigos HTML representa as duas primeiras linhas da música.
 
 Para uma melhor compreensão da minha obra é necessário saber algumas coisas:

    Informações sobre barcos e velas:
        Jangadas são embarcações usadas para navegação costeira e usam velas latinas (triangulares), pois essas permitem navegar em ângulos mais fechados contra o vento. 
        Navios que fazem viagens intercontinentais geralmente usam velas redondas (que na verdade são retangulares, não me pergunte por que são chamadas de redondas!) que dão mais velocidade com vento de popa (vento a favor).
       A música mostra que é possível interações com varias partes do mundo através da internet.
       A Jangada/HD representa essas interações, que podem ser feitas sem se sair de casa (como uma jangada que navega sem sair da região costeira); e usa uma vela redonda para mostrar seu alcance global.


    Fatos histórico-culturais:
        O nome e o último verso da música são claras referências ao samba ‘Pelo Telefone’ de Donga.  Que foi criado em 1916 na casa da Tia Ciata, que ficava na Praça Onze no Rio de Janeiro.
        Uma de suas versões tem um verso que diz:
          O Chefe da polícia
          Pelo telefone manda me avisar
          Que na carioca tem uma roleta para se jogar.
          
       A capacidade do HD (1.916 Gb) e as palavras ‘Donga’ e ‘Tia Ciata’ no mar são uma homenagem à canção ‘Pelo Telefone’.
*/

void setup () {
  size (400, 400);
  smooth();
}


void draw () {
  noCursor();
  frameRate (6);
  
  //Variaveis para os cantos do HD
  float x, y, ax, ay, bx, by, cx, cy, dx, dy, ex, ey, fx, fy, gx, gy;
  
  //x e y com pequenas variações para simular o efeito da jangada balançando no mar
  x = random(94, 95);
  y = random(117, 118);

  ax = 1+x;
  bx = 5+x;
  cx = 79+x;
  dx = 79+x;
  ex = 215+x;
  fx = 208+x;
  gx = 133+x;
  ay = 61+y;
  by = 81+y;
  cy = 167+y;
  dy = 149+y;
  ey = 54+y;
  fy = 72+y;
  gy = 0.5+y;
  
  background (0, 41, 84);
  stroke (100);
  fill (55);
  
  quad (ax, ay, bx, by, cx, cy, dx, dy);
  quad (cx, cy, dx, dy, ex, ey, fx, fy);


  //"Infomar"
  textSize(15);
  textAlign(CENTER);
  int num = 0;
  while (num<40) {
    fill(13, 104, 179);
    text ("<html>", random(0, 390), random(150, 400));
    text ("</body>", random(0, 390), random(150, 400));
    text ("<br>", random(0, 390), random(150, 400));
    text ("<head>", random(0, 390), random(150, 400));
    text ("<title>", random(0, 390), random(150, 400));
    if (num/4 == 0){
      fill (50, 120, 250);
      text ("Tia Ciata", random(0, 390), random(150, 400));
      text ("Donga", random(0, 390), random(150, 400));
    }
    num++;
  }
  
  
  //Céu
  noStroke();
  fill(0, 255, 255);
  rect(0, 0, 400, 130);


  //HD/Jangada
  fill (55, 55, 55, 175);
  quad (ax, ay, bx, by, cx, cy, dx, dy);
  quad (cx, cy, dx, dy, ex, ey, fx, fy);
  fill (170);
  quad (ax, ay, dx, dy, ex, ey, gx, gy);

  //Adesivo
  fill(255);
  beginShape();
  vertex (21.1+x, 66+y);
  vertex (26+x, 54+y);
  vertex (65+x, 35+y);
  bezierVertex (100+x, 40+y, 85+x, 21+y, 86+x, 26+y);
  vertex (126+x, 7+y);
  vertex (140+x, 8.5+y);
  vertex (194+x, 43.5+y);
  vertex (196+x, 54+y);
  vertex (155+x, 82+y);
  bezierVertex (128+x, 80+y, 133+x, 97+y, 135+x, 95+y);
  vertex (94+x, 122+y);
  vertex (72+x, 120+y);
  endShape(CLOSE);

  //Marca e capacidade do HD / Nome e ano da jangada
  rotate(radians(-133));
  textSize(15);
  textAlign(LEFT);
  fill(0);
  text("Seagate", -286, -28);
  textSize (10);
  text ("1.916 Gb", -284, -18);
  rotate(radians(133));

  //partes sem adesivo
  fill (170);
  ellipse (90+x, 75+y, 43, 35);
  ellipse (131+x, 31+y, 15, 12);

  //screws
  stroke (150);
  fill (200);
  ellipse (17+x, 61+y, 5, 5);
  ellipse (79+x, 30.8+y, 4.5, 4.5);
  ellipse (133+x, 4+y, 4, 4);
  ellipse (202+x, 51.5+y, 4.5, 4.5);
  ellipse (146+x, 89+y, 5.5, 5.5);
  ellipse (80+x, 135+y, 6, 6);

  //Main mast
  fill (176, 124, 72);
  noStroke ();
  beginShape();
  vertex (85+x, 75+y);
  vertex (85+x, y-50);
  vertex (95+x, y-50);
  vertex (95+x, 75+y);
  bezierVertex (85+x, 80+y, 87+x, 75+y, 85+x, 75+y);
  endShape();

  //Sail
  stroke (210);
  beginShape();
  fill (255);
  vertex (x+20, y-50);
  bezierVertex (x+160, y-35, x+160, y-50, x+160, y-50);
  vertex (x+160, y+40);
  bezierVertex (x+20, y+50, x+20, y+40, x+20, y+40);
  endShape(CLOSE);
  
  //Sail Paint
  noStroke();
  //red
  fill (255, 0, 0);
  beginShape();
  vertex (x+25, y-45);
  vertex (x+87.5, y-40);
  vertex (x+87.5, y-7.5);
  vertex (x+25, y-7.5);
  endShape(CLOSE);
  //green
  fill(0, 255, 0);
  beginShape();
  vertex (x+92.5, y-39);
  bezierVertex (x+155, y-35, x+155, y-44, x+155, y-42);
  vertex (x+155, y-7.5);
  vertex (x+92.5, y-7.5);
  endShape(CLOSE);
  //yellow
  fill(255, 255, 0);
  beginShape();
  vertex (x+155, y-2.5);
  vertex (x+155, y+35);
  vertex (x+92.5, y+37);
  vertex (x+92.5, y-2.5);
  endShape(CLOSE);
  //blue
  fill(0, 0, 255);
  beginShape();
  vertex (x+25, y-2.5);
  vertex (x+87.5, y-2.5);
  vertex (x+87.5, y+38);
  bezierVertex (x+25, y+40, x+25, y+35, x+25, y+35);
  endShape(CLOSE);

  //Sun
  stroke(245, 245, 218);
  strokeWeight (2);
  int angle = 0;
  float sunX, sunY;
  while (angle < 360) {
    sunX = 350+35*cos(radians(angle));
    sunY = 50+35*sin(radians(angle));
    line(350, 50, sunX, sunY);
    angle+= 20;
  }
  strokeWeight (1);
  noStroke();
  //red
  fill (255, 0, 0);
  arc (350, 50, 40, 40, radians(210), radians(330));
  //yellow
  fill (255, 255, 0);
  triangle (350, 41.8, 369.2, 39, 355, 50);
  arc (350, 50, 40, 40, radians(330), radians(450));
  //green
  fill (50, 212, 50);
  triangle (350, 70, 359.2, 50, 350, 50);
  arc (350, 50, 40, 40, radians(90), radians(210));
  //red
  fill(255, 0, 0);
  triangle (332.8, 39, 342.6, 54, 350, 50);
  //center
  fill (255);
  ellipse (350, 50, 55/3, 55/3);
  fill (0, 127, 255);
  ellipse (350, 50, 15, 15);
}
