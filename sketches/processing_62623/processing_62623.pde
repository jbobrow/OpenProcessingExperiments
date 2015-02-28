

float x;
float y;
float x2;
float y2;
float x3;
float y3;


void setup(){
  
  background(0);
  size(720,576);
 
  x=20;
  y=60;
  
  x2=20;
  y2=30;
 
  x3=20;
  y3=40;

}


void draw(){
  
    ellipse(x,y,10,10);     //azul
    fill(255,0,0);
    
    ellipse(x2,y2,15,15);  //verde
    fill(0,255,0);
    
    ellipse(x3,y3,20,20);  //rojo
    fill(0,0,255);
    noStroke();
    smooth();
    
    x=x+40;
    x2=x2+40;
    x3=x3+40;
    
   
    if (x>720){
      
    x=40;
    y=y+40;
      
    }
    
     if (y>576){
      
    noLoop();
      
    }
    
     if (x2>720){
      
    x2=50;
    y2=y2+40;
      
    }
    
     if (y2>576){
      
    noLoop();
      
    }
    
       if (x3>720){
      
    x3=20;
    y3=y3+40;
      
    }
    
     if (y3>576){
      
    noLoop();
     
    }
}

