
void setup() { 
  size(500, 500); 
  background(#FFFFFF); 
 } 
 

void draw() { 
  
  if (mousePressed == true) {
    //Changement de couleur des lines
    stroke(random(10,255) ); 
        
     //Etoiles de lignes aléatoires autour du pointeur de la souris  
        line(mouseX,mouseY,random(mouseX-35, mouseX),random(mouseY-35, mouseY)); 
        line(mouseX,mouseY,random(mouseX-35, mouseX),random(mouseY, mouseY+35)); 
        line(mouseX,mouseY,random(mouseX, mouseX+35),random(mouseY-35, mouseY)); 
        line(mouseX,mouseY,random(mouseX, mouseX+35),random(mouseY, mouseY+35)); 
       
  }  
  
    if (mousePressed == false) {
    
        //line( mouseY, 0, mouseX, 500);
        //line( mouseX, 500, mouseY, 0);
        
        //line(mouseX,mouseY,random(mouseX-35, mouseX),random(mouseY-35, mouseY)); 
        //line(mouseX,mouseY,random(mouseX-35, mouseX),random(mouseY, mouseY+35)); 
        //line(mouseX,mouseY,random(mouseX-35, mouseX+35),random(mouseY-65, mouseY+65)); 
        //line(mouseX,mouseY,random(mouseX-65, mouseX+65),random(mouseY-35, mouseY+35)); 
        
   
   
    }
if (keyPressed == true) {

  //export en .tif
  saveFrame();
  
   background(#FFFFFF);
};

}




