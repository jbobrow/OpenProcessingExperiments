
// Objecto
Car[] abelhas; 

 
void setup(){
  size (500,500); 
   
  int num = 50; 
  abelhas = new Car[num]; 
  
  for ( int i =0; i< num; i++){
      abelhas[i] = new Car ( 0, random (height), random (3));
  }
  
}

void draw(){
  background(86,200,233);

 // Colmeia e arvore
 
 fill(0,200,0);
 ellipse (50,0,200,200);
 ellipse (200,0,300,300);
 ellipse (400,50,500,500);
 fill (0,150,0);
 ellipse (50,0,120,120);
 ellipse (200,0,200,200);
 ellipse (400,50,400,400);
 fill(0,100,0);
 ellipse (50,0,60,60);
 ellipse (200,0,100,100);
 ellipse (400,50,300,300);
 
fill(254,189,89);
  ellipse (250, 50, 125,100);
fill(250,176,63);
  ellipse (250, 75, 150,100);
fill(236,165,54);
  ellipse (250, 100, 175,100);
fill(212,147,38);
  ellipse (250, 125, 200,100);
fill(195,134,27);
  ellipse (250, 150, 175,100);
fill(167,113,9);
  ellipse (250, 175, 150,100);
fill(156,104,2);
  ellipse (250, 200, 125,100);
  
  int num = 50;
  
   for ( int i =0; i< num; i++){
     
     abelhas[i].drive();
      abelhas[i].display();
      
  }

}


//Definir objecto 

class Car{
  
    float xpos; // posiçao horizontal
  float ypos; // posiçao vertical 
  float xspeed; // variavel de velocidade
  
  // Funcao de construçao
 
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
  
  // Funçao de criaçao
 
  void display (){
noStroke();
    fill(random(200,255)); 
    ellipse (xpos, ypos, 10, random(50)); 
    fill(255,219,13);
    ellipse (xpos, ypos, 20, 10); 
    fill(0);
    rect (xpos, ypos-3, 2,9);
    rect (xpos-4, ypos-3, 2,9);
    rect (xpos-8, ypos-2, 2,6);
    rect (xpos+4, ypos-3, 2,8);
    rect (xpos-15,ypos,5,2);
    fill(187,145,0);
    ellipse (xpos+10,ypos,5,6);
    
  }
  
}



