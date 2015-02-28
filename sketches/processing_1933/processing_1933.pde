
float huePrincipal = random(245);
int contador = 0;

void setup (){
  size (800,800);
  colorMode (HSB, 255);
  smooth ();
  noFill();
  background (40);
  
}

void draw () {
 
  contador ++;
  float centroX = random (-100,100);
  float centroY = random (-100,100);
 translate (width/2, height/2); 
 stroke (random (40), 99,99, 80);
 
 float diametro = random (100,600);
 
 ellipse (centroX, centroY, diametro, diametro);
  
  if (contador == 500) {
    
     fill (255, 10);
  }
  
  if (contador == 1000) {
    
    noFill ();
    contador = 0;
  }
  
}

