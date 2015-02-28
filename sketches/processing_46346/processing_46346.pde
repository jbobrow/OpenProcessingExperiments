
int num = 10; //número de objectos
Satelite [] mySatelite = new Satelite [num];//iniciar objecto (dar um nome)
 
void setup(){
   
  size(500,300);//tamanho da janela
  background(0);// cor de fundo da janela
  frameRate(20);//número de "frames" por segundo
   
  for(int i=0; i<num; i=i+1){//criar variável
  mySatelite[i] = new Satelite();
  }
}
   
void draw(){//iniciar variável
   
   for(int i=0; i<num; i=i+1){
   mySatelite[i].update();//função de actualização
   mySatelite[i].drawing();//função de desenhar
  }
   
  //defenir o fundo para efeito de arrastamento do objecto
  fill(0,0,0,10);
  rect(0,0,width, height);
}
   
class Satelite{//defenir a "class"
   
  float posX = int(random(width)); //defenir posição horizontal da variável
  float posY = int(random(height)); //defenir posição vertical da variável
  float r = int(random(0));//defenir percentagem de cor "red"
  float g = int(random(200));//defenir percentagem de cor "green"
  float b = int(random(250));//defenir percentagem de cor "blue"
   
void update(){//iniciar variável para actualizar a animação
   if(posX > width){
   posX = -40;
   posY = random(height);
   r = random(255);
   g = random(255);
   b = random(255);
}
    //velocidade (movimento) da animação
    posX = posX + int(random(4,-2));
    posY = posY + int(random(-1,2));
  }
    
 void drawing(){//iniciar variável para desenhar o objecto
    
   smooth();//percentagem de pixelização
   fill(r,g,b,random(100,255));//cor do preenchimento do objecto
   rect (posX,posY,6,20);//geometria do objecto
   ellipse (posX,posY,20,20);
   rect (posX,posY,10,-20);
   rect (posX,posY,-20,10);
   
   
    fill(r);//cor do preenchimento do objecto
    ellipse (posX,posY,10,10);
    
    fill(g);//cor do preenchimento do objecto
    ellipse (posX,posY,5,5);
  
   //"posX" e "posY" são usados para desenhar o objecto
   //numa posição nova em cada frame
    
  }
}//fim da "class"


