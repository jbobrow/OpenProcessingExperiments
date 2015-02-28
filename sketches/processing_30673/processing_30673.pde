
// tipo nome
Car[] carros; 
 
int num;

void setup(){
  size (700,700); 
   
  num = 600; 
  carros = new Car[num]; 
  
  for ( int i =0; i< num; i++){
      carros[i] = new Car ( 0, random (height), random (6));
  }
  
}

void draw(){
  background(255);
  
  
   for ( int i =0; i< num; i++){
     
     carros[i].drive();
      carros[i].display();
      
  }

}


//****** objeto 
class Car{
  
  float r,g,b; // 3 variaveis para cor do carro
  float xpos; // posicao horizontal
  float ypos; // posicao vertical 
  float xspeed; // variavel para a velocidade
  
  // 1 metodo: funcao COSTRUTORA
  Car ( int t_xpos, float t_ypos, float t_xspeed  ){
    
   xpos = t_xpos; 
   ypos = t_ypos; 
   xspeed = t_xspeed; 
   r = random(255); 
   g = random(255); 
   b = random(255); 
  
  }
  
  // funcao que anima o carro, actualizando a variavel xpos
  void drive (){
    
    xpos = xpos + xspeed; 
    if ( xpos > width){
     xpos = 0; 
     ypos = (int) random(height); 
     r = random(255); 
     g = random(255); 
     b = random(255); 
    }
    
  }
  
  // funcao de desenho do carro
  void display (){
    
    fill(r,g,b); 
    ellipse (xpos, ypos, 40, 40); 
  
  }
  
}// end class CAR

