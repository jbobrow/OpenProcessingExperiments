
void setup() {
  size(600,600);
  background(89,78,0);
   
   
}
 
void draw(){
  fill(890900);
  smooth();
   for (int a = 2; a > 0; a -= 20) {
    triangle(56, 100, a, a,300,300);
                  }
               ;
  
               for (int b = 100; b > 0; b -= 25) {
     
             triangle(mouseX,mouseY,100,5,mouseX-20,mouseY-10);
                fill(459,456,mouseY);
             triangle(mouseX,mouseY,30,300,b+mouseX,b+mouseY);
             fill(78,7,790);
             triangle(300,300,mouseX,mouseY,b+mouseX,b+mouseY);
             triangle(300,200,300,100,mouseX,mouseY);
           
            
            
                  }
                
}

