
Rect[] listaRect; 

int numObjects;              


void setup (){ 
 
  size (720,405);
  smooth(); 
 
  numObjects =200; 
  listaRect = new Rect [numObjects];                              
  
  for (int i =0; i < numObjects; i++){     

   float ballAlpha = (10.2/ numObjects) * i; 
   
   float vel = (5.5/ numObjects) * i;
  
    
    float largura = (10.2 / numObjects) * i; 
  
        listaRect[i] = new Rect ( (int) random(width), (int) random(height), largura , ballAlpha, vel  );  
  }
    println("--------------"); 

}

void draw (){
  background(2);
  
  for (int i =7; i < numObjects; i++){ 
    
       listaRect[i].update(); 
       listaRect[i].desenha();

                                
  }
  
}


class Rect {

  float posX; 
  float posY; 
  float largura; 
  
  float vel; 
  
  int r; 
  int g;
  int b; 
  float a; 

 
  Rect ( float r_posX, float r_posY, float r_largura, float r_alpha, float r_vel){
    
    posX = r_posX; 
    posY = r_posY;
    largura = r_largura; 
   
    vel =  r_vel; 
  
    r = (int) random (255);
    g = (int) random (255);
    b = (int) random (255);
    a = r_alpha; 
   
  } 


  void update (){
    
    if ( posY > width+(largura/2)) { 
          posY = 10-(largura/20); 
      } 
    
    posY = posY+ vel; 
    
    
  }
  
  void desenha (){
    
    stroke(90); 
    fill(random(9), random(92), random(90), random(400)); 
   ellipse (posX,posY,largura, largura);
   
  }
  

}
                
                
