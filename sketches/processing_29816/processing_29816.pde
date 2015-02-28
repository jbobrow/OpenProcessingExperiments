
// ...:::VARIABLES:::...
float ruido= 0.008;
float tamano,variacion;
// ...:::SETUP:::...
void setup() {
  size(500,500);
  noStroke();
  smooth();
}

// ...:::DRAW:::...

void draw() {
  background(85);
  // establecer tamaño
  variacion = variacion+ruido;
  tamano = noise(variacion)*width;
  
  //rectángulos
  translate(width/2, height/2);
  rectMode(CENTER);
  fill(247,158,65,80);
  rect(0,0,tamano,450);
  fill(163,55,180,80);
  rect(0,0,350,tamano);
  fill(21,234,183,80);
  rect(0,0,tamano,200);
  fill(247,158,65,80);
  rect(0,0,150,tamano);
  fill(156,96,222,80);
  rect(150,150,tamano,tamano);
  fill(96,208,222,80);
  rect(-150,-150,tamano,tamano);
  fill(250,95,23,80);
rect(-150,150,tamano,tamano);
fill(23,35,250,80);
rect(150,-150,tamano,tamano);
}

//

                
                                
