
// Realizado por Gómez Aussenac Luis
// FES ACATLAN UNAM
// TECNOLOGIA MULTIMEDIA
float x=random(10,490);
float y=random(10,490);

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
   
   stroke(0,0,255);          //azul
   ellipse(95,100,50,50); 
   
   stroke(0,0,0);            //negro
   ellipse(150,100,50,50); 
   
   stroke(255,255,0);       //amarillo
   ellipse(123,125,50,50); 

   stroke(0,255,0);         //verde
   ellipse(177,125,50,50);  
   
   stroke(255,0,0);         //rojo
   
   if( x>=200 && x<=210 && y>=95 && y<=105 )
      {
        x=x;
        y=y;
      }
   else
      {
       x=random(10,490);
       y=random(10,490);
      }
      
   ellipse(x,y,50,50);   
 } 







