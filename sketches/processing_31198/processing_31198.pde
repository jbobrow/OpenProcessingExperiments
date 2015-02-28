
int x[] = new int[4];
int y[] = new int[4];
int n = 0;
int indicePontoAlterado = 0;
int tamElipse = 5;

void setup () {
  size(500,500);
  smooth();
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    //Apaga a figura
    n=0;
  }
  else {
    if (n<4) {
      //Guarda as coordenadas dos 4 pontos para montar a curva bezier
      x[n] = mouseX;
      y[n] = mouseY;
      n++;
    }
    else {
      if (n==4) {
        //Percorre o vetor de pontos para saber qual dos 4 pontos será alterado
        int cont;
        for(cont=0; cont<n; cont++) {
          //Verifica se o mouse foi clicado dentro da elipse
          if (dist(mouseX, mouseY, x[cont], y[cont]) <= tamElipse/2) {
            indicePontoAlterado = cont;
            break;
          }
          else {
            indicePontoAlterado = -1;
          }
        }
      }
    }
  }
}

void mouseDragged() {
  if (n==4) {
    //Seta o novo X e Y do ponto alterado quando a curva bezier já tiver sido desenhada
    if (indicePontoAlterado != -1) {
      x[indicePontoAlterado] = mouseX;
      y[indicePontoAlterado] = mouseY;
    }
  }
}

void draw() {
  int cont;
  background(200);
  PFont font;
  font = loadFont("Arial-BoldMT-14.vlw");
  textFont(font);

  for (cont=0; cont<n; cont++) {
    // desenho dos pontos de controle internos na cor azul
    fill(0,0,255);
    ellipse(x[cont],y[cont],tamElipse,tamElipse);
    fill(255,255,255);
  }
    
  if (n==4) {
    // desenho da curva na cor amarela
    fill(255,255,0);
    bezier (x[0],y[0],x[1],y[1],x[2],y[2],x[3],y[3]);
    fill(255,255,255);
    // desenho das tangentes
    line (x[0],y[0],x[1],y[1]);
    line (x[2],y[2],x[3],y[3]);

    //Exibe mensagem de texto
    text("Arraste um dos pontos para alterar a figura\nClique com o botão direito para apagar a figura.",15,30);
  }
  else {
    //Exibe mensagem de texto
    text("Marque o ponto " + str(n+1) + "\nClique com o botão direito para apagar a figura.",15,30);
  }
}

