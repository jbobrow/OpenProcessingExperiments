
/**
 * <p>Programa simples para criar e arrastar triângulos sobre a
 * tela. Ilustra técnica para manipulação direta.
 *
 * <p> Uso: 
 * <p> (1) clique e arraste um triângulo para mudar sua posição
 * <p> (2) clique sobre uma região vazia para criar um novo triângulo
 * <p> (3) clique com o botão direito sobre um triângulo para apagá-lo
 **/

// Centros de todos os objetos
int posx [] = {40, 100};
int posy [] = {100, 40};
float floDeslocamentoX;
float floDeslocamentoY;

void setup() {
  size(300,300);
  floDeslocamentoX = 30;
  floDeslocamentoY = 30;
}

void draw() {
  background (200);
  smooth();
  // Descobrir o objeto sob o mouse
  int j = busca (mouseX, mouseY);
  // Desenhar todos os objetos
  for (int i = 0; i < posx.length; i++){
    // Desehar objeto sob o mouse em cor diferente
    if (i == j) fill(255,200,200);
    else fill(255);
    
    //Desenha o triângulo
    triangle(posx[i], posy[i], posx[i] + floDeslocamentoX, posy[i] - floDeslocamentoY, posx[i] + (2 * floDeslocamentoX), posy[i]);
  }
}

//Função que calcula a área de um triângulo
float FCalculaAreaTriangulo (float pX1, float pY1, float pX2, float pY2, float pX3, float pY3) {
  return ( 0.5 * ( (pX1 * pY2) - (pY1 * pX2) + (pY1 * pX3) - (pX1 * pY3) + (pX2 * pY3) - (pY2 * pX3) ) );
}

// Função que retorna o índice do círculo no ponto x,y, ou
// -1 caso não haja nenhum círculo naquela posição
int busca(int pX, int pY) {
  PVector vetV;
  PVector vetV1;
  PVector vetV2;
  PVector vetV3;
  float floLambda1;
  float floLambda2;
  float floLambda3;

  //Percorre todos os triângulos da tela  
  for (int i = 0; i < posx.length; i++) {
    //Inicializa as variáveis
    vetV = new PVector(pX, pY);
    vetV1 = new PVector(posx[i], posy[i]);
    vetV2 = new PVector(posx[i] + floDeslocamentoX, posy[i] - floDeslocamentoY);
    vetV3 = new PVector(posx[i] + (2 * floDeslocamentoX), posy[i]);

    //Calculando lâmbda1
    floLambda1 = FCalculaAreaTriangulo(vetV.x, vetV.y, vetV2.x, vetV2.y, vetV3.x, vetV3.y) / FCalculaAreaTriangulo(vetV1.x, vetV1.y, vetV2.x, vetV2.y, vetV3.x, vetV3.y);

    //Calculando lâmbda2
    floLambda2 = FCalculaAreaTriangulo(vetV1.x, vetV1.y, vetV.x, vetV.y, vetV3.x, vetV3.y) / FCalculaAreaTriangulo(vetV1.x, vetV1.y, vetV2.x, vetV2.y, vetV3.x, vetV3.y);

    //Calculando lâmbda3
    floLambda3 = FCalculaAreaTriangulo(vetV1.x, vetV1.y, vetV2.x, vetV2.y, vetV.x, vetV.y) / FCalculaAreaTriangulo(vetV1.x, vetV1.y, vetV2.x, vetV2.y, vetV3.x, vetV3.y);

    //O ponto só estará dentro do triângulo se os 3 lâmbdas forem positivos
    if ( (floLambda1 > 0.0) && (floLambda2 > 0.0) & (floLambda3 > 0.0) ) {
      return i;
    }
  }
  return -1;
}
  
// Índice do objeto selecionado ou -1 se
// nenhum objeto foi selecionado
int sel = -1;

// Posicao inicial de arraste caso objeto esteja
// selecionado
int x0, y0;

void mousePressed () {
  if (mouseButton == LEFT) {
    // Buscar objeto sob o mouse
    sel = busca(mouseX,mouseY);
    if (sel == -1) {
      // Nenhum objeto selecionado - criar novo objeto
      posx = append (posx, mouseX);
      posy = append (posy, mouseY);
      sel = posx.length - 1;
    }
    // Guardo a posição corrente do mouse
    x0 = mouseX;
    y0 = mouseY;
  } else if (mouseButton == RIGHT) {
    // Remove objeto sob o mouse
    int i = busca(mouseX,mouseY);
    if (i >= 0) { 
      posx[i] = posx [posx.length-1]; posx = shorten(posx);
      posy[i] = posy [posy.length-1]; posy = shorten(posy);
    }
    sel = -1;
  }
}  

void mouseDragged () {
  if (sel>=0) {
    // Arrastar objeto sob o mouse
    posx[sel] += mouseX - x0;
    posy[sel] += mouseY - y0;
    x0 = mouseX;
    y0 = mouseY;
  }
}

void mouseReleased () {
  // Soltar o objeto
  sel = -1;
}
  



