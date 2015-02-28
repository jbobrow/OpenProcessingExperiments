
int rojo=#FA0000;
int azul=#0900FF;
int verde=#1AFF00;
int amarillo=#EFFF00;
int negro=0;
int colorPintar=0;


void setup (){
  
    background ( #FFFFFF );
    size (1000,600);
    fill(rojo);
    rect (0,0,80,80);
    fill(azul);
    rect (0,80,80,80);
    fill(verde);
    rect (0,160,80,80);
    fill (amarillo);
    rect (0,230,80,80);
    fill (negro);
    rect (0,310,80,80);
}

void draw (){
  
  if (mousePressed){
    noStroke();
    fill(colorPintar);
    ellipse(mouseX,mouseY,20,20);
    
  }
    
  if (keyPressed){
    
          if(key=='a'){
          background(#FFFFFF);
          stroke(0);
          fill(rojo);
          rect (0,0,80,80);
          fill(azul);
          rect (0,80,80,80);
          fill(verde);
          rect (0,160,80,80);
          fill (amarillo);
          rect (0,230,80,80);
          fill (negro);
          rect (0,310,80,80);
          
          }
     }
     
    if (mouseX <= 80 && mouseY <= 80){
    
      colorPintar=rojo;
    
    }
    
    if (mouseX <=80 && mouseY > 80 && mouseY <= 160){
    
      colorPintar=azul;
      
    }
    
    if (mouseX <=80 && mouseY > 160 && mouseY <= 240){
    
      colorPintar=verde;
      
    }
    
    if (mouseX <=80 && mouseY > 240 && mouseY <= 320){
    
      colorPintar=amarillo;
    
    }
    
    if (mouseX <=80 && mouseY > 320 && mouseY <= 400){
    
      colorPintar=negro;
    
    }
 
}




