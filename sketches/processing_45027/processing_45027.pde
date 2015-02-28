
int num = 200; //número de objectos
Sketch [] mySketch = new Sketch [num];//iniciar objecto dando-lhe um nome

void setup(){
  
  size(500,300);//tamanho da janela
  background(0);// cor de fundo da janela
  frameRate(20);//número de "frames" por segundo
  
  for(int i=0; i<num; i=i+1){//criar variável
  mySketch[i] = new Sketch();
  }
}
  
void draw(){//iniciar variável
  
   for(int i=0; i<num; i=i+1){
   mySketch[i].update();//função de actualização
   mySketch[i].drawing();//função de desenhar
  }
  
  //definir o fundo para efeito de arrastamento do objecto
  fill(255,255,255,20);
  rect(0,0,width, height);
}
  
class Sketch{//definir a "class"
  
  float posX = int(random(width)); //definir posição horizontal da variável
  float posY = int(random(height)); //definir posição vertical da variável
  float r = int(random(255));//definir percentagem de cor "red"
  float g = int(random(255));//definir percentagem de cor "green"
  float b = int(random(255));//definir percentagem de cor "blue"
  
void update(){//iniciar variável para actualizar a animação
   if(posX > width){
   posX = -40;
   posY = random(height);
   r = random(255);
   g = random(255);
   b = random(255);
}
    //velocidade (movimento) da animação
    posX = posX + int(random(1,-1));
    posY = posY + int(random(-2,2));
  }
   
 void drawing(){//iniciar variável para desenhar o objecto
   smooth();//percentagem de pixelização
   noStroke();//sem contorno
   fill(r,g,b,random(255));//cor do preenchimento do objecto
   ellipse (posX,posY,20,20);//geometria do objecto
   //"posX" e "posY" são usados para desenhar o objecto
   //numa posição nova em cada frame
   
  }
}//fim da "class"


