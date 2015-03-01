
void setup() {
  size(600,600);
  colorMode(HSB);
  background(89,125,0,mouseY);
    
    
}
  
void draw(){

  smooth();
   for (float m= -600; m > 35; m -=sin(20*0.7)) {
    triangle(60, 100, m, m,10,150);
                  }
               ;
   
               for (float r = 300; r > 35;r= r*cos(25*0.1)) {
                 stroke(151,mouseX,mouseY,12);
                 strokeWeight(3.4);
      
             triangle(mouseX-30,mouseY-20,width ,5,mouseX,mouseY);
                fill(156,46,mouseY,120);
             triangle(mouseY-50,mouseX-80,height,63,cos(r+mouseX),sin(r+mouseY));
             fill(78,7,85,92);
             triangle(600,300,mouseX,mouseY,sin(r+mouseX),cos(r+mouseY));
             triangle(600,cos(3.14*0.5),600,sin(3.14*0.5),mouseX,mouseY);
             
             if(mousePressed){
           
  
   
          
      
             triangle(mouseX,mouseY,10,5,mouseX-r,mouseY-r);
                fill(59,82,mouseY, mouseX);
             triangle(mouseX,mouseY,width,height,sin(r+mouseX),sin(r+mouseY));
             fill(78,186,56,mouseY*cos(3.14*0.5));
             triangle(height,width,mouseX,mouseY,cos(r+mouseX),sin(r+mouseY));
             triangle(r*mouseX,r*mouseY,mouseX,mouseY,mouseX,mouseY);
            
             
             
                  }
                 
               }
            
             
             
                  }
                 

