
// Definição base (inc. posiçao + velocidades base)
Car[] aliens;
 
  
void setup(){
  size (500,500);
    
  int num = 50;
  aliens = new Car[num];
   
  for ( int i =0; i< num; i++){
      aliens[i] = new Car (-300, random (height), random (3,6));
  }
   
}
 
void draw(){
  background(0);

// Fundo de nave alienigena
smooth();
fill(random(125,255));
ellipse(250,250,400,400);
fill(random(0,75));
ellipse(250,250,100,100);
ellipse(160,160,75,75);
ellipse(340,340,75,75);
ellipse(160,340,75,75);
ellipse(340,160,75,75);
ellipse(250,100,50,50);
ellipse(250,400,50,50);
ellipse(400,250,50,50);
ellipse(100,250,50,50);
 
 // Quantidades e Condução
   
  int num = 35;
   
   for ( int i =0; i< num; i++){
      
     aliens[i].drive();
      aliens[i].display();
       
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
   
  // Função de criação de luzes
  
  void display (){
noStroke();

    fill(random(255),random(255),random(255));
    ellipse(xpos+50,ypos+50,random(100),random(100));
    triangle(random(xpos,xpos+100),random(ypos,ypos+100),random(xpos,xpos+100),random(ypos,ypos+100),random(xpos,xpos+100),random(ypos,ypos+100));

  }
   
}


