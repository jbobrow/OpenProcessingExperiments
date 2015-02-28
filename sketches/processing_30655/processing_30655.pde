
// tipo nome
Car[] carros;
 
int num;

void setup(){
  size (400,400);
  
  num = 100;
  carros = new Car[num];
 
  for ( int i =0; i< num; i++){
      carros[i] = new Car ( 30, random (height), random (10));
  }
 
}

void draw(){
  background(0);
 
 
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
   g = random(188);
   b = random(0);
 strokeWeight (5);
 stroke (100,100,100, 50);
  }
 
  // funcao que anima o carro, actualizando a variavel xpos
  void drive (){
   
    xpos = xpos + xspeed;
    if ( xpos > width){
     xpos = 50;
     ypos = (int) random(height);
     r = random(255);
     g = random(0);
     b = random(0);
    }
   
  }
 
  // funcao de desenho do carro
  void display (){
   
    fill(r,g,b);
    rect (xpos, ypos, 120, 110);
 
  }
 
}// end class CAR
