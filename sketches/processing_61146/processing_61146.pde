
PFont myFont; // definiçao tipo letra

float h12; // criar variavel h12

void setup (){ // definiçao set up
  
  size (500, 500); // tamanho da janela
  smooth (); // suavizar elementos
  
  myFont = loadFont ("Acens-48.vlw"); //carregar tipo de letra
  textFont (myFont, 27); // caracterizaçao do tipo de letra

}

void draw (){ // definiçao elementos composiçao
  
  translate (width/2, height/2); // definir centro da janela
  background (15); // fundo 
  
  float h = hour ();// variavel h, definida pelas horas
  float m = minute (); // variavel m, definida pelos minutos
  float s = second (); // variavel s, definida pelos segundos
 
  h12 = h;
 
  int escala = 360; // criar variavel escala
  s = map (s, 0, 59, 0, escala); // mapiar segundos em funçao da escala
  m = map (m, 0, 59, 0, escala); // mapiar minutos em funçao da escala
  h = map (h12, 0, 12, 0, escala); // mapiar horas em funçao da escala
  
  float anguloMinuto = radians (m); // variavel anguloMinuto, definido em radianos
  float anguloHoras = radians (h); // variavel anguloHoras, definido em radianos
  
  println (m); // impressao minutos
  println (h); // impressao horas
  
  //Horas
  noStroke (); // sem contorno
  fill (138); // preenchimentos
  arc (0, 0, 400, 400, 0, anguloHoras); // posiçao e definiçao do arco
  pushMatrix (); //
  rotate (anguloHoras); // rotaçao arco 
  popMatrix ();
  
  //Minutos
  noStroke (); // sem contorno
  fill (150, 205, 205); // preenchimento
  arc (0, 0, 275, 275, 0, anguloMinuto); // posiçao e definiçao do arco
  pushMatrix ();
  rotate (anguloMinuto); // rotaçao arco
  popMatrix ();
  
  //Segundos
  s = second (); // definir s como segundos
  fill (218, 165, 32); // preenchimento
  noStroke (); // sem contorno
  ellipse (0, 0, s*2.5, s*2.5);// posiçao e definiçao da elipse
  
  //Marcadores
  strokeWeight (10); // espessura
  stroke (255); // cor do contorno 
  line (200, 0, 150, 0); // definiçao da linha
  
  strokeWeight (5); // espessura
  stroke (255); // cor do contorno 
  line (0, 200, 0, 190); // definiçao da linha
  
  strokeWeight (5); // espessura
  stroke (255); // cor do contorno 
  line (-200, 0, -190, 0);// definiçao da linha
  
  strokeWeight (5); // espessura
  stroke (255); // cor do contorno 
  line (0, -200, 0, -190);// definiçao da linha
  
  //Relogio Digital
  int M = minute (); // definiçao variavel M como minutos
  int H = hour (); // definiçao variavel H como horas
  
  text (M, 155, 30); // definiçao minutos digitais
  text (H, 155, -15); // definiçao horas digitais
  
}
