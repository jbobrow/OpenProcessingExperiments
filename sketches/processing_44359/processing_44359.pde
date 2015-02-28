
motionGraphicRect m1;                    // iniciar variáveis
motionGraphicRect m2;                    // estas variaveis são do tipo de classe definido no final do código 
motionGraphicRect m3;
motionGraphicRect m4;
motionGraphicRect m5;
motionGraphicRect m6;
motionGraphicRect m7;
motionGraphicRect m8;
motionGraphicRect m9;
motionGraphicRect m10;

void setup () {
  size(1024, 720);
  smooth();
  background (255); 
  m1 = new motionGraphicRect ();          // definir valor inicial das variaveis 
  m2 = new motionGraphicRect ();          // neste caso, são definidas como "novas"
  m3 = new motionGraphicRect ();
  m4 = new motionGraphicRect ();
  m5 = new motionGraphicRect ();
  m6 = new motionGraphicRect ();
  m7 = new motionGraphicRect ();
  m8 = new motionGraphicRect ();
  m9 = new motionGraphicRect ();
  m10 = new motionGraphicRect ();
}

void draw() {                             // cerne do código
  background (255);
  m1.mover();                             //são chamadas as funções definidas na classe
  m1.desenhar();
  m1.testeColisao();
  m2.mover();
  m2.desenhar();
  m2.testeColisao();
  m3.mover();
  m3.desenhar();
  m3.testeColisao();
  m4.mover();
  m4.desenhar();
  m4.testeColisao();
  m5.mover();
  m5.desenhar();
  m5.testeColisao();
  m6.mover();
  m6.desenhar();
  m6.testeColisao();
  m7.mover();
  m7.desenhar();
  m7.testeColisao();
  m8.mover();
  m8.desenhar();
  m8.testeColisao();
  m9.mover();
  m9.desenhar();
  m9.testeColisao();
  m10.mover();
  m10.desenhar();
  m10.testeColisao();
}



class motionGraphicRect {                 // inicio da classe (procedure)

  float posX;                             // definidas as variaveis utilizadas nas funções da classe
  float posY;
  float raio;
  float velocidade;
  float r;
  float g;
  float b;
  float a;                                 // para utilizar alpha na cor

  motionGraphicRect () {                   // definição da classe

    posX=random(width);
    posY=random(height);
    raio=random(3,5);
    velocidade=random(1,3); 
    r=random(255);
    g=random(255);
    b=random(255);
    a=random(255);
  }

  void mover () {                         //função 
    raio=raio+velocidade;                 //movimento
    //println(raio+posX);
  }

void testeColisao (){                  //função
  
   if (raio/2+posX > width){           //teste colisão #1 (lateral esquerda)
     posX=random(width);
     posY=random(height);
     raio=random(3,5);
     velocidade=random(1,3);
     r=random(255);
     g=random(255);
     b=random(255);
     a=random(255);    
  }
  if (raio/2+posY > height){          //teste colisão #2 (inferior)
     posX=random(width);
     posY=random(height);
     raio=random(3,5);
     velocidade=random(1,3);
     r=random(255);
     g=random(255);
     b=random(255);   
     a=random(255); 
  }

 if (-(raio/2)+posX < 0){             //teste colisão #3 (lateral direita)
     posX=random(width);
     posY=random(height);
     raio=random(3,5);
     velocidade=random(1,3);
     r=random(255);
     g=random(255);
     b=random(255);    
     a=random(255);
  }
  
 if (-(raio/2)+posY < 0){             //teste colisão #4 (superior)
     posX=random(width);
     posY=random(height);
     raio=random(3,5);
     velocidade=random(1,3);
     r=random(255);
     g=random(255);
     b=random(255);   
     a=random(255); 
  }


}
  
  void desenhar () {                      //função
    noStroke(); 
    fill (r, g, b, a);                          // definir cor  
    ellipse(posX, posY, raio, raio);
  }
}                                       // fim da classe


