
//iniciar objecto dando-lhe um nome e número de pontos
utopia[] mpoints = new utopia[10];

void setup(){
  
  size(700,400);//tamanho da janela
  background(5,22,41);// cor de fundo da janela
  frameRate(30);//número de "frames" por segundo
  
  for(int i=0; i<10; i=i+1){//criar variável
    mpoints[i] = new utopia(width,height);
  }
}   
  
void draw(){//iniciar variável
     
  for(int i=0; i<10; i=i+1){
    mpoints[i].update();//função de actualização
    mpoints[i].drawing(); //função de desenhar
  }
}  
  
class utopia{//definir a "class"
  
  //posição da variável no x (horizontal) e y (vertical) com movimento fixo
  float posX;
  float posY;
  
  utopia(float posX, float posY){
    posX = posX;
    posY = posY;

  }
   
  
  void drawing() {
    strokeWeight(random(3));//tamanho do objecto
    stroke(random(200),random(255),0);//cor do objecto
    rect(posX,posY,0,0);
    rect(posY,posX,0,0);
  }
  
void update(){//iniciar variável para actualizar a animação
          
    posX = posX + 15;//espaçamento entre linhas
    posY = random(height/2-400,height/2+700);//defini os limites da animação
    if(posX > width + 10){
      posX= -100;
      if(posY > height + 10){
      posY = -5;
      }
       
    }
  
  }
}
//fim da "class"

