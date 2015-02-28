
float x = 1.0;
 
 
void setup(){
  size (600,600);
  strokeWeight (.5);
  smooth ();
  background(0);
    
}
void draw (){ //interactividade
  stroke (#E80093, 20);
 
  line( x,mouseX, mouseX, mouseY);
   line( mouseY,mouseX, mouseX, x);
   
 
}
                
                
