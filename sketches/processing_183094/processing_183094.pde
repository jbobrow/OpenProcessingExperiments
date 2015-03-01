
/* Soraya I. Pérez Rodríguez
Práctica 3 - Taller de Creación de Videojuegos
Grado en Comunicación Audiovisual
Universidad Pompeu Fabra
Enero 2015 */


/* Precarga de imágenes */
  /* @pjs preload="RompeRalphLogo.png"; */


// Variables

  // -- Colores
  
    color black = color(0);
    color blue = color(22,68,118);
    color brown = color(173,69,20);
    color darkblue = color(5,3,60); // Más oscuro
    color darkblue2 = color(16,16,100);
    color darkpink = color(216,120,115);
    color darkred = color(158,0,1);
    color darkred2 = color(131,6,6); // Más oscuro
    color pink = color(238,40,75);
    color softbrown = color(232,185,150);
    color softpink = color(255,173,166);
    color red = color(227,0,0);
    color white = color(255);
    
  // -- Medidas

    int consola;
    int consolapantalla;
    int pantallaX;
    int pantallaY;
    int szpantallaX;
    int szpantallaY;
    
  // -- Posición
  
    float ralphX;
    float ralphY;
  
  // -- Vector Velocidad
  
    float velocidadX;
    float velocidadY;
    
  // -- Imágenes
  
    PImage img;
    
  // -- Objetos
    
    Ralph ralph;
    Objeto pantalla;
    Objeto botonA;
    Objeto botonB;
    
  // -- Otros
  
    boolean clickPantalla;


void setup(){
  
  size(500,700);
  background(black);
  
  ralphX = width/2;
  ralphY = height/2;
  
  velocidadX = 5;
  velocidadY = 4;
  
  consola = 25;
  pantallaX = 0;
  pantallaY = 137;
  szpantallaX = width;
  szpantallaY = height-270; 
  consolapantalla = consola+112+szpantallaY; 
  
  ralph = new Ralph(ralphX, ralphY, 4, red);
  pantalla = new Objeto(pantallaX, pantallaY, szpantallaX, szpantallaY);
  botonA = new Objeto(width/3-28,consolapantalla+((height-consolapantalla)/2)-28,56,56);
  botonB = new Objeto((width/3)*2-28,consolapantalla+((height-consolapantalla)/2)-28,56,56);

  clickPantalla = false;
  
}


