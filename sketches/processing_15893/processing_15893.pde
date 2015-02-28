
float rojo = 255 ;
int verde = 0;      
int azul = 0;

void setup (){
  size (900, 450);
  smooth ();
  frameRate (60);
   background (255);
}


      
void draw (){
int ancho = (abs(mouseX-pmouseX));
   if (ancho >=30){
    ancho = 30;
  }
  stroke (rojo, verde, azul, random (255));
  strokeWeight (ancho);

  line (pmouseX, pmouseY, mouseX, mouseY);
  fill (0);
 
  ellipse (mouseX, mouseY, ancho, ancho );
   strokeWeight ((ancho*0.9));
  line (pmouseX- 10, pmouseY, mouseX -10, mouseY);

}
         
void keyPressed (){
  background (255);
     
}                                                
