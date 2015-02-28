
float x = 1.0;


void setup(){
  size (300,300);
  strokeWeight (.5);
  smooth ();
  background(0);
   
}
void draw (){
  stroke (#EDFF03, 20);

  line( x,mouseX, mouseX, mouseY);
   line( mouseY,mouseX, mouseX, x);
  

}

                
                