void draw(){
  
  // Dibujo consola
 
     rectMode(CORNER);
     
     noStroke();
     fill(darkblue);
     
     rect(0,0,width,consola);
     
     fill(darkblue2);
     rect(0,consola,width,2);
     
     fill(black);
     rect(0,consola+2,width,4);
     
     fill(darkblue2);
     rect(0,consola+6,width,6);
     
     fill(blue);
     rect(0,consola+12,width,8);
     
     fill(darkblue2);
     rect(0,consola+20,width,90); // Parte título
       
     stroke(blue);
     strokeWeight(4);
     line(0,consola+110,width,consola+110); 
   
      // --- Pantalla 
    
         noStroke();
         fill(black);
         rect(pantallaX,pantallaY,szpantallaX,szpantallaY);
   
      // --- Mandos
    
        stroke(blue);
        strokeWeight(3);
        line(0,consola+110+szpantallaY,width,consola+110+szpantallaY);
         
        noStroke();
        fill(darkblue2); 
        rect(0,consolapantalla,width,height-consolapantalla); 
      
        // ---- Botones
   
          // +
          
          fill(darkred);
          ellipse(width/3,consolapantalla+((height-consolapantalla)/2),70,70);
          fill(darkred2);
          ellipse(width/3,consolapantalla+((height-consolapantalla)/2),60,60);
          fill(red);
          ellipse(width/3,consolapantalla+((height-consolapantalla)/2),56,56);
          
          textAlign(CENTER);
          textSize(50);
          fill(white);
          text("+",width/3,(consolapantalla+((height-consolapantalla)/2))+17); 
    
          // -
          
          fill(darkred);
          ellipse((width/3)*2,consolapantalla+((height-consolapantalla)/2),70,70);
          fill(darkred2);
          ellipse((width/3)*2,consolapantalla+((height-consolapantalla)/2),60,60);
          fill(red);
          ellipse((width/3)*2,consolapantalla+((height-consolapantalla)/2),56,56);
          
          textAlign(CENTER);
          textSize(50);
          fill(white);
          text("-",(width/3)*2,(consolapantalla+((height-consolapantalla)/2))+13); 
  
       // --- Rompe Ralph Logo 
       
         imageMode(CENTER);
         
         img = loadImage("RompeRalphLogo.png");
         image(img,width/2,90,90,88);

  // Eventos
  
     if(pantalla.isPressed()){
       velocidadX = random(-10,3);
       velocidadY = random(-10,3);
       clickPantalla = true;
       ralphX = mouseX;
       ralphY = mouseY;
       ralph.changeHairColor();
     }
     
     if(botonA.isPressed()){
       ralph.scaleUp();
     }
     
     if(botonB.isPressed()){
       ralph.scaleDown();
     }

  // Movimiento
 
    ralphX = ralphX + velocidadX;
    ralphY = ralphY + velocidadY;
    
    if((ralphX<=pantallaX) || (ralphX>=width-(ralph.pixel*15))){
      velocidadX = -velocidadX;
    }
     
    if((ralphY<=pantallaY) || (ralphY>=(pantallaY+szpantallaY)-(ralph.pixel*19))){
      velocidadY = -velocidadY;
    }
      
  ralph.paint(ralphX,ralphY);

}
  

void mouseReleased(){
    if (clickPantalla){
      velocidadX = (mouseX-pmouseX);
      velocidadY = (mouseY-pmouseY);
    }
    clickPantalla = false;
} 


// Objetos

class Objeto{
  int x;
  int y;
  int w;
  int h;

  Objeto(int _x, int _y, int _w, int _h){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  }
  
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


class Ralph{
  color pelo;
  float ralphX;
  float ralphY;
  
  int pixel; 
  
  Ralph(float _ralphX, float _ralphY, int _pixel, color _pelo){
    ralphX = _ralphX;
    ralphY = _ralphY;
    pixel = _pixel;
    pelo = _pelo; 
  }

  void scaleUp(){
    pixel += 1;
  
    if(pixel > 8){
      pixel = 8;
    }
  }
  
  void scaleDown(){
     pixel -= 1;
    if(pixel < 2){
      pixel = 2;
    }  
    
    
  }
  
  void changeHairColor(){
    pelo = color(random(255),random(255),random(255));   
  }
  
