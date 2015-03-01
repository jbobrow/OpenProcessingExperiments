
int valor;

void setup(){
  
  size(600,600);
    background(0);
     valor = 30;
     
}
 void draw(){
    
     for(int y = 0; y < height; y+=valor){
     for(int x = 0; x < width; x+=valor){
       if (mousePressed){
       fill (random(0),random(0), random(255));
       ellipse(x, y, valor-10, valor-10);
       
        int ratonX = mouseX - (mouseX % valor);
        int ratonY = mouseY - (mouseY % valor);
        fill(mouseX, mouseY, mouseX, mouseY);
        ellipse(ratonX, ratonY, 30, 30);
       
     } else {
        background(0);
        int specialX = mouseX - (mouseX % valor);
        int specialY = mouseY - (mouseY % valor);
        fill (mouseX, mouseY, mouseX, mouseY);
        ellipse(specialX, specialY, valor-15, valor-15);
        ellipse(specialX, specialY, valor+5, valor+5);
     }
           
   }
     
   }
 }
 


