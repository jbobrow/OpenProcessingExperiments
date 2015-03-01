
void setup(){
  size(600, 600);
  
}

void draw(){
  //X=12*50 , Y=12*50 , 600x600
  //Color de fondo
  background(255);
  
  //Base de la cabeza
  //noStroke();
  fill(0, 255, 0);
  rect(50, 50, 500, 500);
  
  //ojos cabreados
  fill(0);
  
  //Ojo izquierdo
  rect(150, 200, 100, 50);
  triangle(150, 200, 150, 150, 250, 200);

  //Ojo derecho
  rect(350, 200, 100, 50);
  triangle(450, 150, 450, 200, 350, 200);
  
  //boca
  fill(0);
  rect(200, 300, 200, 100);
  rect(250, 250, 100, 50);
  rect(200, 400, 50, 50);
  rect(350, 400, 50, 50);
  
  //colores cabeza
  noStroke();
  fill(100,190,0);
  rect(50, 100, 50, 50);
  rect(250, 400, 50, 50);
  rect(50, 300, 50, 50);
  rect(500, 500, 50, 50);
  
 fill(0,200,100);
 rect(100, 500, 50, 50);
 rect(250, 50, 50, 50);
 rect(500, 100, 50, 50);
 
 fill(0,150,0);
 rect(450, 500, 50, 50);
 rect(350, 50, 50, 50);
 rect(500, 250, 50, 50);
  
 
}


