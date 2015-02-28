
int num = 2; //número de objectos
Camiao [] myCamiao = new Camiao [num];//iniciar objecto (dar um nome)
 
void setup(){
   
  size(500,300);//tamanho da janela
  background (0);// cor de fundo da janela
  frameRate(30);//número de "frames" por segundo
   
  for(int i=0; i<num; i=i+1){//criar variável
  myCamiao[i] = new Camiao();
  }
}
   
void draw(){//iniciar variável
   
   for(int i=0; i<num; i=i+1){
   myCamiao[i].update();//função de actualização
   myCamiao[i].drawing();//função de desenhar
  }
   
  //definir o fundo para efeito de arrastamento do objecto
  fill(113,102,102,50);
  rect(0,0,width, height);
}
   
class Camiao{//definir a "class"
   
  float posX = int(random(width)); //definir posição horizontal da variável
  float posY = int(random(height)); //definir posição vertical da variável
  float r = int(random(0));//definir percentagem de cor "red"
  float g = int(random(200));//definir percentagem de cor "green"
  float b = int(random(250));//definir percentagem de cor "blue"
   
void update(){//iniciar variável para actualizar a animação
   if(posX > width+300){
   posX = -40;
   posY = random(height+300);
   r = random(255);
   g = random(255);
   b = random(255);
}
    //velocidade (movimento) da animação
    posX = posX + int(random(2,-2));
    posY = posY + int(random(-1,1));
  }
    
 void drawing(){

    fill(255);//cor do preenchimento do objecto
    noStroke();//sem contorno
    ellipse (width/4,height/4,60,60);//geometria do objecto 
   
    
    stroke(2);//contorno
    fill(r,g,b,255);//cor do preenchimento do objecto 
    rect (posX,170,30,60);  //geometria do objecto 
    rect(posX, 200, 100, 50);
    rect(posX-150, 200, 100, 50);
    rect(posX-80, 210, 100, 10);
    rect(posX-260, 200, 200, 50);
   
    fill(255);//cor do preenchimento do objecto
    strokeWeight (6); //tamanho do contorno 
    
    ellipse (posX,250,30,30); //geometria do objecto
    ellipse (posX-100,250,30,30);
    ellipse (posX-200,250,30,30);
    ellipse (posX+100,250,30,30);
    

    fill(0);//cor do preenchimento do objecto
    strokeWeight (6); // tamanho do contorno
    rect (0,260 ,720,300); //geometria do objecto

    fill (random(255)); //cor do preenchimento do objecto
    ellipse (posX+100,250,15,15); //geometria do objecto
    ellipse (posX,250,15,15);
    ellipse (posX-100,250,15,15);
    ellipse (posX-200,250,15,15);  
   
    
 }
 
 
}
//fim da "class"


