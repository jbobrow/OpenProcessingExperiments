

int num = 0; 
int barray = 30;
int numb = 0;
int t = 0;
int bichoy = height;
int puntos = 0; 
int mil = 2000;
int nivel = 1;
int velocidad = 2;
PImage ufo, fondo, bicho;




Bala [] balas = new Bala [10000];
Bicho [] bichos = new Bicho [10000];

void setup() {
  size (700,500);
  
//imagenes
  ufo = loadImage ("ufo.png");
  fondo = loadImage ("fondo.jpg");
 // bicho = loadImage ("bicho.png");

}

void draw() {
   //imagen fondo   
    image (fondo,0,0);
    
  //Final win
  if (nivel == 6) {
    background (0);
    text ("You win!",width/2,height/2);
  }
  //fuente letras
    PFont tipo = loadFont("Bauhaus93-30.vlw");
    textFont (tipo);
    
    //creació ufo
    image (ufo,(mouseX-40),height-100);
    
    //requadre de dalt
    fill (255);
    stroke (255);
    rect (0,0,width,50);
    
    //creación de classe balas
    for (int i=0; i< num; i++) {
      balas [i].dispara ();
    }
    
    //creacio de classe bicho
    for (int i=0; i< numb; i++) {
      if (bichos [i].vivo) bichos [i].ataca ();
    }

    
    //definir temps bichos
    float m = millis ();
    if (m - t > (mil)) {  
      bichos [numb] = new Bicho ();
      numb++;
      t = millis();
    }
    
        
//definició del xoc
//// definicio de bala i bicho com a unitat
    for (int i=0; i< num; i++) {
      Bala b = balas[i];
      for (int j=0; j< numb; j++) {
        Bicho bi = bichos[j];
        
////moment del xoc
        if (bi.vivo) {
          if (b.x >= (bi.bichox-10) && b.x <= (bi.bichox+10) && b.y >= (bi.bichoy-10) && b.y<= (bi.bichoy + 10)) {
            println ("muerto");
            bi.vivo = false;
            puntos++;
            
          }
        }
      }
    }
    
    //dibuixar nombre de punts
   text ("Puntos: "+puntos,200,30);
   text ("Nivel: "+nivel,10,30);

  //niveles
   if (puntos == 0) {
     mil = 2000;
     nivel = 1;
   }
   if (puntos == 2) {
     mil = 1750;
     nivel = 2;
     velocidad = 3; 
  
   }
   if (puntos == 4) {
     mil = 1500;
     nivel = 3;
     velocidad = 3; 
   }
   if (puntos == 6) {
     mil = 1000;
     nivel = 4;
     velocidad = 4; 
   }
    if (puntos == 8) {
     mil = 750;
     nivel = 5;
     velocidad = 4;
   }
   
   if (puntos == 10){
     nivel = 6;
     background (225);
     text ("YOU WIN!",width/2,height/2);
     noLoop();
  
  }
  }
  //cada click +1 bala
  void mousePressed () {
    balas [num] = new Bala (mouseX);
    num++;
  }
  
  
  class Bala {
  //propiedades 
  int x; 
  int y = height-100;
  int barray;


  //constructor 

  Bala (int _x) {
    x = _x;
  }

  //metodos 
  void dispara () {
    ellipse (x,y,5,5);
    fill (255,0,0);
    noStroke();
    y = y - 3;
  }
}
class Bicho {
  //peopiedades 
  int bichox;
  int bichoy;
  int y; 
  int x; 
  int col;
  boolean vivo = true; 


  //constructor 

  Bicho () {
    bichox = (int) random (60,height);
    bichoy = 0;
    int r = (int)random (0,255);
    int g = (int)random (0,255);
    int b = (int)random (0,255);
    col = color (r,g,b);
  }

  //metodos 
  void ataca () {
   // image (bicho,bichox,bichoy,20,20);
    ellipse (bichox, bichoy,20,20);
    bichoy = bichoy + velocidad;
    fill (col);
    noStroke();
    
    

// quan perd

    //muerto
    if (bichoy > height){
    background (255);
    text ("Game Over",200,width/2);
    text ("Noemí Silvestre", height-50,width/2);
    noLoop();
    }
  }
}




