
//declara as variáveis que determinarão a posição X e Y da carinha.
int centroX, centroY;

//função 'setup', executada uma única vez assim que o programa inicia.
void setup(){
  //função 'size' determina o tamanho da janela.
  size(500, 500);
}

//função 'draw', executada em loop enquanto o programa estiver rodando.
void draw(){
  //atribui aas variaveis centroX e centroY a posição do mouse em X e em Y.
  centroX = mouseX;
  centroY = mouseY;
  
  //Essa sequencia desenha a carinha, alternando cor e espessura de linha,
  //a partir das variáveis centroX e centroY
  
  fill(255,255,0);
  strokeWeight(10);
  ellipse(centroX, centroY, 200, 200);
  fill(0);
  noStroke();
  ellipse(centroX-50, centroY-50, 20, 20);
  ellipse(centroX+50, centroY-50, 20, 20);
  noFill();
  strokeWeight(10);
  stroke(0);
  arc(centroX, centroY, 145, 145, radians(0), radians(180));
}



