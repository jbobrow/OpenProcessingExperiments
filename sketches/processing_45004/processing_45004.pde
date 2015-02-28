
// Definição base (inc. posiçao + velocidades base)
Car[] setas;
 
  
void setup(){
  size (500,500);
    
  int num = 50;
  setas = new Car[num];
   
  for ( int i =0; i< num; i++){
      setas[i] = new Car ( -100, random (height), random (3,6));
  }
   
}
 
void draw(){
  background(86,200,233);


// Paisagem  
fill(150,255,0);
ellipse (400,325,400,400);
fill(100,255,0);
ellipse (100,325,300,300);
ellipse (250,500,600,700);
fill(156,104,2);
rect (250,230,15,60);
rect (100,200,12,50);
fill(0,200,0);
ellipse( 258,185,100,100);
ellipse( 108,170,80,80);
 
 
 // Alvo 
 smooth();
 fill(156,104,2); 
 triangle (380,425,400,300,400,425);
 triangle (470,425,450,300,450,425);
  
 fill(255,0,0);
 ellipse (425,250,150,200);
 
 fill (255);
 ellipse (425,250,125,175);
 
 
 fill(255,0,0);
 ellipse (425,250,100,150);
 
 fill(255);
 ellipse (425,250,75,125);

 fill(255,0,0);
 ellipse (425,250,50,100);

 fill(255);
 ellipse (425,250,25,75);
 
 fill(0);
 ellipse (425,250,15,30);
 
// Quantidades e Condução
   
  int num = 13;
   
   for ( int i =0; i< num; i++){
      
     setas[i].drive();
      setas[i].display();
       
  }
 
}
 
 
//Definição de objecto
 
class Car{
   
    float xpos; // posiçao horizontal
  float ypos; // posiçao vertical
  float xspeed; // variavel de velocidade
   
  // Funçao de construçao
  
  Car ( int t_xpos, float t_ypos, float t_xspeed  ){
     
   xpos = t_xpos;
   ypos = t_ypos;
   xspeed = t_xspeed;
   
  }
   
  // Funçao de animaçao
  
  void drive (){
     
    xpos = xpos + xspeed;
    if ( xpos > width){
     xpos = 0;
     ypos = (int) random(height);
      }
     
  }
   
  // Função de criação de setas
  
  void display (){
noStroke();
    fill(187,145,0);
    rect (xpos, ypos, 100, 3);
    fill(75,25,0);
    triangle (xpos+99,ypos-5,xpos+99,ypos+8,xpos+107,ypos+1);
    
    fill(230,0,0);
    rect (xpos, ypos+3, 15, 7);
    rect (xpos, ypos-6, 15, 7);
   
    triangle (xpos,ypos+2, xpos-7,ypos+10, xpos, ypos+10);
    triangle (xpos,ypos+1, xpos-7,ypos-6, xpos, ypos-6);
    
    triangle (xpos+14,ypos+3, xpos+14,ypos+10, xpos+22, ypos+3);
    triangle (xpos+14,ypos+1, xpos+14,ypos-6, xpos+22, ypos);
    
    
  }
   
}


