
//Gustavo Batista Machado
//O trabalho Estudo GeomÃ©trico de Gustavo Machado estÃ¡ licenciado com uma LicenÃ§a Creative Commons - AtribuiÃ§Ã£o-NÃ£oComercial 4.0 Internacional. Baseado no trabalho disponÃ­vel em http://openprocessing.org/sketch/134527.

//Formas geometricas interativas com mouse e teclado
//Interaja utilizando as teclas 'R', 'G' e 'B' e movimentando o mouse na tela para alterar as formas

//FunÃ§Ã£o determinante da chuva
//Formas geométricas interativas com mouse e teclado
//Interaja utilizando as teclas 'R', 'G' e 'B' e movimentando o mouse na tela para alterar as formas

//Função determinante da chuva
int pingos=1000;
float [] chuvax;
float [] chuvay;

void setup(){
  size(600,600);
  frameRate(10);

//Função chuva
  stroke(255);
  chuvax = new float [pingos];
  chuvay = new float [pingos];
  for(int i=0; i<pingos; i++){
    chuvax[i]=floor(random(-width,width));
    chuvay[i]=floor(random(-height,-10));
  }
}

char letter='a';

void keyPressed(){
  letter=key;
}

void retangulo (){
  rect(int(random(width)), int(random(height)), mouseX/2, mouseY/2);
}

void elipse (){
  ellipse(int(random(width)), int(random(height)), mouseX/2, mouseY/2);
}

void pingo (int i){
  line (chuvax[i], chuvay[i], chuvax[i]+(mouseX/10), chuvay[i]+(mouseY/10));
        chuvax[i]=chuvax[i]+5;
        chuvay[i]=chuvay[i]+8;
        if (chuvay[i] > height) {
          chuvax[i]=floor(random(-width,width));
          chuvay[i]=floor(random(-height,-10));
        }
}
  

void draw(){
  switch(letter){
    //retângulos em fundo vermelho
    case 'R':
    case 'r':
      background (255,0,0);
      for(int i=0; i<20; i++){
      fill(255);
      stroke(255,0,0);
      strokeWeight(4);
      retangulo();
      }
      break;
      
    //elipses em fundo verde
    case 'G':
    case 'g':
      background(0,255,0);
      for(int j=0; j<20; j++){
      fill(255);
      stroke(0,255,0);
      strokeWeight(4);
      smooth();
      elipse();
      } 
      break;
    
    //chuva em fundo azul
    case 'B':
    case 'b':
      background(0,0,255);
      stroke(255);
      strokeWeight(1);
      smooth();
      for(int i=0; i<pingos; i++){
        pingo(i);
      }
      break;
  }
}


