
import ddf.minim.*; // importar audio

Minim som; // variavel global
AudioInput in; // variavel global

AudioSample player1; // variavel som 

float volume; // criar variavel volume

float h12; // criar variavel h12

void setup (){ // definição set up
  
  size (500, 500); // tamanho janela
  smooth (); // suavizar elementos
  
  som = new Minim (this);// importar variavel som
  
  player1 = som.loadSample ("27130__pryght-one__harp.wav", 512);
  
  in = som.getLineIn (Minim.MONO, 5);
  
  volume = 0; // definições volume
  
}

void draw (){ // definição elementos composição
  
  translate (width/2, height/2); // definir centro
  
  volume = in.left.get (0)*100;
  
  background (0); // fundo 
  
  float s = second (); // variavel s, definida pelos segundos
  float m = minute (); // variavel m, definida pelos minutos
  float h = hour (); // variavel h, definida pelas horas
  h12 = h;
  
  int rotacao = 360; // criar variavel rotação
  
  s = map (s, 0, 59, 0, rotacao); // mapiar segndos em função da rotação
  m = map (m, 0, 59, 0, rotacao); // mapiar minutos em função da rotação
  h = map (h12, 0, 12, 0, 360); // mapiar horas em função da rotação
  
  //segundos 
  strokeWeight (2); // espessura contorno
  stroke (255); // cor do contorno
  float anguloSegundos = radians (s); // variavel anguloSegundos, definido em radianos
  pushMatrix (); 
  rotate (anguloSegundos);// rotação ponteiros
  line (0, 0, 0, -200); // definições da linha (ponteiro)
  popMatrix ();
  
  pushMatrix ();
  noFill (); // sem preenchimento
  strokeWeight (2); // espessura contorno
  stroke (255); // cor do contorno
  rotate (anguloSegundos); // rotação circulo
  ellipseMode (CENTER); // centrar circulo
  ellipse (0, -220, 20+volume, 20+volume); // definições do circulo
  popMatrix ();
  
  //minutos
  strokeWeight (5); // espessura contorno
  stroke (138, 170, 65); // cor do contorno
  float anguloMinutos = radians (m); // variavel anguloMinutos, definido em radianos
  pushMatrix ();
  rotate (anguloMinutos); // rotação ponteiros
  line (0, 0, 0, -150); // definições da linha (ponteiro)
  popMatrix ();
  
  pushMatrix ();
  strokeWeight (5); // espessura contorno
  stroke (138, 170, 65);// cor do contorno
  noFill (); // sem preenchimento
  rotate (anguloMinutos); // rotação circulo
  ellipseMode (CENTER); // centrar circulo
  ellipse (0, -170, 20+volume, 20+volume); // definições do circulo
  popMatrix ();
  
  //horas
  strokeWeight (5); // espessura contorno
  stroke (138, 170, 65); // cor do contorno
  float anguloHoras = radians (h); // variavel anguloHoras, definido em radianos
  pushMatrix ();
  rotate (anguloHoras); // rotação ponteiros
  line (0, 0, 0, -80); // definições da linha (ponteiro)
  popMatrix ();
  
  pushMatrix ();
  strokeWeight (5); // espessura contorno
  stroke (138, 170, 65); // cor do contorno
  noFill (); // sem preenchimento
  rotate (anguloHoras); // rotação circulo
  ellipseMode (CENTER); // centrar circulo
  ellipse (0, -100, 20+volume, 20+volume); // definições do circulo
  popMatrix ();
  
  //Marcadores
  strokeWeight (5); // espessura
  stroke (255); // cor do contorno 
  line (220, 0, 210, 0); // definiçao da linha
  
  strokeWeight (5); // espessura
  stroke (255); // cor do contorno 
  line (0, 220, 0, 210); // definiçao da linha
  
  strokeWeight (5); // espessura
  stroke (255); // cor do contorno 
  line (-220, 0, -210, 0);// definiçao da linha
  
  strokeWeight (10); // espessura
  stroke (255); // cor do contorno 
  line (0, -230, 0, -210);// definiçao da linha
  
}
  void mousePressed(){
  
  player1.trigger (); // iniciar musica apos pressionar
  
  }


void stop (){
  
  in.close (); // fechar sempre ao concluir
  player1.close (); // fechar sempre ao concluir
  som.stop (); // parar sempre ao concluir
  super.stop (); // parar sempre ao concluir
  
}
