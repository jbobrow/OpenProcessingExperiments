
int num = 20; //número de objectos
drops [] mydrops = new drops [num];//iniciar objecto dando-lhe um nome
float posY; //criação da variável para definir a posição vertical do objecto

void setup(){
  
  size (600,200);//tamanho da janela
  smooth();//não pixelizado
  background(255);// cor de fundo da janela
  frameRate(20);//número de "frames" por segundo
 
  posY = 0;//iniciar a variável dando-lhe um valor/posição
  
  for(int i=0; i<num; i=i+1){//criar variável
  mydrops[i] = new drops();
  }
  
}

void draw(){
  
  posY = posY + 3;//atribuir valor à variável
  println (posY);//impressão de dados
  
  fill(140,234,0);
  stroke(10);
  //objecto 2D
  line(1000,posY,0,0);//usar variável
  
  for(int i=0; i<num; i=i+1){
   mydrops[i].update();//função de actualização
   mydrops[i].drawing();//função de desenhar
  }
  
  //definir o fundo para efeito de arrastamento do objecto
  fill(255,255,255,2);
  rect(0,0,width, height);
}

class drops{//definir a "class"
  
  float posX = int(random(width)); //definir posição horizontal da variável
  float posY = int(random(height)); //definir posição vertical da variável
  float r = int(118);//definir percentagem de cor "red"
  float g = int(70);//definir percentagem de cor "green"
  float b = int(129);//definir percentagem de cor "blue"
  
void update(){//iniciar variável para actualizar a animação
   if(posX > width){
   posX = -40;
   posY = random(height);
   r = 78;
   g = 155;
   b = 153;
}
    //velocidade (movimento) da animação
    posX = posX - int(random(1,-1));
    posY = posY - int(random(-2,2));
  }
   
 void drawing(){//iniciar variável para desenhar o objecto
   smooth();//percentagem de pixelização
   stroke(255);//contorno
   fill(r,g,b,random(255));//cor do preenchimento do objecto
   ellipse (posX,posY,20,20);//geometria do objecto
   //"posX" e "posY" são usados para desenhar o objecto
   //numa posição nova em cada frame
   
  }
}//fim da "class"

  
  
  
  



