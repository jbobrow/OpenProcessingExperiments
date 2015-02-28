
int rojo=#FA0000;
int azul=#0900FF;
int verde=#1AFF00;
int amarillo=#EFFF00;


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

}

void draw (){
  
  if (mousePressed){
  
    fill(0);
    ellipse(mouseX,mouseY,20,20);
    
  }
    
  if (keyPressed){
    
          if(key=='a'){
          background(#FFFFFF);
          }
     }
}




