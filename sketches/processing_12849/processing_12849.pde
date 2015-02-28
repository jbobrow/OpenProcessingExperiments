

                
Molecula [] m;
int cant;

void setup () {
  size (600,400);
  cant = 150;
  m = new Molecula[cant];
    for (int i=0 ; i<cant ; i++ ) {
      m[i] = new Molecula();
    }
    smooth();
    
}

void draw () {
  background(0);
 //la primera sigue al mouse.
 //le paso el x del mouse y el Y del mouse: 
  
    
    for (int i=0 ; i<cant ; i++) {
      if (i==0) {
        m[i].seguir(mouseX , mouseY );
      }else{ 
      m[i].seguirMolecula ( m[i-1] );
    }
   } 
     for (int i=0 ; i<cant ; i++) {
      m[i].dibujar();
     }
}
             
class Molecula {
  
  //PROPIEDADES
  float x,y,tam;
  color relleno = color (random(255));
  //CONSTRUCTOR
  Molecula () {
     x = width/2;
     y = height/2;
     tam = 45;
         
  }
  
  //METODOS
  
  void dibujar () {
   //tam = map(mouseY,0,height,10,100);
      pushMatrix();
      noStroke();
      translate(x,y);
      fill(relleno,80);
      rectMode(CENTER);
      //rect(0,0,46,46);      
      ellipse(0,0,tam,tam);
      popMatrix();
    
  }
  
  void seguir ( float _x , float _y) {
   
      x = x + ( _x - x ) /2;
      y = y + ( _y - y ) /2;
    
  }
  
  void seguirMolecula ( Molecula _molecula ) {
   
    x = x + ( _molecula.x - x ) /2 ;
    y = y + ( _molecula.y - y ) /2 ;
    
  }
}   
