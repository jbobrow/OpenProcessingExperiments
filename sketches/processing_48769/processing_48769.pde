
float posX;
float posY;
float velocityX = 2;
float velocityY = 2;
void setup(){
  
  size (720, 405); 
  background(255);
  frameRate(40); 
  
   posX = width/2; 
  posY = height/2;// altura da janela a dividir por 2 
}

void draw (){
  

      fill(5);
                    
   velocityX = random(-10, 10); 
   posX = posX + velocityX; //velocidade que aumenta o numero de px
   
  velocityY = random(-10, 10);  
  posY = posY + velocityY; //velocidade que aumenta o numero de px
  
    rect (posX, posY, 10, 10); 
      println  (velocityX);       
      
//fill(255,255,255,5);
//rect (0,0,width,height);      
                    
}
                                
