
  // clicando vc altera a cor da linha de fora do circulo
  
  
  
  
   void setup (){
   size (500,400);

   smooth ();
  }
   void draw() {
     
               // background  (random (255),random (255),random (255));
               //Fade everything which is drawn
                noStroke();
                fill(255, 50);
                rect(0, 0, width, height);      
                background (random (255),0,random (120));
                float radius = 180 + 180 * sin( frameCount * 0.2f );
                // change color of circle paint depending on mouse button
                if (mousePressed)  {
                        stroke( random (255), 255, 255 );
                        fill( random (255),0,random (255) );
                }
                else { 
                        stroke( 0, random (255),random (255) );
                        fill( random (255), 0, random (255) );
                }
 
                // draw a circle where the mouse is located
                //for(int i = 0; i < 500; i +=2){  usar isso num pc bolado
                ellipse(mouseX, mouseY, radius, radius);
        }
   //}

