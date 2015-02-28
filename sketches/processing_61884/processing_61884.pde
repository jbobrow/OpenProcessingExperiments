
int objectos;//variavel nomeado por objectos

void setup(){// elementos estaticos e constantes 
  size(500,500);//tamanha de area de trabalho
  background(255);//cor de fundo branca
  smooth();//suavizaçao de elementos
noLoop();//ausencia de movimentos
objectos=25;//total de objectos 20
}
  void draw(){// elementos em metaforse constante
    
  
  colorMode(HSB,360,100,100,100);//modo de cor utilizado hsb
    
   for(int i=0 ; i<objectos ;i++){//funçao que nos premire a construçao de 25 objectos 

  float poiX=random(50,width-50);//ponto y de posicionamente do tronco na horizontal
  float poiY=random(150,height/4*3);//ponto  x de inicio do tronco maior 
  float poiY2=height;//ponto x de fim do tronco maior 
 float pontoX=random (poiX,poiX+100);//posiçao X DO tronco menor a esquerda
 float pontoY=random(poiY-100,poiY-50);//posiçao  y dos tronco pequenos na horizontal 
 float pontoX2=random (poiX-100,poiX);//posiçao X do tronco menor a direita 
 float diametro=random(20,50);// largura da vegetaçao 
 float s =random(0,100); //variavel da cor utilizada para a vegetaçao
  float b =random(0,100);// variavel da cor utilizada para os tronco 
 

     fill(79,97,b);//cor da vegetaçao 
     noStroke();//nao contorno
     ellipse(pontoX,pontoY,diametro,diametro);//vegetaçao que sai do tronco mais a esquerda
    ellipse(pontoX2,pontoY,diametro,diametro);//vegetaçao que sai do tronco mais a direita
    stroke(30,59,s);//cor dos tronco 
    strokeWeight(3);//grossura dos troncos menores 
    line(poiX,poiY,pontoX2,pontoY);//posiçonamento da linha  que repressenta o tronco menor a direita
    line(poiX,poiY,pontoX,pontoY);//posiçonamento da linha  que repressenta o tronco menor a esquerda
    strokeWeight(6);//grossura do tronco maior
    line(poiX,poiY2,poiX,poiY);//posiçonamento da linha  que repressenta o tronco maior
  }
    
  
  }

