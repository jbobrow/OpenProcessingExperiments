

//draw
//pintar fondo blanco
//dibujar una linea vertical y otra horizonal para dividir en 4 la ventana
//si el mouse esta en la esquina superior izq, dibujar cuadro negro
//si el mouse esta en la esquina derecha ""
//si el mouse esta en la esquina inferior izq ""
//si el mouse esta en la esquina inferior derecha ""


void setup() {
size(200,200);
 }
 
 void draw () {
   background(255);
   line (width/2,0,width/2,200);
   line(0,height/2,200,height/2);
   if (mouseX < width/2 && mouseY < height/2) {
     fill(0);
     rect(25,25,50,50);
 
   } else if (mouseX > width/2 && mouseY > height/2) {
          fill(0);
     rect(125,125,50,50);
     } else if (mouseX > width/2 && mouseY < height/2) {
       fill(0);
     rect(125,25,50,50);
     } else if (mouseX < width/2 && mouseY > height/2) {
       fill(0);
     rect(25,125,50,50);
     }
     }

