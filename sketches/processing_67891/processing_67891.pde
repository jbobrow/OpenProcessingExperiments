
// Realizado por Gómez Aussenac Luis
// FES ACATLAN UNAM
// TECNOLOGIA MULTIMEDIA
void setup()
 { 
   size(500,500);         //tamaño 
   noFill();              //sin relleno
   background(50);          //fondo
   strokeWeight(3);       //grosor contorno
   smooth();              //depurar el contorno
 }  
void draw()
 {
   background(50);
   stroke(0,0,255);
   ellipse(95,100,50,50); //azul

   stroke(0,0,0);
   ellipse(150,100,50,50); //negro
   
   stroke(255,0,0);
   ellipse(mouseX,mouseY,50,50); //rojo

   stroke(255,255,0);
   ellipse(123,125,50,50); //amarillo

   stroke(0,255,0);
   ellipse(177,125,50,50); //verde 
 } 







