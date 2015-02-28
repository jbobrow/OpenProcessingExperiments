


void setup (){
background (255,80);
size (500,500);
stroke(#4A938C);
smooth ();
}

void draw (){
for(int i=0; i<500; i=i+20) { // determinación de valores que variarán para la creación de una grilla de puntos
  for(int j=0; j<500; j=j+20) {
    stroke (30,131,142);
    strokeWeight (3);
    point(i, j);
    
    
    
  beginShape(); 
    ellipse(random (500), random (500), random (100), random (100)); // se usa random para crear valores al azar que crean las elipses
   stroke (256,10);
    fill (255,random (200) );// se agrega transparencia al color inicial
    endShape(); 
} 
 

  }
}





