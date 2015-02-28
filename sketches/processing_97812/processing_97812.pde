
//Laura Gafuri 
//Exercício Fachada (casa) + Interação + Animação

float angle = 0;

void setup () {
  size (200, 200);
  background (127, 159, 242);
}

void draw () {
  int x = mouseX;
  int y = mouseY;

  if (x>=40 && x<=135 && y>=120 && y<=155)
  {
    //Casa de dia
    //Estrutura da casa
    background (127, 159, 242);
    noStroke();
    fill(250, 191, 136);
    rect (30, 100, 100, 100);
    fill(240, 183, 131);
    rect (130, 130, 30, 90);

    //grama e árvore
    noStroke();
    fill(48, 216, 94);
    rect (0, 195, 200, 80);
    fill (90, 65, 45);
    rect (10, 180, 1, 15);
    fill (36, 85, 10);
    ellipse (10, 180, 15, 15);

    //portas e janelas
    fill (162, 157, 157);
    rect (40, 120, 25, 25);
    rect (90, 120, 25, 25);
    rect (135, 140, 15, 30);
    rect (65, 155, 25, 40);

    //telhado
    fill (235, 244, 245);
    rect (15, 90, 125, 10);
    rect (130, 120, 40, 10);
  }
  else {
    // Casa de noite
    background (29, 10, 206);
    noStroke();
    fill(250, 191, 136);
    rect (30, 100, 100, 100);
    fill(240, 183, 131);
    rect (130, 130, 30, 90);

    //grama e árvore
    noStroke();
    fill(48, 216, 94);
    rect (0, 195, 200, 80);
    fill (90, 65, 45);
    rect (10, 180, 1, 15);
    fill (36, 85, 10);
    ellipse (10, 180, 15, 15);

    //portas e janelas
    fill (237, 200, 50);
    rect (40, 120, 25, 25);
    rect (90, 120, 25, 25);
    rect (135, 140, 15, 30);
    fill (162, 157, 157);
    rect (65, 155, 25, 40);

    //telhado
    fill (235, 244, 245);
    rect (15, 90, 125, 10);
    rect (130, 120, 40, 10);
  } 

  //    background (28, 50, 155);
  //  fill (247, 191, 35);
  //  
  //  rect (40, 120, 25, 25);
  //  rect (90, 120, 25, 25);
  //  rect (135,140,15,30);
  //

  //interação - bugs
  fill (0);
  ellipse (mouseX, mouseY, 15, 5);  
  ellipse (mouseX, mouseY, 5, 10);
  translate(width/2, height/2);
  //vagalumes
  int counter =0 ;

  while (counter<1000) {


    stroke(255);
    strokeWeight(3);
    point(width/2, height/2);
    // Rotaciona as coordenadas do sistema num
    // ângulo determinado por uma variavel
    rotate(radians(angle));
    scale(0.900, 0.900);

    counter++;
  }

  // Criação da animação
  angle += 0.10;
}
