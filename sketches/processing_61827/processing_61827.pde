
int hours; // horas 
int minutes; // minutos
int seconds; // segundos
 
 
void setup() { // definições de void setup
  size(500, 500); // tamanho
  colorMode(RGB); // cor
  background(900); // fundo
  smooth(); //definição do contorno
  
}
 
void draw() { // desenhar a imagem 
  
   // obter variáveis ​​do sistema
 hours = hour(); // horas
 minutes = minute(); // minutos
 seconds = second(); // segundos
  
 println("The current time is: " + hours + " hours " + minutes + " minutes" + " and " + seconds + " sec"); // tempo actual
     
    // fixar relógio de 24 horas
  if(hours > 12) {
   hours -= 12;
  }
  
   if (hours > 7 && hours < 13) {  
     background(700,570,350); // fundo
  }
  else if (hours > 13 || hours < 18) {
      background(520,200,160); // fundo
  }
  else {
      background(600); // fundo
  }
 
 
  
    // esboço centro
  translate(250,250);
  rotate(radians(180)); // rotação
 
      // ponteiro das horas " fora "
  pushMatrix(); 
  rotate(radians(30 * hours)); // rotação 
  fill(50); // preenchimento 
  rect(-10,0,10,120); // rectâgulo
  popMatrix();
 
      // ponteiros dos minutos " fora "
  pushMatrix();
  rotate(radians(6 * minutes)); // rotação 
  fill(50); // preenchimento
  rect(-10,0,5,125); // rectângulo
  popMatrix();
 
      // ponteiro dos segundo " fora "
  pushMatrix();
  rotate(radians(6 * seconds)); // rotação
  fill(90); // preenchimento
  rect(-5,0,7,80); // rectâgulo
  popMatrix();
 
    noStroke(); // sem expessura
    noFill(); // sem preenchimento
   
 
      // apontar ao centro
  pushMatrix();
  fill(150, 200); // preenchimento
  ellipse(0,0,350,250); // circulo
  fill(200,200); // preenchimento
  rotate(radians(45)); // rotação
  rect(-75,-75,150,150); // rectâgulo
  fill(205); // preenchimento
  rect(-10,-10,20,20); // rectâgulo
  popMatrix();
   
  noStroke(); // sem expessura
  fill(0); // preenchimento
   
   
      // ponteiros das horas
  pushMatrix();
  rotate(radians(30 * hours));  // 30 * 12 = 360 degrees
  fill(random(0,540),random(0,400),random(0,600));
  ellipse(-5, 30, 5, 5);
  popMatrix();
   
        // ponteiros dos minutos
  pushMatrix();
  rotate(radians(6 * minutes));
  fill(random(0,700),random(0,500),random(0,300));

  popMatrix();
 
      // ponteiros dos segundos
  pushMatrix();
  rotate(radians(6 * seconds)); // rotação
  fill(random(0,200),random(0,205),random(0,295)); // preenchimento
  ellipse(0, 90, 5, 5); // circulo
  popMatrix();
  

  
   
   
 
 
}


