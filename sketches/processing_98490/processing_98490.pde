
//Laura Gafuri
//Trabalho de Conclusão de Disciplina - Interação 

int cont=1;
int xgrama;
int ygrama; 

void setup() {
  size (200, 200);
}

void draw() {
  background (72, 190, 247); //cor do céu
  noStroke();
  fill (39, 149, 15); //cor da grama
  rect (0, 168, 200, 200); //grama 
  stroke (60, 109, 2);

  //Nome
  fill (255);
  textSize(12);
  text("Laura - 2013", 120, 195);

  for (int xgrama=0; xgrama<1000; xgrama=xgrama+3) { //repetição do desenho da grama
    for (int ygrama=168; ygrama<1000; ygrama=ygrama+3) {
      line (xgrama, ygrama, xgrama+2, ygrama+3);
    }
  }


  fill (255);
  textSize(12);
  text("Laura - 2013", 120, 195);

  noStroke();
  fill(250, 255, 116);
  rect (20, 50, 120, 120); //parte da casa maior
  fill(#F7EF4B); 
  rect (140, 70, 50, 100); //parte da casa menor
  //janelas
  fill (208, 245, 236); 
  rect (30, 80, 35, 30); //janela 1
  rect (90, 80, 35, 30); //janela 2
  rect (150, 100, 20, 35); //janela 3 - parte menor
  //soleiras - janelas
  fill (93, 66, 33);
  rect (30, 80, 35, 5); //horizontal superior - janela 1
  rect (30, 105, 35, 5); //horizontal inferior - janela 1
  rect (30, 93, 35, 3); //central horizontal - janela 1
  rect (30, 80, 5, 30); //vertical esquerda - janela 1
  rect (63, 80, 5, 30); //vertical direita - janela 1
  rect (48, 80, 3, 30); //central vertical - janela 1
  rect (90, 80, 35, 5); // horizontal superior - janela 2
  rect (90, 105, 35, 5); //horizontal inferior - janela 2
  rect (90, 93, 35, 3); //central horizontal - janela 2
  rect (90, 80, 5, 30); //vertical esquerda - janela 2
  rect (123, 80, 5, 30); //vertical direita - janela 2
  rect (107, 80, 3, 30); //central vertical - janela 2
  rect (150, 100, 20, 5); //horizontal superior - janela 3
  rect (150, 132, 20, 5); //horizontal inferior - janela 3
  rect (150, 116, 20, 3); //central horizontal - janela 3
  rect (150, 100, 5, 35); //vertical esquerda - janela 3
  rect (167, 100, 5, 37); //vertical direita - janela 3
  rect (159, 100, 3, 35); //central vertical - janela 3
  //porta
  fill (93, 66, 33);
  rect (65, 120, 30, 50); //tábua da porta
  rect (60, 165, 40, 5); //soleira
  //maçaneta
  fill (#353B3A);
  rect (68, 145, 5, 10); //parte principal 
  fill (#879390);
  ellipse (70, 148, 3, 3); 
  //telhado
  fill (235, 244, 245);
  rect (10, 50, 140, 15); //telhado parte maior
  rect (140, 60, 55, 15); //telhado parte menor
  //chaminé
  fill (#F5EC3B);
  rect (162, 33, 15, 27);  //chaminé
  fill (235, 244, 245);
  rect (158, 33, 22, 8); //acabamento



  noStroke();
  fill(250, 255, 116);
  rect (20, 50, 120, 120); //parte da casa maior
  fill(#F7EF4B); 
  rect (140, 70, 50, 100); //parte da casa menor
  //janelas
  fill (208, 245, 236); 
  rect (30, 80, 35, 30); //janela 1
  rect (90, 80, 35, 30); //janela 2
  rect (150, 100, 20, 35); //janela 3 - parte menor
  //soleiras - janelas
  fill (93, 66, 33);
  rect (30, 80, 35, 5); //horizontal superior - janela 1
  rect (30, 105, 35, 5); //horizontal inferior - janela 1
  rect (30, 93, 35, 3); //central horizontal - janela 1
  rect (30, 80, 5, 30); //vertical esquerda - janela 1
  rect (63, 80, 5, 30); //vertical direita - janela 1
  rect (48, 80, 3, 30); //central vertical - janela 1
  rect (90, 80, 35, 5); // horizontal superior - janela 2
  rect (90, 105, 35, 5); //horizontal inferior - janela 2
  rect (90, 93, 35, 3); //central horizontal - janela 2
  rect (90, 80, 5, 30); //vertical esquerda - janela 2
  rect (123, 80, 5, 30); //vertical direita - janela 2
  rect (107, 80, 3, 30); //central vertical - janela 2
  rect (150, 100, 20, 5); //horizontal superior - janela 3
  rect (150, 132, 20, 5); //horizontal inferior - janela 3
  rect (150, 116, 20, 3); //central horizontal - janela 3
  rect (150, 100, 5, 35); //vertical esquerda - janela 3
  rect (167, 100, 5, 37); //vertical direita - janela 3
  rect (159, 100, 3, 35); //central vertical - janela 3
  //porta
  fill (93, 66, 33);
  rect (65, 120, 30, 50); 
  rect (60, 165, 40, 5);
  //maçaneta
  fill (#353B3A);
  rect (68, 145, 5, 10);
  fill (#879390);
  ellipse (70, 148, 3, 3);
  //telhado
  fill (235, 244, 245);
  rect (10, 50, 140, 15); //telhado parte maior
  rect (140, 60, 55, 15); //telhado parte menor
  //chaminé
  fill (#F5EC3B);
  rect (162, 33, 15, 27); 
  fill (235, 244, 245);
  rect (158, 33, 22, 8);
  //nenezinho
  if (cont <= 1) {
    fill (255);
    textSize(12);
    text("Laura - 2013", 120, 195);
    noStroke();
    fill (0);
    ellipse (30, 145, 8, 8); //cabeça
    ellipse (30, 154, 6, 14); //corpo
    //braço esquerdo
    pushMatrix (); //abre a matriz
    rotate (-PI*25/360); //rotaciona a elipse
    ellipse (0, 158, 3, 10);
    popMatrix (); //fecha matriz
    //braço direito
    pushMatrix ();
    translate (40, 0); //transporta o objeto para qualquer lugar da tela
    rotate (PI*25/360); 
    ellipse (20, 154, 3, 10);
    popMatrix ();
    // perna direita 
    pushMatrix ();
    translate (0, 50);
    rotate (-PI*25/360); 
    ellipse (7, 119, 4, 15);
    popMatrix ();
    //perna esquerda
    pushMatrix ();
    translate (0, 50);
    rotate (PI*25/360);
    popMatrix (); 
    ellipse (28, 165, 4, 15);
    pushMatrix ();
    // translate (0, 50);
    // rotate (PI*25/360);
    //cont = cont + 1;
  }
  //criança
  else if (cont <= 2) {
    fill (255);
    textSize(12);
    text("Laura - 2013", 120, 195);
    noStroke(); 
    fill (39, 149, 15); //cor da grama
    fill (0);
    ellipse (30, 130, 13, 13); //cabeça
    //cabelo na cabeça
    fill (184, 115, 51);
    ellipse (30, 125, 11, 4); 
    ellipse (25, 130, 5, 9); 
    fill (0);
    ellipse (30, 145, 10, 20); //corpo
    fill (217, 135, 25);
    ellipse (48, 155, 10, 10); //bola 
    fill (0);
    //braço esquerdo
    pushMatrix (); 
    rotate (-PI*28/360);
    ellipse (4, 145, 15, 5);
    popMatrix ();
    //braço direito
    pushMatrix ();
    translate (40, 0);
    rotate (PI*25/360); 
    ellipse (17, 145, 5, 15);
    popMatrix ();
    // perna direita 
    pushMatrix ();
    translate (0, 50);
    rotate (-PI*25/360); 
    ellipse (10, 110, 5, 30);
    popMatrix ();
    //perna esquerda
    pushMatrix ();
    translate (0, 50);
    rotate (PI*25/360);
    ellipse (10, 110, 10, 30);
    popMatrix ();
    ellipse (27, 155, 5, 30);
    popMatrix ();
    pushMatrix ();
    translate (0, 50);
    rotate (PI*25/360);
    // ellipse (27, 155, 8, 30);
    popMatrix ();
    //cont = cont + 1;
  }
  //adolescente
  else if (cont <= 3) { //obedece a condição "se não""se"
    fill (255);
    textSize(12);
    text("Laura - 2013", 120, 195);
    noStroke();
    fill (39, 149, 15); //cor da grama
    //pessoa
    fill (0);
    ellipse (30, 100, 20, 20); //cabeça
    //cabelo na cabeça
    fill (184, 115, 51);
    ellipse (29, 92, 15, 6); 
    ellipse (22, 97, 5, 13); 
    fill (0);
    ellipse (30, 130, 12, 50); //corpo
    pushMatrix (); 
    rotate (-PI*25/360);
    //braço esquerdo
    ellipse (10, 130, 8, 30);
    popMatrix ();
    pushMatrix ();
    translate (40, 0);
    rotate (PI*25/360);
    //braço direito
    ellipse (10, 125, 8, 30);
    popMatrix ();
    pushMatrix ();
    translate (0, 50);
    rotate (-PI*25/360);
    // perna direita
    ellipse (12, 110, 8, 30);
    popMatrix ();
    pushMatrix ();
    translate (0, 50);
    rotate (PI*25/360);
    ellipse (10, 110, 10, 30);
    popMatrix ();
    //perna esquerda
    ellipse (27, 155, 8, 30);
    pushMatrix ();
    translate (0, 50);
    rotate (PI*25/360);
    ellipse (27, 155, 8, 30);
    popMatrix ();
    //skate 
    fill (240, 15, 15);
    rect (46, 135, 4, 30);
    ellipse (46, 137, 8, 8);
    ellipse (46, 167, 8, 8);
    fill (0); //cor das rodinhas
    ellipse (52, 142, 6, 6); //rodinha 1
    ellipse (52, 162, 6, 6); //rodinha 2
    //cont = cont + 1;
  }
  //jovens
  else if (cont <= 4) {
    fill (255);
    textSize(12);
    text("Laura - 2013", 120, 195);
    noStroke();
    fill (39, 149, 15); //cor da grama
    //pessoa 1
    fill (0);
    ellipse (30, 100, 20, 20); //cabeça 
    //cabelo na cabeça
    fill (184, 115, 51);
    ellipse (29, 92, 15, 6); 
    ellipse (22, 97, 5, 13); 
    fill (0);
    ellipse (30, 130, 12, 50); //corpo 
    //braço esquerdo
    pushMatrix (); 
    rotate (-PI*25/360);
    ellipse (10, 130, 8, 30);
    popMatrix (); 
    //braço direito
    pushMatrix ();
    translate (40, 0);
    rotate (PI*25/360);
    ellipse (10, 125, 8, 30);
    popMatrix (); 
    // perna direita
    pushMatrix ();
    translate (0, 50);
    rotate (-PI*25/360);
    ellipse (12, 110, 8, 30);
    popMatrix (); 
    //perna esquerda
    pushMatrix ();
    translate (0, 50);
    rotate (PI*25/360);
    popMatrix ();
    ellipse (27, 155, 8, 30);
    //pessoa 2
    fill (0);
    ellipse (70, 100, 20, 20); //cabeça 
    fill (240, 15, 15);
    ellipse (80, 95, 5, 5); //rabicó
    fill (111, 66, 66);
    ellipse (84, 100, 5, 17); //cabelo
    //cabelo na cabeça
    ellipse (69, 93, 15, 6);
    ellipse (75, 97, 5, 12); 
    ellipse (78, 100, 5, 9);
    fill (0);
    ellipse (70, 130, 12, 50); //corpo 
    //braço esquerdo
    pushMatrix (); 
    rotate (-PI*25/360);
    ellipse (48, 138, 8, 30);
    popMatrix (); 
    //braço direito
    pushMatrix ();
    translate (40, 0);
    rotate (PI*25/360);
    ellipse (49, 118, 8, 30);
    popMatrix (); 
    // perna direita
    pushMatrix ();
    translate (0, 50);
    rotate (-PI*25/360);
    ellipse (50, 119, 8, 30);
    popMatrix (); 
    //perna esquerda
    pushMatrix ();
    translate (0, 50);
    rotate (PI*25/360);
    ellipse (87, 90, 8, 30);
    popMatrix ();
    //coração
    fill (240, 15, 15);
    textSize(25);
    text("♥", 44, 117);
    //cont = cont + 1;
  }
  //vovozinhos
  else if (cont <= 5) {
    fill (255);
    textSize(12);
    text("Laura - 2013", 120, 195);
    noStroke();
    fill (39, 149, 15); //cor da grama
    //coração
    fill (240, 15, 15);
    textSize(125);
    text("♥", 13, 137);
    //pessoa 1
    fill (0);
    ellipse (30, 100, 20, 20); //cabeça 
    //cabelo na cabeça
    fill (255);
    ellipse (29, 92, 15, 6); 
    ellipse (22, 97, 5, 13); 
    fill (0);
    ellipse (30, 130, 12, 50); //corpo 
    //braço esquerdo
    pushMatrix (); 
    rotate (-PI*25/360);
    ellipse (10, 130, 8, 30);
    popMatrix (); 
    //braço direito
    pushMatrix ();
    translate (40, 0);
    rotate (PI*25/360);
    ellipse (10, 125, 8, 30);
    popMatrix (); 
    // perna direita
    pushMatrix ();
    translate (0, 50);
    rotate (-PI*25/360);
    ellipse (12, 110, 8, 30);
    popMatrix (); 
    //perna esquerda
    pushMatrix ();
    translate (0, 50);
    rotate (PI*25/360);
    popMatrix ();
    ellipse (27, 155, 8, 30);
    //pessoa 2
    fill (0);
    ellipse (70, 100, 20, 20); //cabeça 
    fill (255);
    ellipse (81, 105, 5, 17); //cabelo
    //cabelo na cabeça
    ellipse (69, 93, 15, 6);
    ellipse (75, 97, 5, 14); 
    ellipse (78, 99, 5, 14);
    fill (0);
    ellipse (70, 130, 12, 50); //corpo 
    //braço esquerdo
    pushMatrix (); 
    rotate (-PI*25/360);
    ellipse (48, 138, 8, 30);
    popMatrix (); 
    //braço direito
    pushMatrix ();
    translate (40, 0);
    rotate (PI*25/360);
    ellipse (49, 118, 8, 30);
    popMatrix (); 
    // perna direita
    pushMatrix ();
    translate (0, 50);
    rotate (-PI*25/360);
    ellipse (50, 119, 8, 30);
    popMatrix (); 
    //perna esquerda
    pushMatrix ();
    translate (0, 50);
    rotate (PI*25/360);
    ellipse (87, 90, 8, 30);
    popMatrix ();
    fill (184, 115, 51);
    //bengala vovô 
    rect (14, 137, 3, 33);
    ellipse (17, 137, 5, 5); 
    //bengala vovó 
    rect (81, 137, 3, 33);
    ellipse (81, 137, 5, 5);
    //cont = cont + 1;
  }
  //partiu 
  else if (cont <= 6) {
    fill (255);
    textSize(12);
    text("Laura - 2013", 120, 195);
    noStroke();
    fill (39, 149, 15); //cor da grama
    //coração
    fill (240, 15, 15);
    textSize(235);
    text("♥", 05, 157);
    //pessoa 1
    fill (0);
    ellipse (30, 100, 20, 20); //cabeça 
    //cabelo na cabeça
    fill (255);
    ellipse (22, 97, 5, 6);
    ellipse (22, 101, 7, 6); 
    fill (0);
    ellipse (30, 130, 12, 50); //corpo 
    //braço esquerdo
    pushMatrix (); 
    rotate (-PI*25/360);
    ellipse (10, 130, 8, 30);
    popMatrix (); 
    //braço direito
    pushMatrix ();
    translate (40, 0);
    rotate (PI*25/360);
    ellipse (10, 125, 8, 30);
    popMatrix (); 
    // perna direita
    pushMatrix ();
    translate (0, 50);
    rotate (-PI*25/360);
    ellipse (12, 110, 8, 30);
    popMatrix (); 
    //perna esquerda
    pushMatrix ();
    translate (0, 50);
    rotate (PI*25/360);
    popMatrix ();
    ellipse (27, 155, 8, 30);
    //cruz 
    fill (255); 
    rect (145, 130, 5, 40); // mastro
    rect (135, 140, 25, 5); // apoio
    //bengala vovô 
    fill (184, 115, 51);
    rect (14, 137, 3, 33);
    ellipse (17, 137, 5, 5);
    //cont = 1;
  }
}
void mouseClicked() { //não compreende o void(), se não trava a interatividade
  cont ++;
  if (cont == 7) 
    cont =1;
}
