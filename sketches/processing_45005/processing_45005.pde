
// Definição base (inc. posiçao + velocidades base)
Car[] drops;
 
  
void setup(){
  size (500,500);
    
  int num = 100;
  drops = new Car[num];
   
  for ( int i =0; i< num; i++){
      drops[i] = new Car ( -100, random (height), random (3,6));
  }
   
}
 
void draw(){
  background(165,200,200);
 
 // Nuvens
 smooth();
  fill(125);
 ellipse(400,100,350,200);
 fill(150);
 ellipse(200,75,400,200);
 fill(200);
 ellipse(225,50,200,150);
 fill(225);
 ellipse(400,50,300,200);
 fill(175);
 ellipse(50,50,250,175);

 
 // Quantidades e Condução
 
    
  int num = 100;
   
   for ( int i =0; i< num; i++){
      
     drops[i].drive();
      drops[i].display();
       
  }
 
}
 
 
//Definir objecto
 
class Car{
   
    float xpos; // posiçao horizontal
  float ypos; // posiçao vertical
  float yspeed; // variavel de velocidade
   
  // Funçao de construçao
  
  Car ( int t_xpos, float t_ypos, float t_yspeed  ){
     
   xpos = t_xpos;
   ypos = t_ypos;
   yspeed = t_yspeed;
   
  }
   
  // Funçao de animaçao
  
  void drive (){
     
    ypos = ypos + yspeed;
    if ( ypos > height){
     ypos = 0;
     xpos = (int) random(width);
      }
     
  }
   
  // Função de criação de gotas
  
  void display (){
noStroke();
    fill(0,0,random(100,255));
    ellipse( xpos,ypos,10,10);
    triangle (xpos-5, ypos, xpos+5, ypos, xpos, ypos-20);
    fill(255);
    ellipse( xpos+2,ypos+1,random (2,5),random (2,8));
    
    
  }
   
}


