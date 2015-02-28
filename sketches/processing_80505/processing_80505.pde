

void setup()
  {
   size(800,400);
   background(190,60,100);
  }

void draw()
  {
    background(190,60,100);
    noFill();
    smooth();
    
    stroke(0,0,255);
    strokeWeight(8);
    ellipse(290,150,100,100); //circulo azul
    
    stroke(0);
    strokeWeight(8);
    ellipse(400,150,100,100); //circulo negro
    
    stroke(255,0,0);
    strokeWeight(8);
    ellipse(mouseX-50,mouseY-50,100,100); // mouseX, mouseY es la función que nos permite 
                                          ////mover el aro junto con el puntero del raton
    stroke(255,255,0);                    
    strokeWeight(8);
    ellipse(345,200,100,100);  //cirulo amarillo
   
    stroke(0,255,0);
    strokeWeight(8);
    ellipse(455,200,100,100); //circulo verde
  }


