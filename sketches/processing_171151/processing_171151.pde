
void setup(){
  size        (500,500);
  background  (255,255,255);
}


void draw(){  
    //VARIABLES
  float valor1 = random(0,255);
  float valor2 = random(0,255);
  float valor3 = random(0,255);
  if (mousePressed){
  //stroke (valor,valor,valor); - COLOR LINEA
  //strokeWeight(X); - TAMAÑO LINEA 
  stroke (valor1,valor2,valor3);
  strokeWeight(8);
  line   (mouseX,mouseY,mouseY,mouseX);
  stroke (valor2,valor3,valor1);
  strokeWeight(6);
  line   (mouseX,mouseY,mouseY,mouseX);
  stroke (valor3,valor1,valor2);
  strokeWeight(2);
  line   (mouseX,mouseY,mouseY,mouseX);
  }
} 


void keyPressed(){
  if (key == '1'){
    //LIMPIAR ZONA DE DIBUJO
    fill  (255,255,255);
    rect  (0,0,600,600);
  }
}


