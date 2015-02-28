
//O trabalho Palacio do Itamaraty de Daniel S. Galvão está licenciado com uma Licença Creative Commons - Atribuição 4.0 Internacional.

//Daniel S. Galvão AU UTFPR S53

//Palacio do Itamarati

//Função
//movimento do mouse
//


boolean condicaoCor;

void setup() {
  size(600, 550);

  condicaoCor = false;
}
int lua;
int ceu;
void draw() {
  background (0, 0, 21);

  // céu
  ceu= 21+mouseY/10;
  background(0, 0, ceu++);

  //lua   

  lua++;
  fill (random(252, 255), random(250, 228), random (146, 75));
  ellipse ( 0+lua++%width, 50, 50, 50);
  noStroke();
  fill (0, 0, ceu);
  ellipse (10+lua++%width, 40, 50, 50);




  // estrelas
  stroke(255);
  for(int a=0; a<50;a++)
  point(random(a, 1000), random(a, 400));
 

  // lago
  stroke(0);
  fill(21, 176, 234);
  rect(0, 380, 600, 390);

  for (int i=0;i<width;i=i+50) {
    lago(i, int(random(150))+380, 300, random(80, 255));
  }
}
void lago(int posX, int posY, int lado, float azul) {
  noStroke();
  fill(21, 100, azul, 50);
  for (int i=0; i<1000; i++)
    ellipse(posX+random(lado), posY+random(lado), random(100), random(10));


  //chao
  stroke(0);
  fill(0, 203, 1);
  quad(0, 380, 0, 520, 600, 390, 600, 380);

  //passarela
  fill(175, 175, 62);
  quad(330, 435, 330, 445, 600, 445, 600, 435);

  //coluna extra
  quad(510, 297, 510, 398, 520, 399, 520, 300 );

  //palacio

  quad(510, 400, 510, 300, 80, 150, 80, 500);

  fill(131, 130, 7);
  quad( 80, 150, 80, 500, 0, 450, 0, 200);

  if (condicaoCor == true)
    fill(0, 0, random(100, 255));
  else
    fill(178, 197, 229);

  quad( 150, 220, 150, 485, 510, 410, 510, 315);
  quad(150, 220, 150, 485, 80, 450, 80, 280);


  //chão extra
  fill(0, 203, 1);
  quad(110, 495, 150, 485, 110, 465, 110, 465);

  //JANELAS
  stroke (125);
  //linhas horizontais
  line(150, 255, 510, 340);
  line(150, 285, 510, 350);
  line(150, 405, 510, 375);
  line(150, 435, 510, 385); 
  line(150, 435, 80, 405); 
  line(150, 405, 80, 385);
  line(150, 285, 80, 330);
  line(150, 255, 80, 315);

  //linhas verticais
  line(115, 250, 115, 465);
  line(122, 245, 122, 473);
  line(130, 235, 130, 475);
  line(140, 225, 140, 479);
  line(190, 230, 190, 477);
  line(225, 237, 225, 469);
  line(290, 258, 290, 457);
  line(310, 263, 310, 452);
  line(363, 278, 363, 440);
  line(378, 280, 378, 437);
  line(418, 292, 418, 430);
  line(425, 294, 425, 428);
  line(433, 295, 433, 425);  
  line(465, 305, 465, 420);
  line(472, 305, 472, 417);
  line(478, 306, 478, 417);
  line(482, 307, 482, 416);
  line(487, 310, 487, 415);


  //colunas
  noStroke();
  fill(175, 175, 62);
  quad(110, 495, 110, 160, 80, 150, 80, 500 );

  quad(160, 175, 160, 483, 180, 480, 180, 183 );
  quad(245, 205, 245, 465, 270, 460, 270, 213 );
  quad(330, 230, 330, 448, 350, 443, 350, 235 );
  quad(390, 250, 390, 435, 410, 430, 410, 255 );
  quad(440, 265, 440, 425, 460, 420, 460, 270 );
  quad(490, 280, 490, 413, 505, 410, 505, 287 );
  quad(540, 297, 540, 403, 550, 400, 550, 300 );

  quad(81, 150, 81, 180, 550, 315, 550, 300 );

  //contorno
  stroke(0);
  line(110, 495, 110, 180);
  line(160, 180, 160, 483);
  line(180, 480, 180, 190);
  line(245, 220, 245, 465);
  line(270, 460, 270, 230);
  line(330, 250, 330, 448);
  line(350, 443, 350, 250);
  line(390, 260, 390, 435);
  line(410, 430, 410, 270);
  line(440, 280, 440, 425);
  line(460, 420, 460, 330);
  line(490, 350, 490, 413);
  line(505, 410, 505, 340);
  line(540, 350, 540, 403);
  line(550, 400, 550, 300);
  line(80, 150, 80, 500);
  line(80, 150, 550, 300);
  line(80, 149, 550, 299);

  // curva
  stroke(175, 175, 62);
  line(110, 180, 110, 230);
  fill(175, 175, 62);
  quad(162, 180, 162, 250, 162, 250, 145, 180);
  quad(180, 190, 180, 250, 180, 250, 203, 190);
  quad(245, 210, 245, 265, 245, 265, 230, 210);
  quad(270, 220, 270, 275, 270, 275, 290, 220);
  quad(330, 250, 330, 295, 330, 295, 315, 230);
  quad(350, 250, 350, 295, 350, 295, 363, 250);
  quad(390, 260, 390, 305, 390, 310, 380, 250);
  quad(410, 260, 409, 318, 410, 315, 425, 270);
  quad(440, 280, 440, 320, 440, 321, 430, 270);
  quad(460, 280, 460, 333, 460, 333, 475, 280);
  quad(490, 290, 490, 333, 490, 333, 483, 290);
  quad(505, 290, 505, 342, 505, 342, 523, 300);
  quad(540, 300, 540, 342, 540, 342, 530, 300);

  quad(520, 300, 520, 320, 520, 320, 530, 310);  
  quad(530, 300, 535, 320, 525, 310, 530, 310);

  noFill();
  stroke(0);
  bezier(110, 240, 115, 180, 160, 180, 160, 270);
  bezier(180, 260, 185, 200, 245, 200, 245, 290);
  bezier(270, 280, 275, 225, 330, 225, 330, 310);
  bezier(350, 300, 355, 245, 390, 245, 390, 330);
  bezier(410, 320, 420, 265, 440, 265, 440, 350);
  bezier(460, 340, 470, 275, 490, 275, 490, 370);
  bezier(505, 345, 515, 290, 540, 290, 540, 370);
  bezier(520, 350, 515, 300, 540, 300, 540, 370);

  //meteoro          

  fill(255, 150);

  ellipse(350, 500, 50, 50);
  noStroke();
  ellipse(350, 500, 40, 40);
  stroke(0);
  ellipse(350, 500, 35, 35);
  noStroke();
  ellipse(350, 500, 30, 35);
  stroke(0);
  ellipse(350, 500, 40, 55);
  ellipse(350, 500, 55, 40);
}
void mousePressed()
{
  if (condicaoCor==true)
    condicaoCor=false;
  else
    condicaoCor=true;
}

