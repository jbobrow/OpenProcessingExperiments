

int totalObjectos; 




void setup()
{
  size(700,700);
  background(0); 
  smooth();
  frameRate(6);

  
  totalObjectos  = 100;
  
}


void draw(){
  background(255);

  
    for (int i = 0; i < totalObjectos/3 ; i = i +1 )
      {
  
        fill(500);
        stroke(random(0,255),random(0,255),22);
        strokeWeight(random(0,10));
        strokeCap (SQUARE);
    line(random (0,width) ,random (0,height) ,width/2,height/2);
      }

  

  for (int i = 0; i < totalObjectos/2 ; i = i +1 )
      {
  
        fill(500);
        stroke(random(0,255),122,random(0,255));
        strokeWeight(random(10,20));
        strokeCap (SQUARE);
        line(random (width*0.15,width*0.85) ,random (height*0.15,height*0.85) ,width/2,height/2);
      }
      
      
      
      for (int i = 0; i < totalObjectos/5  ; i = i +1 )
      {
  
        
        
        fill(500);
        stroke(222,random(0,255),random(0,255));
        strokeWeight(random(20,30));
        strokeCap (SQUARE);
        line(random (width*0.3,width*0.7) ,random (height*0.3,height*0.7) ,width/2,height/2);
      }
      
      float tamanho =random(50,150);
      noStroke();
      fill(random(0,255));
      ellipse(width/2,height/2,tamanho,tamanho);
      
}



