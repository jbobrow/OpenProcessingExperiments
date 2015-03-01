
void setup(){
  size (250,250);
  
}

void draw(){
  background (0);
  for(int i=0; //comienza en cero//
        i<=height; //límite, puede ser width o height también, se pone mayor o igual para que no quede ningún hueco
        i+=10) // i=i+10 o sea que aumenta de 10 en 10
        {
  
        stroke(0,250,i);  
    line(mouseX,mouseY,width,i);
    
         //stroke(255,i+50,i+50);  
    line(0,i,mouseX,mouseY);
    
         //stroke(255,i+50,i+50);  
    line(mouseX,mouseY,i,height);
    
         //stroke(255,i+50,i+50);  
    line(i,0,mouseX,mouseY);
 
  }
}
  


