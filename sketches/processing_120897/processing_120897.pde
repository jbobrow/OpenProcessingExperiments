
int x = 0;
int y = 0;

void setup() { 
 size(500, 500); 
 background(255); 
 textSize(20);
 fill (#000000);
 text ("*Volver a mostrar el menu = m *",120,400);
fill(#FF0000); 
 text ("a = rojo",10,40);
 fill(#000000); 
 text ("s = negro",10,70);
 fill(#00FF00); 
 text ("d = verde",10,100);
 
fill(#0000FF); 
 text ("f = azul",10,130);
 fill(#EF0AF7); 
 text ("g = pink barbie",10,150);
 fill(#F7510A); 
 text ("h = naranja",10,180);
 fill(#EBF70A); 
 text ("j = amarillo",10,210);
 fill(#9F9F93); 
 text ("k = gris",10,240);
 fill(#000000); 
 text ("x = rainbow",10,270);
 fill(#000000); 
 text ("z = crazy rainbow",10,300);
 
 fill(#000000); 
 text ("q = goma de borrar fina",230,40);
 fill(#000000); 
 text ("w = goma de borrar grande",230,70);
 fill(#000000); 
 text ("e = start/retry",120,450);
  fill(#000000); 
 text ("flecha arriba = aumenta pincel",190,220);
  fill(#000000); 
 text ("flecha abajo = disminuye pincel",190,250);
}

 
void draw() {

if (mousePressed) {
  line(mouseX, mouseY, pmouseX, pmouseY);
}
if (keyPressed) {
  //lineas
  if (key == 'a') {
    stroke (#FF0000); //rojo
  } 
  
  if (key == 's') {
    stroke (#000000); //negro
  }
   if (key == 'd') { //verde
    stroke (#00FF00);
  }
   if (key == 'f') { //azul
    stroke (#0000FF);
  }
   if (key == 'g') {
     stroke (#EF0AF7); //pink barbie
        
} 

if (key == 'h') {
     stroke (#F7510A); //naranja
      }
      if (key == 'j') {
     stroke (#EBF70A); //amarillo
     }
     if (key == 'k') {
     stroke (#9F9F93); //gris
     }
    
    
   //Gomas de borrar
     if (key == 'q') { //goma fina
      stroke (#FFFFFF);
     }
     if (key == 'w') {
       noStroke();
       fill (#FFFFFF);
     ellipse(mouseX,mouseY,50,50); //goma grande
     }
     
 if (key == 'e') { 
      background(255); 
    } 

     //Crazy rainbow circle NO epilepsy users
     if (key == 'z') {
       noStroke();
       fill(random(0,255), random(0,255), random(0,255));
     ellipse(mouseX,mouseY,abs(mouseX-mouseY),abs(mouseX-mouseY));
     }
     if (key == 'x') {
   noStroke();
       fill(random(0,255), random(0,255), random(0,255));
     ellipse(mouseX,mouseY,50,50);
      }
      
      if (key == 'm') {
           background(255); 
           textSize(20);
           fill (#000000);
           text ("*Volver a mostrar el menu = m *",120,400);
          fill(#FF0000); 
           text ("a = rojo",10,40);
           fill(#000000); 
           text ("s = negro",10,70);
           fill(#00FF00); 
           text ("d = verde",10,100);
           
          fill(#0000FF); 
           text ("f = azul",10,130);
           fill(#EF0AF7); 
           text ("g = pink barbie",10,150);
           fill(#F7510A); 
           text ("h = naranja",10,180);
           fill(#EBF70A); 
           text ("j = amarillo",10,210);
           fill(#9F9F93); 
           text ("k = gris",10,240);
           fill(#000000); 
           text ("x = rainbow",10,270);
           fill(#000000); 
           text ("z = crazy rainbow",10,300);
           
           fill(#000000); 
           text ("q = goma de borrar fina",230,40);
           fill(#000000); 
           text ("w = goma de borrar grande",230,70);
           fill(#000000); 
           text ("e = start/retry",120,450);
            fill(#000000); 
           text ("flecha arriba = aumenta pincel",190,220);
            fill(#000000); 
           text ("flecha abajo = disminuye pincel",190,250);
        
        
      }
      
      //cambiar medidas del lapiz de dibujo
      
      if (key == CODED) {
        if (keyCode == UP) {
          strokeWeight (x++);
        
      }
      if (keyCode == DOWN) {
        strokeWeight (x--);
      }
      
      }
          }
              }




