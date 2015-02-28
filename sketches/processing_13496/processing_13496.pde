
class Flor{
 float posX, posY,tam,angulo,algo;
 color colo;

 Flor (float posX_, float posY_,float tam_, float angulo_ ){
  posX = posX_;
  posY = posY_;
  tam = tam_;
  angulo = angulo_;
  colo = color (100,50,180,200);

  
 } 
  
  void dibujar(){
   
    algo = map (mouseX,0,width,0,150);
     pushMatrix();
     translate(posX,posY);  //traslada la flor a la posición 300,200 (la mitad de la pantalla)
     rotate(radians(frameCount*-0.5)); //hace que la flor completa gire
          
       pushMatrix();
       translate(0,0);  //traslada la flor al punto 0,0 que es la posición 300,200 que ya habiamos trasladado 
       rotate(radians(angulo)); //hace que los petalos esten separados entre sí
       
         pushMatrix();
         translate(0,algo); // aleja el petalo 100 px hacia afuera
         rotate(radians(mouseX*.5)); // hace girar los petalos
         strokeWeight(5);
         stroke(50,50,0,75);
           fill (25,150,55,25);
         rect (0,0,tam/2,tam/2);
          fill (colo);
         ellipse(0,0,tam,tam);
       
         
       popMatrix();
       popMatrix();
       popMatrix();
  
    }
   }
  



  


