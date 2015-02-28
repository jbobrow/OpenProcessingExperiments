

  import processing.opengl.*;  // importa o processador de gráficos openGL para o programa, permite desenho de objectos 3D
  
  
void setup(){     // define a funçao void setup que armazena as configurações gerais do programa
  
  smooth();     // suaviza o desenho, anti aliasing
  size(600,600,OPENGL); // define o tamanho da janela para 600x600 
}               // fecho da funçao void setup
void draw(){    // abertura da funçao de desenho void draw
  
  colorMode(HSB,360,100,100); // define o modo de cor do programa para HSB, Hue, Saturation e Brightness, 360 para Hue, 100 para saturaçao e brilho
  background(0); // define o fundo do ecra para preto, brilho 0
  
  //desenha o objecto 3D
  pushMatrix(); // define e guarda o valor da matriz de localização da imagem ou objecto a desenhar
    translate(width/2,height/2); // traduz a localização base de desenho(0,0) para o centro do ecrã (width/2,height/2);
    rotateX(mouseX * 0.02);  // roda o objecto 3D em X a ser desenhado consoante a posiçao do rato em X multiplicada por 0.02, para o movimento nao ser exagerado
    rotateY(mouseY * 0.02);  // roda o objecto 3D em Y a ser desenhado  consoante a posiçao do rato em Y multiplicada por 0.02, para o movimento nao ser exagerado
    stroke(0,45,45); // define o contorno do objecto 3D para a cor do ponteiro das horas
    strokeWeight(4); // define a grossura do contorno do objecto 3d para 4 pontos
    fill(360);   // pinta o cubo 3D de branco
    lights(); // define uma matriz base de luzes para o objecto 3D
    box(50); // desenha um cubo 3D com 50 de valor de lado que servirá de centro para os ponteiros
   noLights(); // liberta a iluminação 3D e assim não iluminará os outros objectos seguintes segundo ela
  popMatrix(); // assume, guarda, mas liberta o valor da matriz de localização da imagem ou objecto desenhado anteriormente
  
  PFont LCD;         // cria a fonte LCD
  LCD = loadFont("Lcdphone-48.vlw");  // atribui à fonte LCD o tipo de letra Lcdphone-48
  
  noStroke();   // elimina o contorno de desenho para os próximos objectos
  
  int s = second();      // atribui à variavel inteira s o valor actualizado dos segundos em sistema 
  int m = minute();      // atribui à variavel inteira m o valor actualizado dos minutos em sistema
  int h = hour();        // atribui à variavel inteira h o valor actualizado das horas em sistema
  
  s = (int) map(s, 0, 59, 0, 355);        // mapeia o valor de segundos de 0 a 59, para valores entre 0 e 355, rotaçao (nao é 360 porque senao o segundo 59 e 0 coincidiriam em posiçao)
  m = (int) map(m, 0, 59, 0, 355);         // mapeia o valor de minutos de 0 a 59, para valores entre 0 e 355, rotaçao (nao é 360 porque senao o minuto 59 e 0 coincidiriam em posiçao)
  h = (int) map(h, 0, 12, 0, 355);        // mapeia o valor de horas de 0 a 12, para valores entre 0 e 355, rotaçao (nao é 360 porque senao a hora 12 e 0 coincidiriam em posiçao)
    
  if ((hour() > 0)&&(hour() < 12)){      // se o valor das horas for maior que 0 e menor que 12, executa:
      // esta condiçao aumenta ou diminui o brilho do fundo consoante a hora do dia
      int cordia = (int) map(hour(), 0, 12, 0, 100);    // mapeia o valor desde as 0 às 12 horas do dia, e mapeia o para um aumento do valor de brilho
      fill(0,0,cordia);   // pinta os seguintes objectos com o brilho correspondente à hora do dia (das 0 às 12 a luz sobe)
                              
      } else {            // senao se o valor das horas for algum dos restantes (entre 12 e 24) executa:
  
      int cordia2 = (int) map(hour(), 12, 24, 100, 0);    // mapeia o valor desde as 12 às 24 horas do dia, e mapeia o para uma reduçao do valor de brilho
      fill(0,0,cordia2);  // pinta os seguintes objectos com o brilho correspondente à hora do dia (das 12 às 24 a luz desce)
  }                       // fecha as condiçoes da condiçao principal if
 
  rect (0,0,width,50);   // desenha o rectangulo que mostra a luminosidade da hora do dia consoante o seu brilho
  fill(360);          // pinta o texto day brightness de um cinzento de brilho fixo em 75
  
  textFont(LCD,30);         // define o tipo de letra e o tamanho do texto a desenhar de seguida
  text("Day Brightness Meter",width/6,35);         // desenha o texto "day brightness meter" na posiçao horizontal do tamanho do ecra%6 e na posiçao vertical 35

  translate(width/2,height/2);     // traduz a localização base de desenho(0,0) para o centro do ecrã (width/2,height/2);
  
  //segundos:
  stroke(180,50,50);   // define a cor do contorno a desenhar para um azul acinzentado (HSB)
  strokeWeight(1);     // define a grossura do contorno a desenhar para 1 ponto
  pushMatrix();         // define e guarda o valor da matriz de localização da imagem ou objecto a desenhar
    rotate(radians(s));     // roda o objecto a desenhar seguidamente consoante o valor em radianos mapeado anteriormente na variavel s (0,360)
    int bmin_tam = (int) map(second(),0,59,40,70); // mapeia o valor de segundos para um diametro entre 40 e 70 para marcar o progresso num minuto na ellipse
    int bmin_cor = (int) map(second(),0,59,0,360); // mapeia o valor de segundos para uma cor entre H 0 e H 360 para marcar o progresso num minuto na ellipse
    fill(bmin_cor,50,50);  // pinta a bola circundante com a cor correspondente ao mapeamento anterior
    ellipse(0,-200,bmin_tam,bmin_tam);   // desenha a ellipse cujo tamanho aumenta consoante o progresso dos segundos de 0 a 59
    line(0,0,0,-200);      // desenha uma linha (ponteiro para os segundos no centro do ecra com um segundo ponto definido para -200(vertical) para o ponteiro iniciar na posição 0 do relogio, isto porque foi usada a funçao translate
    fill(0);                // preenche a ellipse de mostragem de preto
    ellipse(0,-200,40,40);    // desenha uma ellipse na ponta do ponteiro de segundos onde sera mostrado o valor numerico dos segundos
    fill(180,50,50);          // pinta o texto que mostra o valor dos segundos do mesmo azul do ponteiro do mesmo
    textFont(LCD,20);         // define o tipo de letra e o tamanho do texto a desenhar de seguida
    text(second(),-15,-195);    // desenha o valor de segundos actual do sistema no local do ponteiro dos segundos
  popMatrix();        // assume, guarda, mas liberta o valor da matriz de localização da imagem ou objecto desenhado anteriormente

  //minutos:
  stroke(80,70,70);   // define a cor do contorno a desenhar para um verde alface (HSB)
  strokeWeight(4);     // define a grossura do contorno a desenhar para 4 pontos
  pushMatrix();         // define e guarda o valor da matriz de localização da imagem ou objecto a desenhar
    rotate(radians(m));     // roda o objecto a desenhar seguidamente consoante o valor em radianos mapeado anteriormente na variavel m (0,360)
    line(0,0,0,-150);      // desenha uma linha (ponteiro para os segundos no centro do ecra com um segundo ponto definido para -150(vertical) para o ponteiro iniciar na posição 0 do relogio, isto porque foi usada a funçao translate
    fill(0);                  //preenche a ellipse de mostragem de preto
    ellipse(0,-150,60,60);    // desenha uma ellipse na ponta do ponteiro de minutos onde sera mostrado o valor numerico dos minutos
    fill(80,70,70);          // pinta o texto que mostra o valor dos minutos do mesmo azul do ponteiro do mesmo
    textFont(LCD,30);         // define o tipo de letra e o tamanho do texto a desenhar de seguida
    text(minute(),-20,-140);    // desenha o valor de segundos actual do sistema no local do ponteiro dos minutos
  popMatrix();        // assume, guarda, mas liberta o valor da matriz de localização da imagem ou objecto desenhado anteriormente

  //horas:
  stroke(0,45,45);   // define a cor do contorno a desenhar para um vermelho acinzentado (HSB)
    strokeWeight(8);     // define a grossura do contorno a desenhar para 8 pontos
    pushMatrix();         // define e guarda o valor da matriz de localização da imagem ou objecto a desenhar
      rotate(radians(h));     // roda o objecto a desenhar seguidamente consoante o valor em radianos mapeado anteriormente na variavel m (0,360)
      line(0,0,0,-80);      // desenha uma linha (ponteiro para os segundos no centro do ecra com um segundo ponto definido para -150(vertical) para o ponteiro iniciar na posição 0 do relogio, isto porque foi usada a funçao translate
      fill(0);                  //preenche a ellipse de mostragem de preto
      ellipse(0,-80,80,80);    // desenha uma ellipse na ponta do ponteiro de minutos onde sera mostrado o valor numerico dos minutos
      fill(0,45,45);          // pinta o texto que mostra o valor dos minutos do mesmo azul do ponteiro do mesmo
      textFont(LCD,50);         // define o tipo de letra e o tamanho do texto a desenhar de seguida
      text(hour(),-30,-60);    // desenha o valor de segundos actual do sistema no local do ponteiro dos minutos
    popMatrix();        // assume, guarda, mas liberta o valor da matriz de localização da imagem ou objecto desenhado anteriormente

} // fecha a funçao de desenho void draw


