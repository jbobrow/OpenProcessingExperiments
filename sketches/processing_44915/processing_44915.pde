
ponteiro p1;                    // iniciar variáveis
ponteiro p2;                    // estas variaveis são do tipo de classe definido no final do código 
ponteiro p3;
ponteiro p4;
ponteiro p5;
ponteiro p6;
ponteiro p7;
ponteiro p8;
ponteiro p9;
ponteiro p10;


void setup (){
 size(720,405);
 smooth();
 background (255); 
 p1 = new ponteiro ();          // definir valor inicial das variaveis 
 p2 = new ponteiro ();          // neste caso, são definidas como "novas"
 p3 = new ponteiro ();
 p4 = new ponteiro ();
 p5 = new ponteiro ();
 p6 = new ponteiro ();
 p7 = new ponteiro ();
 p8 = new ponteiro ();
 p9 = new ponteiro ();
 p10 = new ponteiro ();
 
 
}

void draw(){                             // cerne do código
  background (255);
  p1.mover();                            //são chamadas as funções definidas na classe
  p1.desenhar();
  p1.testeColisao();
  p2.mover();
  p2.desenhar();
  p2.testeColisao();
  p3.mover();
  p3.desenhar();
  p3.testeColisao();
  p4.mover();
  p4.desenhar();
  p4.testeColisao();
  p5.mover();
  p5.desenhar();
  p5.testeColisao();
  p6.mover();
  p6.desenhar();
  p6.testeColisao();
  p7.mover();
  p7.desenhar();
  p7.testeColisao();
  p8.mover();
  p8.desenhar();
  p8.testeColisao();
  p9.mover();
  p9.desenhar();
  p9.testeColisao();
  p10.mover();
  p10.desenhar();
  p10.testeColisao();
  
  
}



class ponteiro{                 // inicio da classe 
 
 float posX1;                             // definidas as variaveis utilizadas nas funções da classe
 float posY1;
 float posX2;
 float posY2;
 float posX3;
 float posY3;
 float posX4;
 float posY4;
 float largura;
 float velocidade;
 float r;
 float g;
 float b;
 
 ponteiro (){                   // definição da classe
 
 largura=random(10,50);
 posX1=(width/2);
 posY1=5;
 posX2=0;
 posY2=100;
 posX3=posX2-largura/2;
 posY3=(height);
 posX4=posX2-largura;
 posY4=posY2;
 velocidade=random(1,3); 
 r=random(255);
 g=random(255);
 b=random(255);
 }
 
 void mover (){                         //função 
 posX2=posX2+velocidade;                  //movimento
 posX3=posX3+velocidade;
 posX4=posX4+velocidade;
 
 }
 
 void testeColisao (){                  //função
   if (posX4 > width){                   //teste colisão
     largura=random(10,50);
     posX1=(width/2);
     posY1=5;
     posX2=0;
     posY2=100;
     posX3=posX2-largura/2;
     posY3=(height);
     posX4=posX2-largura;
     posY4=posY2;
   
   velocidade=random(1,3); 
   r=random(255);
   g=random(255);
   b=random(255); 
 }
 }
 
 void desenhar (){                      //função desenhar
 noStroke(); 
 fill (r,g,b);                          // definir cor  
 quad(posX1,posY1,posX2,posY2,posX3,posY3,posX4,posY4);
 } 
  
}                                       // fim da classe

