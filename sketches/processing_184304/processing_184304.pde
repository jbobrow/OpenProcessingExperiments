
/* Soraya I. Pérez Rodríguez
Práctica 4 - Taller de Creación de Videojuegos
Grado en Comunicación Audiovisual
Universidad Pompeu Fabra
Enero 2015 */

// Variables

 // -- Colores
  
    color black = color(0);
    color blue = color(0,0,255);
    color darkgray = color(86,90,93);
    color darkgreen = color(14,58,23);
    color gray = color(150,156,156);
    color green = color(37,87, 29); 
    color green2 = color(0,255,52);
    color orange = color(255,160,68);
    color red = color(136,20,0);
    color softgray = color(220,224,225);
    color white = color(255);
    
  // -- Cursor
  
    WaterCursor water;
    
  // -- Número de Gremlins Inicial + Definición Array
  
    int numGremlins = 3;
    Gremlin[] gremlins = new Gremlin[numGremlins];

  // -- Necesario para ejecutar el evento mousePressed una sola vez
  
    boolean firstTimePressed = true;
    
    
void setup(){
  
  size(600,450);
  background(0);
  
  // Inicialización del Array de Gremlins 
  
  for(int i=0;i<numGremlins;i++){
    gremlins[i] = new Gremlin(random(100,width-100), random(100,height-100), 4, "good");
  }
  
  // Inicialización del cursor
  
  noCursor();
  water = new WaterCursor(mouseX,mouseY,3);

}


void draw(){
  
  background(0);
   
  // Recorremos todos los gremlins y actualizamos su posición
  
  for(int i=0;i<gremlins.length;i++){
  
    // Guardamos un apuntador al gremlin actual
      Gremlin g = gremlins[i];
      
    // Actualizamos la posición del gremlin
      g.updatePosition();
      
    // Pintamos al gremlin en pantalla
      g.paint();
  
  }
  
  // Actualizamos la posición del cursor y lo pintamos en pantalla
  
    water.x = mouseX;
    water.y = mouseY;
    water.paint();

}


void mousePressed(){
  
  //  Controlamos que sólo se ejecute esta acción una vez cuando el usuario está pulsado con el ratón
  
  if(firstTimePressed){
    firstTimePressed = false;
       
    // Recorremos el array de gremlins en sentido inverso
    
    for(int i=gremlins.length-1;i>=0;i--){
      
      // Guardamos un apuntador al gremlin actual
      
      Gremlin g = gremlins[i];
      
      // Comprobamos si se está pulsando ese gremlin
      
      if(g.isPressed()){
       
        // Transformamos el gremlin en malo
       
        g.turnBad();
        
        // Añadimos un nuevo gremlin al array. Lo situamos en la misma posición del gremlin sobre el que se ha pulsado
        
        Gremlin newGremlin = new Gremlin(g.x, g.y, g.pixel, "bad");
        gremlins = (Gremlin[]) append(gremlins,newGremlin);
      }
    }  
  }
}


void mouseReleased(){
  
  // Volvemos a indicar que se trata de la primera vez que se pulsa el ratón
  
  firstTimePressed = true;  

}

// Clases

class WaterCursor{
   
  float x;
   float y;
   float pixel;
 
   // Inicializa el icono del cursor
   
   WaterCursor(float _x, float _y, float _pixel){
     x = _x;
     y = _y;
     pixel = _pixel;
  
 }
 
   // Dibuja el cursor
   
