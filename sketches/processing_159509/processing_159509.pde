
void setup() {
  size(600,600);
  background(150,0,0);
  
  
}

void draw(){
  fill(255);
  smooth();
   for (int a = 900; a > 0; a -= 20) {
    triangle(300, 300, a, a,300,300);
                  }
               noFill();
 
               for (int b = 300; b > 0; b -= 20) {
    
             triangle(mouseX,mouseY,300,300,mouseX-40,mouseY-40);
                fill(125,0,mouseY);
             triangle(mouseX,mouseY,300,300,b+mouseX,b+mouseY);
             fill(0,125,0);
             triangle(300,300,mouseX,mouseY,b+mouseX,b+mouseY);
             triangle(300,300,300,300,mouseX,mouseY);
          
           
           
                  }
               
}

