
import ddf.minim.*; //importar a biblioteca de som minim
import ddf.minim.signals.*; //importar a biblioteca de som minim
import ddf.minim.analysis.*; //importar a biblioteca de som minim
import ddf.minim.effects.*; //importar a biblioteca de som minim

Minim minim; //variavel para a biblioteca de som
AudioSample som; //variavel para fazer upload de uma sample
AudioSample som1; //variavel para fazer upload de uma sample

float h12; //variavel das horas para ficar ate 12

PFont texto; // variavel para a criação de texto

void setup(){ //definições de setup
  size(500,500); // tamanho da janela
  smooth(); // suavizar as formas
  
  texto = loadFont ("CenturyGothic-48.vlw"); //uplaod do tipo de fonte da variavel texto
  
  minim = new Minim(this); //criação de uma minim de som
som = minim.loadSample ("water.wav", 2048); //upload de uma sample da variavel de som
som1 = minim.loadSample ("Ride.wav", 2048); //upload de uma sample da variavel de som


} 

void draw() { //definições de desenho
  background(0); //definição da cor de fundo
  textFont (texto, 25); // atribuição de valores aa variavel de texto
  stroke (255); //definição da cor da outilne
  text ("Press(B)", 100, 100); // desenho de texto
  text ("Press(C)", 100, 200);// desenho de texto
  text ("Press(m)", 100, 150);// desenho de texto
  translate (width/3, height/3);// mudar o centro de translação 
  
    if(keyPressed) { //atribuição de uma condição .......................
    if (key == 'b' || key == 'B') { //atribuição do comportamento da condição
  
  
  

  background(255); //definição da cor de fundo
  
  
  if (frameCount % 60 == 0){ // sincronizar um som conforme os segundos
som.trigger(); // atribuição do som com os segundos
}
  
  
  float s = second();  // variavel para os segundos
  float m = minute();  // variavel para os minutos
  float h = hour();    // variavel para as horas
  h12 = h%12; // atribuir o valor da variavel h12 para as horas ficarem em metade
  
  s =   map (s, 0,59, 0, 360); // mapear os valores de 0,59, para 0, 360 valor de uma translação
  m =   map (m, 0,59, 0, 360); // mapear os valores de 0,59, para 0, 360 valor de uma translação
  h =   map (h12, 0,12, 0, 360); // mapear os valores de 0,12, para 0, 360 valor de uma translação
  

 // minutos---------------
  strokeWeight(4); // espessura do stroke / outline
  stroke (0); // definição da cor do outline
  float angleMinuts = radians(m); //variavel para convertar angulos em radianos
pushMatrix(); // aplicação para reneiciar a rotação dos valores dos radianos
  rotate(angleMinuts); // atribuição dos valores dos radianos para a rotação
  line (0,0, 0, -120); // desenho de uma linha
popMatrix(); // aplicação para finalizar a rotação dos valores dos radianos 


  // horas-----------------------
  strokeWeight(3); // espessura do stroke / outline
  stroke(0); // definição da cor do outline
   float angleHours = radians(h); //variavel para convertar angulos em radianos
pushMatrix(); // aplicação para reneiciar a rotação dos valores dos radianos
  rotate(angleHours); // atribuição dos valores dos radianos para a rotação
  strokeWeight(12); // espessura do stroke / outline
  line (0,0, 0, -100); // desenho de uma linha
popMatrix();  // aplicação para finalizar a rotação dos valores dos radianos 

fill (255); // definição da cor de preenchimento
noStroke(); // dizer que não quero outline
ellipse (0, 0, 20, 20); // desenho de uma ellipse
fill (0, 0, 0, 50); //definição da cor do preenchimento
text ("Relax take it easy", 0, 200); // desenho de texto
    }
    }else {// caso contrário, a condição será .......................
  background(0); // atribuição cor de fundo
  fill (255); // atribuição da cor do preenchimento
  textFont (texto, 25); // definição dos parametros da variavel de texto
  stroke (255); // definição da cor da outline
  text ("Press(B)", 100, 100); // desenho de texto
  text ("Press(C)", 100, 200); // desenho de texto
  text ("Press(M)", 100, 150); // desenho de texto
  
  
    }
    if(keyPressed) { //atribuição de uma condição .......................
    if (key == 'c' || key == 'C') { //atribuição do comportamento da condição
      
        if (frameCount % 60 == 0){ // sincronizar um som conforme os segundo
som1.trigger(); // atribuição do som com os segundo
}
      
    background (0); // definição da cor de fundo
    float  s1 = second();//atribuição da funçao segundos à variavel "s"
    float m1 = minute();// atribuição da função minutos à variavel "m"
    float  h1 = hour();// atribuição da função horas à variavel "h"
    float h12 = h1%12;// redefinição dos valores da variavel "h" para metade
  
    s1 = map (s1, 0, 59, 0, 360);// mapeamento da variavel "s" para fazer uma rotação de 360
    m1 = map (m1, 0, 59, 0, 360);// mapeamento da variavel "m" para fazer uma rotação de 360
    h1 = map (h12, 0, 12, 0, 360);// mapeamento da variavel "h" para fazer uma rotação de 360
  
    strokeWeight (20);// atribuição de um valor à expessura do outline das figuras
  

//segundos-----------------
   float angles1 = radians (s1);//variavel para convertar angulos em radianos
   noFill();// retirar o preenchimento às formas
   stroke (0, 0, 100); // atribuição de valores da cor
   ellipse (0, 0, 363, 363); //desenho de uma ellipse
pushMatrix();// aplicação para reneiciar a rotação dos valores dos radianos
   rotate (angles1);// atribuição dos valores dos radianos para a rotação
   stroke (0, 0, 100);// definição dos valores das cores
   line (0, 0, 0, -180);//desenho de uma linha
popMatrix();// aplicação para finalizar a rotação dos valores dos radianos


//minutos-----------------
   float anglem1 = radians (m1);//variavel para converter angulos em radianos
   stroke (0, 0, 155);// atribuição de valores da cor
   ellipse (0, 0, 280, 280);//desenho de uma ellipse
pushMatrix();// aplicação para reneiciar a rotação dos valores dos radianos
   rotate (anglem1);// atribuição dos valores dos radianos para a rotação
   stroke (0, 0, 155);// definição dos valores das cores
   line (0, 0, 0, -140);//desenho de uma linha
popMatrix();// aplicação para finalizar a rotação dos valores dos radianos

  
    
  //horas--------------------

   float angleh1 = radians (h1);//variavel para converter angulos em radianos
   stroke (0, 0, 200);// atribuição  de valores da cor
   ellipse (0, 0, 200, 200);// desenho de uma ellipse
pushMatrix();// aplicação para reneiciar a rotação dos valores dos radianos
   rotate (angleh1);// atribuição dos valores dos radianos para a rotação
   stroke (0, 0, 200);// definição dos valores das cores
   line (0, 0, 0, -100);//desenho de uma linha
popMatrix();// aplicação para finalizar a rotação dos valores dos radianos


 stroke (0);// definição dos valores da cor da espessura do outline
 fill (0);// sem preenchimento
 ellipse (0, 0, 20, 20);// desenho de uma ellipse
    }
    }else{ // caso contrário, a condição será ...........................
  background(0); // atribuição cor de fundo
  fill (255); // atribuição da cor do preenchimento
  textFont (texto, 25); // definição dos parametros da variavel de texto
  stroke (255); // definição da cor da outline
  text ("Press(B)", 100, 100); // desenho de texto
  text ("Press(C)", 100, 200); // desenho de texto
  text ("Press(M)", 100, 150); // desenho de texto
}
  
  
   if(keyPressed) { //atribuição de uma condição ............................
    if (key == 'm' || key == 'M') { //atribuição do comportamento da condiçã
    background (0); // atribuição de uma cor ao fundo
    float s2 = second();//atribuição da funçao segundos à variavel "s"
    float m2 = minute();// atribuição da função minutos à variavel "m"
    float h2 = hour();// atribuição da função horas à variavel "h"
    float h12 = h2%12;// redefinição dos valores da variavel "h" para metade
  
    s2 = map (s2, 0, 59, 0, 360);// mapeamento da variavel "s" para fazer uma rotação de 360
    m2 = map (m2, 0, 59, 0, 360);// mapeamento da variavel "m" para fazer uma rotação de 360
    h2 = map (h12, 0, 12, 0, 360);// mapeamento da variavel "h" para fazer uma rotação de 360
  
    strokeWeight (20);// atribuição de um valor à expessura do outline das figuras
  

//segundos-----------------
    float angles2 = radians (s2);//variavel para convertar angulos em radianos
    noFill();// retirar o preenchimento às formas
    stroke (0, 0, 100); // atribuição de valores da cor
  
pushMatrix();// aplicação para reneiciar a rotação dos valores dos radianos
  rotate (angles2);// atribuição dos valores dos radianos para a rotação
  stroke (0, 0, 100);// definição dos valores das cores
  ellipse (-50, -50, 30, 30);//desenho de uma linha
popMatrix();// aplicação para finalizar a rotação dos valores dos radianos


//minutos-----------------
    float anglem2 = radians (m2);//variavel para converter angulos em radianos
    stroke (0, 0, 155);// atribuição de valores da cor
  
pushMatrix();// aplicação para reneiciar a rotação dos valores dos radianos
  rotate (anglem2);// atribuição dos valores dos radianos para a rotação
  stroke (0, 0, 155);// definição dos valores das cores
  ellipse (- 90, -90, 40, 40);//desenho de uma linha
popMatrix();// aplicação para finalizar a rotação dos valores dos radianos

  
    
  //horas--------------------

    float angleh2 = radians (h2);//variavel para converter angulos em radianos
    stroke (0, 0, 200);// atribuição  de valores da cor
  
pushMatrix();// aplicação para reneiciar a rotação dos valores dos radianos
  rotate (angleh2);// atribuição dos valores dos radianos para a rotação
  stroke (0, 0, 200);// definição dos valores das cores
  ellipse (-150, -150, 50, 50);//desenho de uma linha
popMatrix();// aplicação para finalizar a rotação dos valores dos radianos
fill (55, 0, 0); // definição do preenchimento da cor
stroke (55, 0, 0); // definição da cor da outline
ellipse (0, 0, 15, 15); // desenho de uma ellipse
s2 = second(); //redefinição da variavel 
m2 = minute(); //redefinição da variavel 
h2 = hour(); //redefinição da variavel 
s2 = map (s2, 0, 59, 0, 59); //redefinição da mapamento da variavel
m2 = map (m2, 0, 59, 0, 59); //redefinição da mapamento da variavel
h2 = map (h2, 0, 23, 0, 23); //redefinição da mapamento da variavel
fill (255); // atribuição de uma cor ao preenchimento
text ("/"+ s2, 100, 250); // desenho de texto
text ("/"+ m2, 40, 250);  // desenho de texto
text (""+ h2, -20, 250);  // desenho de texto
}
   
   }
   else{ // caso contrário, a condição será ...............................
    background(0); // atribuição de uma cor ao fundo
    fill (255); // atribuição de uma cor ao preenchimento
    textFont (texto, 25); // atribuição de valores á variavel de texto
    stroke (255); // definição da cor da outline
    text ("Press(B)", 100, 100); //desenho de texto
    text ("Press(C)", 100, 200); //desenho de texto
    text ("Press(M)", 100, 150); //desenho de texto
  }
      
}

void stop(){ // definições de stop
  
  som.close(); // variavel que serve para parar a reprodução de som
  
  minim:stop(); // dizer para parar a reprodução da biblioteca minim
  
  super.stop(); // fazer stop de todo o som
  
}