   void paint(){
  
    // --- C1
 
      fill(black);
      rect(x,y+(pixel*2),pixel,pixel);
      
      fill(darkgray);
      rect(x,y+(pixel*3),pixel,pixel*4);
      
    // --- C2
 
      fill(black);
      rect(x+pixel,y+pixel,pixel,pixel);
      rect(x+pixel,y+(pixel*3),pixel,pixel);
      
      fill(darkgray);
      rect(x+pixel,y+(pixel*7),pixel,pixel*3);
      
      fill(blue);
      rect(x+pixel,y+(pixel*2),pixel,pixel);
     
      fill(softgray);
      rect(x+pixel,y+(pixel*4),pixel,pixel*3); 
  
    // --- C3
 
      fill(black);
      rect(x+(pixel*2),y+pixel,pixel,pixel);
      rect(x+(pixel*2),y+(pixel*4),pixel,pixel);
      
      fill(darkgray);
      rect(x+(pixel*2),y+(pixel*10),pixel,pixel*2);
      
      fill(blue);
      rect(x+(pixel*2),y+(pixel*2),pixel,pixel*2);
     
      fill(softgray);
      rect(x+(pixel*2),y+(pixel*5),pixel,pixel*5); 

    // --- C4
 
      fill(black);
      rect(x+(pixel*3),y,pixel,pixel);
      rect(x+(pixel*3),y+(pixel*5),pixel,pixel);
      
      fill(darkgray);
      rect(x+(pixel*3),y+(pixel*12),pixel,pixel);
      
      fill(blue);
      rect(x+(pixel*3),y+pixel,pixel,pixel*4);
      rect(x+(pixel*3),y+(pixel*6),pixel,pixel);
     
      fill(softgray);
      rect(x+(pixel*3),y+(pixel*7),pixel,pixel*5); 

    // --- C5
 
      fill(black);
      rect(x+(pixel*4),y,pixel,pixel);
      rect(x+(pixel*4),y+(pixel*5),pixel,pixel);
      
      fill(darkgray);
      rect(x+(pixel*4),y+(pixel*12),pixel,pixel);
      
      fill(blue);
      rect(x+(pixel*4),y+pixel,pixel,pixel*4);
     
      fill(softgray);
      rect(x+(pixel*4),y+(pixel*8),pixel,pixel*4); 

      fill(gray);
      rect(x+(pixel*4),y+(pixel*6),pixel,pixel*2);

    // --- C6
 
      fill(black);
      rect(x+(pixel*5),y,pixel,pixel);
      rect(x+(pixel*5),y+(pixel*5),pixel,pixel);
      
      fill(darkgray);
      rect(x+(pixel*5),y+(pixel*12),pixel,pixel);
      
      fill(blue);
      rect(x+(pixel*5),y+pixel,pixel,pixel*4);

      fill(gray);
      rect(x+(pixel*5),y+(pixel*6),pixel,pixel*6);

    // --- C7
 
      fill(black);
      rect(x+(pixel*6),y,pixel,pixel);
      rect(x+(pixel*6),y+(pixel*5),pixel,pixel);
      
      fill(darkgray);
      rect(x+(pixel*6),y+(pixel*12),pixel,pixel);
      
      fill(blue);
      rect(x+(pixel*6),y+pixel,pixel,pixel*4);

      fill(gray);
      rect(x+(pixel*6),y+(pixel*6),pixel,pixel*6);

    // --- C8
 
      fill(black);
      rect(x+(pixel*7),y,pixel,pixel);
      rect(x+(pixel*7),y+(pixel*4),pixel,pixel);
      
      fill(darkgray);
      rect(x+(pixel*7),y+(pixel*8),pixel,pixel);
      rect(x+(pixel*7),y+(pixel*10),pixel,pixel*2);
      
      fill(blue);
      rect(x+(pixel*7),y+pixel,pixel,pixel*3);
      rect(x+(pixel*7),y+(pixel*5),pixel,pixel*3);
      rect(x+(pixel*7),y+(pixel*9),pixel,pixel);

      fill(gray);
      rect(x+(pixel*7),y+(pixel*8),pixel,pixel);
      rect(x+(pixel*7),y+(pixel*10),pixel,pixel);
      
    // --- C9
 
      fill(black);
      rect(x+(pixel*8),y,pixel,pixel);
      rect(x+(pixel*8),y+(pixel*4),pixel,pixel);
      
      fill(darkgray);
      rect(x+(pixel*8),y+(pixel*10),pixel,pixel*2);
      
      fill(blue);
      rect(x+(pixel*8),y+pixel,pixel,pixel*3);
      rect(x+(pixel*8),y+(pixel*5),pixel,pixel);
     
      fill(gray);
      rect(x+(pixel*8),y+(pixel*6),pixel,pixel*5);

    // --- C10
 
      fill(black);
      rect(x+(pixel*9),y+pixel,pixel,pixel);
      rect(x+(pixel*9),y+(pixel*3),pixel,pixel);
      
      fill(darkgray);
      rect(x+(pixel*9),y+(pixel*7),pixel,pixel*3);
      
      fill(blue);
      rect(x+(pixel*9),y+(pixel*2),pixel,pixel);
     
      fill(gray);
      rect(x+(pixel*9),y+(pixel*4),pixel,pixel*3); 

    // --- C11
 
      fill(black);
      rect(x+(pixel*10),y+(pixel*2),pixel,pixel);
      
      fill(darkgray);
      rect(x+(pixel*10),y+(pixel*3),pixel,pixel*4);
   }  
}


