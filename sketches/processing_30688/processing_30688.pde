
// tipo nome
Car[] carros;
 
int num;

void setup(){
  size (800,600);
  
  num = 50;
  carros = new Car[num];
 
  for ( int i =0; i< num; i++){
      carros[i] = new Car (5, random (height), random (60));
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
   g = random(255);
   b = random(255);
 
  }
 
  // funcao que anima o carro, actualizando a variavel xpos
  void drive (){
   
    xpos = xpos + xspeed;
    if ( xpos > width){
     xpos = 0;
     ypos = (int) random(height+100);
     r = random(xspeed);
     g = random(xspeed);
     b = random(xspeed);
    }
   
  }
 
  // funcao de desenho do carro
  void display (){
   
    fill(r,g,b);
    float tamanho = random (10,100);
    noStroke();
    rect (xpos, ypos, xspeed, xspeed);
    stroke(255,40);
    line (xpos, ypos, ypos,xpos);
    rectMode (CENTER);
    rect (xpos, ypos,30,30);
 
  }
 
}// end class CAR

