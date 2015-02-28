
// SPLINE CURVE genera curvas pequeñas

void setup() {
  size (800,800);
  background(255);
  smooth();
  
  
// Se debe especificar 4 factores
// Coordenadas de los puntos (1,2) y los puntos de control (1,2) para dar la curvatura

// curve( pcx1 , pcy1 , x1 , y1, x2 , y2 , pcx2, pcy2 );
// pc = punto de control "define la curvatura de cada punto"
// x,y = coordenadas de cada punto "inicio y fin de la curva" 
 
 strokeWeight(3);
 stroke(255,100,200);
 
  curve(600,700,200,600,500,200,700,500); //MORADO

//lineas guia
 strokeWeight(.5);
 stroke(0,0,255); 
  line(500,200,600,700);
  line(210,652,188,542);
  stroke(255,0,0);
  line(200,600,700,500);
  line(553,188,446,210);  

noStroke();

// X1,Y1 Punto AZUL  
  fill(0, 0,255);
  ellipse(200, 600, 15, 15);
// X2,Y2 Punto ROJO
  fill(255,0,0);
  ellipse(500,200,15,15);
// PCX1,PCY1 Punto AzulChico
  fill(0,0,255);
  ellipse (600,700,10,10);
// PCX2,PCY2 Punto RojoChico
  fill(255,0,0);
  ellipse (700,500,9,9);
}

//El primer punto de control (PCX1,PCY1) genera una línea respecto al segundo punto de la curva (X2,Y2).
//La paralela a esa línea determina la curvatura respecto al primer punto (X1,Y1) y todo esto visceversa.