class Gremlin{
  
  float x;
  float y;
  float w;
  float h;
  float vx;
  float vy;
  float pixel;
  String type;
  color c1;
  color c2;
  color c3;
  
  // Inicializa el gremlin
  
  Gremlin(float _x, float _y, float _pixel, String _type){
    x = _x;
    y = _y;
    vx = random(1,4); // Velocidad x aleatoria
    vy = random(1,4); // Velocidad y aleatoria
    pixel = _pixel;
    w = 32*pixel;
    h = 12*pixel;
    type = _type;
  }
  
  // Vuelve malo al gremlin
 
  void turnBad(){
   
    // Cambiamos el tipo del gremlin para que ahora sea malo
    
    type = "bad";
   
    // Hacemos que el gremlin sea un poco más pequeño
   
    pixel = pixel - 0.5; 
    w = 32*pixel;
    h = 12*pixel;
  
  }
  
  //Dibuja el gremlin
  
  void paint(){
    
    // Indicamos los colores del gremlin en función del tipo
    
    if(type == "good"){
      // Colores del gremlin bueno
      c1 = red;
      c2 = white;
      c3 = orange;  
    }else{
      // Colores del gremlin malo
      c1 = darkgreen;
      c2 = green2;
      c3 = green;
    }
    
    noStroke();
  
    // --- C1
    
      fill(c1);
      rect(x,y+(pixel*2),pixel,pixel);
      
    // --- C2
    
      rect(x+pixel,y+pixel,pixel,pixel);
      rect(x+pixel,y+(pixel*3),pixel,pixel);
      
      fill(c2);
      rect(x+pixel,y+(pixel*2),pixel,pixel);
    
    // --- C3
      
      fill(c1);
      rect(x+(pixel*2),y,pixel,pixel);
      rect(x+(pixel*2),y+(pixel*2),pixel,pixel*2);
      
      fill(c3);
      rect(x+(pixel*2),y+pixel,pixel,pixel);

    // --- C4
      
      fill(c1);
      rect(x+(pixel*3),y,pixel,pixel);
      rect(x+(pixel*3),y+(pixel*2),pixel,pixel*4);
      
      fill(c2);
      rect(x+(pixel*3),y+pixel,pixel,pixel);

    // --- C5
      
      fill(c1);
      rect(x+(pixel*4),y,pixel,pixel);
      rect(x+(pixel*4),y+(pixel*2),pixel,pixel);
      rect(x+(pixel*4),y+(pixel*6),pixel,pixel);
      
      fill(c2);
      rect(x+(pixel*4),y+pixel,pixel,pixel);
      rect(x+(pixel*4),y+(pixel*4),pixel,pixel);

      fill(c3);
      rect(x+(pixel*4),y+(pixel*3),pixel,pixel);
      rect(x+(pixel*4),y+(pixel*5),pixel,pixel);

    // --- C6
      
      fill(c1);
      rect(x+(pixel*5),y,pixel,pixel);
      rect(x+(pixel*5),y+(pixel*2),pixel,pixel);
      rect(x+(pixel*5),y+(pixel*7),pixel,pixel);
      
      fill(c2);
      rect(x+(pixel*5),y+pixel,pixel,pixel);
      rect(x+(pixel*5),y+(pixel*3),pixel,pixel);
      rect(x+(pixel*5),y+(pixel*5),pixel,pixel);

      fill(c3);
      rect(x+(pixel*5),y+(pixel*4),pixel,pixel);
      rect(x+(pixel*5),y+(pixel*6),pixel,pixel);

    // --- C7
      
      fill(c1);
      rect(x+(pixel*6),y,pixel,pixel);
      rect(x+(pixel*6),y+(pixel*8),pixel,pixel);
      
      fill(c2);
      rect(x+(pixel*6),y+(pixel*4),pixel,pixel*3);

      fill(c3);
      rect(x+(pixel*6),y+pixel,pixel,pixel*3);
      rect(x+(pixel*6),y+(pixel*7),pixel,pixel);

    // --- C8
      
      fill(c1);
      rect(x+(pixel*7),y+pixel,pixel,pixel);
      rect(x+(pixel*7),y+(pixel*3),pixel,pixel);      
      rect(x+(pixel*7),y+(pixel*8),pixel,pixel);
      
      fill(c2);
      rect(x+(pixel*7),y+(pixel*2),pixel,pixel);
      rect(x+(pixel*7),y+(pixel*6),pixel,pixel);
      
      fill(c3);
      rect(x+(pixel*7),y+(pixel*4),pixel,pixel*2);
      rect(x+(pixel*7),y+(pixel*7),pixel,pixel);

    // --- C9
      
      fill(c1);
      rect(x+(pixel*8),y+pixel,pixel,pixel);
      rect(x+(pixel*8),y+(pixel*4),pixel,pixel);      
      rect(x+(pixel*8),y+(pixel*6),pixel,pixel);
      rect(x+(pixel*8),y+(pixel*8),pixel,pixel);
      
      fill(c3);
      rect(x+(pixel*8),y+(pixel*2),pixel,pixel*2);
      rect(x+(pixel*8),y+(pixel*5),pixel,pixel);
      rect(x+(pixel*8),y+(pixel*7),pixel,pixel);

    // --- C10
      
      fill(c1);
      rect(x+(pixel*9),y+pixel,pixel,pixel*10);

    // --- C11
      
      fill(c1);
      rect(x+(pixel*10),y+(pixel*2),pixel,pixel*4);
      rect(x+(pixel*10),y+(pixel*10),pixel,pixel*2);      

      fill(c2);
      rect(x+(pixel*10),y+(pixel*7),pixel,pixel*2);
      
      fill(c3);
      rect(x+(pixel*10),y+(pixel*6),pixel,pixel);
      rect(x+(pixel*10),y+(pixel*9),pixel,pixel);

    // --- C12
      
      fill(c1);
      rect(x+(pixel*11),y+(pixel*2),pixel,pixel*3);
      rect(x+(pixel*11),y+(pixel*11),pixel,pixel);      

      fill(c2);
      rect(x+(pixel*11),y+(pixel*6),pixel,pixel);
      rect(x+(pixel*11),y+(pixel*8),pixel,pixel*2);

      fill(c3);
      rect(x+(pixel*11),y+(pixel*5),pixel,pixel);
      rect(x+(pixel*11),y+(pixel*7),pixel,pixel);
      rect(x+(pixel*11),y+(pixel*10),pixel,pixel);

    // --- C13
      
      fill(c1);
      rect(x+(pixel*12),y+(pixel*4),pixel,pixel);      
      rect(x+(pixel*12),y+(pixel*8),pixel,pixel*2);
      rect(x+(pixel*12),y+(pixel*10),pixel,pixel*2);

      fill(c2);
      rect(x+(pixel*12),y+(pixel*5),pixel,pixel);
      rect(x+(pixel*12),y+(pixel*7),pixel,pixel);
      rect(x+(pixel*12),y+(pixel*9),pixel,pixel*2);

      fill(c3);
      rect(x+(pixel*12),y+(pixel*2),pixel,pixel*2);
      rect(x+(pixel*12),y+(pixel*6),pixel,pixel);

    // --- C14
      
      fill(c1);
      rect(x+(pixel*13),y+(pixel*4),pixel,pixel);
      rect(x+(pixel*13),y+(pixel*7),pixel,pixel*2);
      rect(x+(pixel*13),y+(pixel*10),pixel,pixel);      

      fill(c2);
      rect(x+(pixel*13),y+(pixel*5),pixel,pixel);
      rect(x+(pixel*13),y+(pixel*9),pixel,pixel);
     
      fill(c3);
      rect(x+(pixel*13),y+(pixel*3),pixel,pixel);
      rect(x+(pixel*13),y+(pixel*6),pixel,pixel);
      rect(x+(pixel*13),y+(pixel*11),pixel,pixel);

    // --- C15
      
      fill(c1);
      rect(x+(pixel*14),y+(pixel*4),pixel,pixel);    
      rect(x+(pixel*14),y+(pixel*11),pixel,pixel);  

      fill(c2);
      rect(x+(pixel*14),y+(pixel*5),pixel,pixel*2);
      rect(x+(pixel*14),y+(pixel*9),pixel,pixel*2);

      fill(c3);
      rect(x+(pixel*14),y+(pixel*7),pixel,pixel*2);
      rect(x+(pixel*14),y+(pixel*10),pixel,pixel);

    // --- C16
      
      fill(c1);
      rect(x+(pixel*15),y+(pixel*5),pixel,pixel);    
      rect(x+(pixel*15),y+(pixel*9),pixel,pixel);  

      fill(c2);
      rect(x+(pixel*15),y+(pixel*6),pixel,pixel*3);
      rect(x+(pixel*15),y+(pixel*10),pixel,pixel);

      fill(c3);
      rect(x+(pixel*15),y+(pixel*4),pixel,pixel);
      rect(x+(pixel*15),y+(pixel*11),pixel,pixel);

    // --- C17
      
      fill(c1);
      rect(x+(pixel*16),y+(pixel*5),pixel,pixel*5);    
      
      fill(c3);
      rect(x+(pixel*16),y+(pixel*4),pixel,pixel);
      rect(x+(pixel*16),y+(pixel*10),pixel,pixel*2);

    // --- C18
      
      fill(c1);
      rect(x+(pixel*17),y+(pixel*4),pixel,pixel*3);    
      rect(x+(pixel*17),y+(pixel*8),pixel,pixel*2);
      rect(x+(pixel*17),y+(pixel*11),pixel,pixel);
      
      fill(c3);
      rect(x+(pixel*17),y+(pixel*7),pixel,pixel);
      rect(x+(pixel*17),y+(pixel*10),pixel,pixel);

    // --- C19
      
      fill(c1);
      rect(x+(pixel*18),y+(pixel*4),pixel,pixel*2);    
      rect(x+(pixel*18),y+(pixel*8),pixel,pixel*3);
      
      fill(c2);
      rect(x+(pixel*18),y+(pixel*7),pixel,pixel);
      
      fill(c3);
      rect(x+(pixel*18),y+(pixel*3),pixel,pixel);
      rect(x+(pixel*18),y+(pixel*6),pixel,pixel);
      rect(x+(pixel*18),y+(pixel*11),pixel,pixel);

    // --- C20
      
      fill(c1);
      rect(x+(pixel*19),y+(pixel*4),pixel,pixel*2);    
      rect(x+(pixel*19),y+(pixel*7),pixel,pixel*2);
      rect(x+(pixel*19),y+(pixel*10),pixel,pixel*2);
      
      fill(c3);
      rect(x+(pixel*19),y+(pixel*2),pixel,pixel*2);
      rect(x+(pixel*19),y+(pixel*6),pixel,pixel);
      rect(x+(pixel*19),y+(pixel*9),pixel,pixel);

    // --- C21
      
      fill(c1);
      rect(x+(pixel*20),y+(pixel*2),pixel,pixel*4);    
      rect(x+(pixel*20),y+(pixel*9),pixel,pixel*3);
      
      fill(c2);
      rect(x+(pixel*20),y+(pixel*7),pixel,pixel*2);
      
      fill(c3);
      rect(x+(pixel*20),y+(pixel*6),pixel,pixel);

    // --- C22
      
      fill(c1);
      rect(x+(pixel*21),y+(pixel*2),pixel,pixel*5);    
      rect(x+(pixel*21),y+(pixel*8),pixel,pixel*4);
      
      fill(c3);
      rect(x+(pixel*21),y+(pixel*7),pixel,pixel);

    // --- C23
      
      fill(c1);
      rect(x+(pixel*22),y+pixel,pixel,pixel*10);

    // --- C24
      
      fill(c1);
      rect(x+(pixel*23),y+pixel,pixel,pixel);
      rect(x+(pixel*23),y+(pixel*4),pixel,pixel);      
      rect(x+(pixel*23),y+(pixel*6),pixel,pixel);
      rect(x+(pixel*23),y+(pixel*8),pixel,pixel);
      
      fill(c3);
      rect(x+(pixel*23),y+(pixel*2),pixel,pixel*2);
      rect(x+(pixel*23),y+(pixel*5),pixel,pixel);
      rect(x+(pixel*23),y+(pixel*7),pixel,pixel);

    // --- C25
      
      fill(c1);
      rect(x+(pixel*24),y+pixel,pixel,pixel);
      rect(x+(pixel*24),y+(pixel*3),pixel,pixel);      
      rect(x+(pixel*24),y+(pixel*8),pixel,pixel);
      
      fill(c2);
      rect(x+(pixel*24),y+(pixel*2),pixel,pixel);
      rect(x+(pixel*24),y+(pixel*6),pixel,pixel);
      
      fill(c3);
      rect(x+(pixel*24),y+(pixel*4),pixel,pixel*2);
      rect(x+(pixel*24),y+(pixel*7),pixel,pixel);

    // --- C26
      
      fill(c1);
      rect(x+(pixel*25),y,pixel,pixel);
      rect(x+(pixel*25),y+(pixel*8),pixel,pixel);
      
      fill(c2);
      rect(x+(pixel*25),y+(pixel*4),pixel,pixel*3);

      fill(c3);
      rect(x+(pixel*25),y+pixel,pixel,pixel*3);
      rect(x+(pixel*25),y+(pixel*7),pixel,pixel);

    // --- C27
      
      fill(c1);
      rect(x+(pixel*26),y,pixel,pixel);
      rect(x+(pixel*26),y+(pixel*2),pixel,pixel);
      rect(x+(pixel*26),y+(pixel*7),pixel,pixel);
      
      fill(c2);
      rect(x+(pixel*26),y+pixel,pixel,pixel);
      rect(x+(pixel*26),y+(pixel*3),pixel,pixel);
      rect(x+(pixel*26),y+(pixel*5),pixel,pixel);

      fill(c3);
      rect(x+(pixel*26),y+(pixel*4),pixel,pixel);
      rect(x+(pixel*26),y+(pixel*6),pixel,pixel);

    // --- C28
      
      fill(c1);
      rect(x+(pixel*27),y,pixel,pixel);
      rect(x+(pixel*27),y+(pixel*2),pixel,pixel);
      rect(x+(pixel*27),y+(pixel*6),pixel,pixel);
      
      fill(c2);
      rect(x+(pixel*27),y+pixel,pixel,pixel);
      rect(x+(pixel*27),y+(pixel*4),pixel,pixel);

      fill(c3);
      rect(x+(pixel*27),y+(pixel*3),pixel,pixel);
      rect(x+(pixel*27),y+(pixel*5),pixel,pixel);

    // --- C29
      
      fill(c1);
      rect(x+(pixel*28),y,pixel,pixel);
      rect(x+(pixel*28),y+(pixel*2),pixel,pixel*4);
      
      fill(c2);
      rect(x+(pixel*28),y+pixel,pixel,pixel);      

    // --- C30
      
      fill(c1);
      rect(x+(pixel*29),y,pixel,pixel);
      rect(x+(pixel*29),y+(pixel*2),pixel,pixel*2);
      
      fill(c3);
      rect(x+(pixel*29),y+pixel,pixel,pixel);
      
    // --- C31
    
      fill(c1);    
      rect(x+(pixel*30),y+pixel,pixel,pixel);
      rect(x+(pixel*30),y+(pixel*3),pixel,pixel);
      
      fill(c2);
      rect(x+(pixel*30),y+(pixel*2),pixel,pixel);

    // --- C32
    
      fill(c1);
      rect(x+(pixel*31),y+(pixel*2),pixel,pixel);  
  }
  
  
  // Actualiza la posición del gremlin 
  
  void updatePosition(){
  
    x += vx;
    y += vy; 
    
    if((x<=0) || (x>=width-w)){
      vx = -vx;
    }
     
    if((y<=0) || (y>=height-h)){
      vy = -vy;
    }
  }
  
  
  // Comprueba si el cursor está encima del gremlin y el usuario está pulsando el botón del ratón
  
  boolean isPressed(){
    if(mousePressed){
      if(mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h){
        return true;
      }else{
        return false;  
      }
    }else{
      return false;  
    }
  }  
  
}
