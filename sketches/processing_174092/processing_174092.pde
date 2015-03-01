
float ang = 0, ang2 = 0;
int r = 200, R = 700, verm = 127, verd = 127, azul = 127;

void setup() {
  background(0); 
  size(1200, 700);
  frameRate(1000);
  fill(127);
  rect(900, 0, 300, 700);
  desenhaControle();
}

void draw() {
  noStroke();
  //fill(255);
  //ellipse(500, 350, R, R);
  circuloMenor(r, 1);
  controle();
}

void circuloMenor(float r, float inc) {
  float x = ((R/2)-(r/2))*cos(ang);
  float y = ((R/2)-(r/2))*sin(ang);
  float x2 = 100*cos(ang2);
  float y2 = 100*sin(ang2);
  fill(127);
  //ellipse(x+500, y+350, r, r);  //Debugging
  fill(verm, verd, azul);
  noStroke();
  //line(x+500, y+350, x2+x+500, y2+y+350);  //Debugging
  ellipse(x2+x+500, y2+y+350, 5, 5);
  ang+=inc/500;
  ang2+=-1*(R/r)*inc/500; //-1 utilizado para que a rotação interna fosse inverda da "externa", para que seja fisicamente possível no caso do uso de engrenagens. A proporção R/r é usada, pois o círculo menor, ao percorrer o interior do maior, percorre a circunferência do maior com seu lado exterior.
}                        

void controle() {
  if (keyPressed) {
    if (key == 'r' || key == 'R') {
      verm+=1;
    } else if (key == 'e' || key == 'E') {
      verm-=1;
    } else if (key == 'g' || key == 'G') {
      verd+=1;
    } else if (key == 'f' || key == 'F') {
      verd-=1;
    } else if (key == 'b' || key == 'B') {
      azul+=1;
    } else if (key == 'v' || key == 'V') {
      azul-=1;
    } else if (key == 's' || key == 'S') {
      r = ((r + 1) % 700); //Evitar que seja maior que 700.
    } else if (key == 'a' || key == 'A') {
      r = ((r - 1) % 700);
    } else if (key == 'l' || key == 'L') {
      fill(0);     
      ellipse(500, 350, R+100, R+100); //Limpa a tela
    }
  }


  /*if (mouseY >= 770 &&  //Esquerda //A partir daqui, serão usados condicionais para verificar se o mouse está acima do botão que faz o "X" andar para a esquerda, direita, cima ou baixo.
   mouseY <= 790 &&
   mouseX >= 10 &&
   mouseX <= 30) {
   
   */
}



void desenhaControle() {
  fill(255, 0, 0);
  text("Pressione o R para deixar mais vermelho", 930, 95);
  text("Pressione o E para deixar menos vermelho", 930, 110);
  fill(0, 255, 0);
  text("Pressione o G para deixar mais verde", 930, 145);
  text("Pressione o F para deixar menos verde", 930, 160);
  fill(0, 0, 255);
  text("Pressione o B para deixar mais azul", 930, 195);
  text("Pressione o V para deixar menos azul", 930, 210);
  fill(255);
  text("Pressione o S para aumentar o tamanho", 930, 245);
  text("Pressione o A para diminuir o tamanho", 930, 260);
  
  text("Pressione o L para limpar a tela", 930, 295);

  /*rect(950, 100, 20, 20);
   fill(255);
   textSize(20);
   text("R", 955, 117);*/
}

