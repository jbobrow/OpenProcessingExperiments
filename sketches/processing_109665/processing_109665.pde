
// FUNÇÃO QUE CRIA A MATRIZ DO CAMPO-MINADO//
//<><><><><><><><><><><><><*><><><><><><><><><><><><

void criaCampoMinado (int matriz[][], int tamanho, int minas) {
  int i, j, k;
 
  for (i = 0; i < tamanho; i++) {
    for (j = 0; j < tamanho; j++) {
      matriz[i][j] = 0;
    }
  }
 
  for (i = 0; i < minas; i++) {
    j = (int)random (1, tamanho+1);
    k = (int)random (1, tamanho+1);
    if (matriz[j][k] == 1) {
      i --;
    }
    if (matriz[j][k] == 0) {
      matriz[j][k] = 1;
    }
  }
}
//<><><><><><><><><><><><><*><><><><><><><><><><><><


  int a, b, cor, dificuldade = 1; // A E B SÃO CONTADORES GENÉRICOS, 
                                 // DIFICULDADE O TAMANHO DA MATRIZ
  color y;                      // PRINT É USADO PARA 'LABELAR' AS COLUNAS
  int[][] matriz;              // MATRIZ É O CAMPO DE JOGO
  int bombas, minas, sorte = 0, lin = -1, col = -1, desenhe = 0;
  boolean clicou = false;  

void setup () {
  size (600, 600);
  noLoop();
  noStroke ();
  background (199, 199, 199);

}



void draw (){
  noLoop();
  textSize (12);

 
  if (dificuldade == 1) { 
    text ("Tecle f para Fácil", 20, 20);
    text ("Tecle m para Médio", 20, 40);
    text ("Tecle d para Difícil", 20, 60);
  }
  
  if (dificuldade != 1) {
    
    if (desenhe == 1) {   
    matriz = new int[dificuldade+2][dificuldade+2];
   
    criaCampoMinado (matriz, dificuldade, minas); 
    
      for (a = 0; a < dificuldade; a ++) {
        for (b = 0; b < dificuldade; b ++) {
          
          fill (a+1, b+1, 0);
          rect (44+b*22, 44+a*22, 20, 20);
        }
      }
      desenhe = 0;
    }
    
    fill (255);
    
    if (sorte == 1) {
      fill (255);
      text (bombas, 51+col*22, 55+lin*22);
      sorte = 0;
    }
   
  }
}

void keyTyped () {
  if (dificuldade == 1) {
    background (199, 199, 199);
    desenhe = 1;
    
      if (key == 'f' || key == 'F') {
         dificuldade = 9;
         minas = 10;
         redraw();
      }
      if (key == 'd' || key == 'D') {
        dificuldade = 20;
        minas = 40;
        redraw();    
      }
      if (key == 'm' || key == 'M') {
        dificuldade = 16;
        minas = 99;
        redraw();    
      }
    }
  }

void mouseClicked () {
  y = get (mouseX, mouseY);
  
  if (blue(y) < 100 && mouseButton == LEFT) {
    a = (int)red(y);
    b = (int)green(y);
    if (matriz[a][b] == 0) {
      fill (255);
      bombas = (matriz[a-1][b-1] + matriz[a-1][b] + matriz[a-1][b+1] + matriz[a][b-1] + matriz[a][b+1] + matriz[a+1][b+1] + matriz[a+1][b-1] + matriz[a+1][b]);
      sorte = 1;
      col = b-1;
      lin = a-1; 
      redraw ();
    }
    else {
     background(199,199,199);
      sorte = 0; desenhe = 0; clicou = false; dificuldade = 1;
      redraw();
    }
  }
  if (mouseButton == RIGHT) {
    fill (0,0,255);
    a = (int)red(y);
    b = (int)green(y);
    text ('☻', 49+(b-1)*22, 58+(a-1)*22);
    redraw();
    fill (255);
  }
}


