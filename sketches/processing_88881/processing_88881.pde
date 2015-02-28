
/*
Trabajo hecho por Carlos Cevallos Manzano de "Centre d'Estudis Roca". El 
*/ 
int[] colores;


void setup() {
  size(192, 157); 
  background(0); 
  frameRate(25);
  noStroke();
  smooth();
  fill(255);
   
  colores = new color[50];
  for(int i = 0; i < colores.length; i++){
    colores[i] = color(random(255), random(255), random(255));
    
  }

}


void draw () {
 background(0);
  for(int i = 0; i < colores.length; i++){
    for(int j = 0; j < colores.length; j++) {
      fill(colores[(j+300/5)%colores.length]);
      rect(5 + j * 10, 5 + i * 5 * (noise((frameCount-j)*0.025)), 8, 15);
    }
  }
 
}