  void paint(float ralphX, float ralphY){

    rectMode(CORNER);
    
    // -- Pelo
  
      noStroke();
      fill(pelo);
      
      // --- C1
      
        rect(ralphX,ralphY+(pixel*4),pixel,pixel);
        rect(ralphX,ralphY+(pixel*8),pixel,pixel);
     
      // --- C2
      
        rect(ralphX+pixel,ralphY+(pixel*2),pixel,pixel);
        rect(ralphX+pixel,ralphY+(pixel*4),pixel,pixel*2);
        rect(ralphX+pixel,ralphY+(pixel*7),pixel,pixel);  
        
      // --- C3
      
        rect(ralphX+(pixel*2),ralphY+(pixel*2),pixel,pixel*6);
        
      // --- C4
      
        rect(ralphX+(pixel*3),ralphY,pixel,pixel);
        rect(ralphX+(pixel*3),ralphY+(pixel*2),pixel,pixel*9);
        
      // --- C5
      
        rect(ralphX+(pixel*4),ralphY,pixel,pixel*6);
  
      // --- C6
      
        rect(ralphX+(pixel*5),ralphY+pixel,pixel,pixel*4);
 
      // --- C7
      
        rect(ralphX+(pixel*6),ralphY+pixel,pixel,pixel*4);
        
      // --- C8
      
        rect(ralphX+(pixel*7),ralphY,pixel,pixel*5);

      // --- C9
      
        rect(ralphX+(pixel*8),ralphY,pixel,pixel*5);
 
      // --- C10
      
        rect(ralphX+(pixel*9),ralphY+(pixel*2),pixel,pixel*3);
 
      // --- C11
      
        rect(ralphX+(pixel*10),ralphY+pixel,pixel,pixel*5);

      // --- C12
      
        rect(ralphX+(pixel*11),ralphY,pixel,pixel*11);  
        
      // --- C13
      
        rect(ralphX+(pixel*12),ralphY,pixel,pixel); 
        rect(ralphX+(pixel*12),ralphY+(pixel*2),pixel,(pixel*6)); 
        
      // --- C14
      
        rect(ralphX+(pixel*13),ralphY+(pixel*2),pixel,pixel);
        rect(ralphX+(pixel*13),ralphY+(pixel*4),pixel,pixel*2);
        rect(ralphX+(pixel*13),ralphY+(pixel*7),pixel,pixel); 
 
       // --- C14
      
        rect(ralphX+(pixel*14),ralphY+(pixel*4),pixel,pixel);
        rect(ralphX+(pixel*14),ralphY+(pixel*8),pixel,pixel);

    // -- Cara
      
      // --- C2
      
        fill(darkpink);  
        rect(ralphX+pixel,ralphY+(pixel*8),pixel,pixel);
      
        fill(softpink);
        rect(ralphX+pixel,ralphY+(pixel*9),pixel,pixel*2);
 
      // --- C3
      
        fill(darkpink);  
        rect(ralphX+(pixel*2),ralphY+(pixel*8),pixel,pixel*2);
        rect(ralphX+(pixel*2),ralphY+(pixel*12),pixel,pixel);
        
        fill(softpink);
        rect(ralphX+(pixel*2),ralphY+(pixel*10),pixel,pixel);
        rect(ralphX+(pixel*2),ralphY+(pixel*13),pixel,pixel*4);

        fill(darkred);
        rect(ralphX+(pixel*2),ralphY+(pixel*11),pixel,pixel);

      // --- C4
     
        fill(softpink);
        rect(ralphX+(pixel*3),ralphY+(pixel*11),pixel,pixel*3);
        rect(ralphX+(pixel*3),ralphY+(pixel*17),pixel,pixel);

        fill(black);
        rect(ralphX+(pixel*3),ralphY+(pixel*14),pixel,pixel*3); 

      // --- C5
        
        fill(darkpink);     
        rect(ralphX+(pixel*4),ralphY+(pixel*6),pixel,pixel*3);
        rect(ralphX+(pixel*4),ralphY+(pixel*15),pixel,pixel);
        rect(ralphX+(pixel*4),ralphY+(pixel*18),pixel,pixel);
        
        fill(softpink);
        rect(ralphX+(pixel*4),ralphY+(pixel*9),pixel,pixel*4);
        rect(ralphX+(pixel*4),ralphY+(pixel*17),pixel,pixel);

        fill(darkred);
        rect(ralphX+(pixel*4),ralphY+(pixel*16),pixel,pixel);

        fill(black);
        rect(ralphX+(pixel*4),ralphY+(pixel*13),pixel,pixel*2); 

      // --- C6

        fill(darkpink);
        rect(ralphX+(pixel*5),ralphY+(pixel*7),pixel,pixel);
        rect(ralphX+(pixel*5),ralphY+(pixel*18),pixel,pixel);
 
        fill(softpink);
        rect(ralphX+(pixel*5),ralphY+(pixel*5),pixel,pixel);
        rect(ralphX+(pixel*5),ralphY+(pixel*10),pixel,pixel*3);
        rect(ralphX+(pixel*5),ralphY+(pixel*17),pixel,pixel);
        
        fill(darkred);
        rect(ralphX+(pixel*5),ralphY+(pixel*6),pixel,pixel);
        
        fill(black);
        rect(ralphX+(pixel*5),ralphY+(pixel*14),pixel,pixel*2);        
        
        fill(white);
        rect(ralphX+(pixel*5),ralphY+(pixel*8),pixel,pixel*2); // Parte ojo
        rect(ralphX+(pixel*5),ralphY+(pixel*13),pixel,pixel); // Parte dientes              
        rect(ralphX+(pixel*5),ralphY+(pixel*16),pixel,pixel); // Parte dientes 

      // --- C7

        fill(darkpink);
        rect(ralphX+(pixel*6),ralphY+(pixel*18),pixel,pixel);
 
        fill(softpink);
        rect(ralphX+(pixel*6),ralphY+(pixel*5),pixel,pixel*2);
        rect(ralphX+(pixel*6),ralphY+(pixel*12),pixel,pixel);
        rect(ralphX+(pixel*6),ralphY+(pixel*17),pixel,pixel);
        
        fill(pink);
        rect(ralphX+(pixel*6),ralphY+(pixel*10),pixel,pixel*2); 
        
        fill(darkred);
        rect(ralphX+(pixel*6),ralphY+(pixel*7),pixel,pixel);
        rect(ralphX+(pixel*6),ralphY+(pixel*15),pixel,pixel);
        
        fill(black);
        rect(ralphX+(pixel*6),ralphY+(pixel*9),pixel,pixel); // Parte ojo
        rect(ralphX+(pixel*6),ralphY+(pixel*14),pixel,pixel); // Parte boca        
        
        fill(white);
        rect(ralphX+(pixel*6),ralphY+(pixel*8),pixel,pixel); // Parte ojo
        rect(ralphX+(pixel*6),ralphY+(pixel*13),pixel,pixel); // Parte dientes              
        rect(ralphX+(pixel*6),ralphY+(pixel*16),pixel,pixel); // Parte dientes 
      
      // --- C8
      
        fill(darkpink);
        rect(ralphX+(pixel*7),ralphY+(pixel*7),pixel,pixel*2);
        rect(ralphX+(pixel*7),ralphY+(pixel*18),pixel,pixel);
 
        fill(softpink);
        rect(ralphX+(pixel*7),ralphY+(pixel*5),pixel,pixel*2);
        rect(ralphX+(pixel*7),ralphY+(pixel*9),pixel,pixel);
        rect(ralphX+(pixel*7),ralphY+(pixel*12),pixel,pixel);
        rect(ralphX+(pixel*7),ralphY+(pixel*17),pixel,pixel);
        
        fill(pink);
        rect(ralphX+(pixel*7),ralphY+(pixel*10),pixel,pixel*2); 
        
        fill(darkred);
        rect(ralphX+(pixel*7),ralphY+(pixel*15),pixel,pixel);
        
        fill(black);
        rect(ralphX+(pixel*7),ralphY+(pixel*14),pixel,pixel); // Parte boca        
        
        fill(white);
        rect(ralphX+(pixel*7),ralphY+(pixel*13),pixel,pixel); // Parte dientes              
        rect(ralphX+(pixel*7),ralphY+(pixel*16),pixel,pixel); // Parte dientes 
      
      // --- C9

        fill(darkpink);
        rect(ralphX+(pixel*8),ralphY+(pixel*18),pixel,pixel);
 
        fill(softpink);
        rect(ralphX+(pixel*8),ralphY+(pixel*5),pixel,pixel*2);
        rect(ralphX+(pixel*8),ralphY+(pixel*12),pixel,pixel);
        rect(ralphX+(pixel*8),ralphY+(pixel*17),pixel,pixel);
        
        fill(pink);
        rect(ralphX+(pixel*8),ralphY+(pixel*10),pixel,pixel*2); 
        
        fill(darkred);
        rect(ralphX+(pixel*8),ralphY+(pixel*7),pixel,pixel);
        rect(ralphX+(pixel*8),ralphY+(pixel*15),pixel,pixel);
        
        fill(black);
        rect(ralphX+(pixel*8),ralphY+(pixel*9),pixel,pixel); // Parte ojo
        rect(ralphX+(pixel*8),ralphY+(pixel*14),pixel,pixel); // Parte boca        
        
        fill(white);
        rect(ralphX+(pixel*8),ralphY+(pixel*8),pixel,pixel); // Parte ojo
        rect(ralphX+(pixel*8),ralphY+(pixel*13),pixel,pixel); // Parte dientes              
        rect(ralphX+(pixel*8),ralphY+(pixel*16),pixel,pixel); // Parte dientes 

      // --- C10

        fill(darkpink);
        rect(ralphX+(pixel*9),ralphY+(pixel*7),pixel,pixel);
        rect(ralphX+(pixel*9),ralphY+(pixel*18),pixel,pixel);
 
        fill(softpink);
        rect(ralphX+(pixel*9),ralphY+(pixel*5),pixel,pixel);
        rect(ralphX+(pixel*9),ralphY+(pixel*10),pixel,pixel*3);
        rect(ralphX+(pixel*9),ralphY+(pixel*17),pixel,pixel);
        
        fill(darkred);
        rect(ralphX+(pixel*9),ralphY+(pixel*6),pixel,pixel);
        
        fill(black);
        rect(ralphX+(pixel*9),ralphY+(pixel*14),pixel,pixel*2);        
        
        fill(white);
        rect(ralphX+(pixel*9),ralphY+(pixel*8),pixel,pixel*2); // Parte ojo
        rect(ralphX+(pixel*9),ralphY+(pixel*13),pixel,pixel); // Parte dientes              
        rect(ralphX+(pixel*9),ralphY+(pixel*16),pixel,pixel); // Parte dientes
        
      // --- C11
        
        fill(darkpink);     
        rect(ralphX+(pixel*10),ralphY+(pixel*6),pixel,pixel*3);
        rect(ralphX+(pixel*10),ralphY+(pixel*15),pixel,pixel);
        rect(ralphX+(pixel*10),ralphY+(pixel*18),pixel,pixel);
        
        fill(softpink);
        rect(ralphX+(pixel*10),ralphY+(pixel*9),pixel,pixel*4);
        rect(ralphX+(pixel*10),ralphY+(pixel*17),pixel,pixel);

        fill(darkred);
        rect(ralphX+(pixel*10),ralphY+(pixel*16),pixel,pixel);

        fill(black);
        rect(ralphX+(pixel*10),ralphY+(pixel*13),pixel,pixel*2); 
        
      // --- C12
     
        fill(softpink);
        rect(ralphX+(pixel*11),ralphY+(pixel*11),pixel,pixel*3);
        rect(ralphX+(pixel*11),ralphY+(pixel*17),pixel,pixel);

        fill(black);
        rect(ralphX+(pixel*11),ralphY+(pixel*14),pixel,pixel*3); 

      // --- C13
      
        fill(darkpink);  
        rect(ralphX+(pixel*12),ralphY+(pixel*8),pixel,pixel*2);
        rect(ralphX+(pixel*12),ralphY+(pixel*12),pixel,pixel);
        
        fill(softpink);
        rect(ralphX+(pixel*12),ralphY+(pixel*10),pixel,pixel);
        rect(ralphX+(pixel*12),ralphY+(pixel*13),pixel,pixel*4);

        fill(darkred);
        rect(ralphX+(pixel*12),ralphY+(pixel*11),pixel,pixel);

       // --- C14
      
        fill(darkpink);  
        rect(ralphX+(pixel*13),ralphY+(pixel*8),pixel,pixel);
      
        fill(softpink);
        rect(ralphX+(pixel*13),ralphY+(pixel*9),pixel,pixel*2);    
  }    
}
  




