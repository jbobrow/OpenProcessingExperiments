
// BézierCurve genera curvas como la herrapienta pluma de illustrator, más fácil de entender que la función curve

void setup() {
  size (800,800);
  background(255);
  smooth();
  
  
// Se debe especificar 4 factores
// Coordenadas de los puntos (1,2) y los puntos de control (1,2) para dar la curvatura

// bezier( x1 , y1 , pcx1 , pcy1 , pcx2, pcy2 , x2 , y2 );
// pc = punto de control "define la curvatura de cada punto"
// x,y = coordenadas de cada punto "inicio y fin de la curva" 
 
 strokeWeight(3);
 stroke(255,100,200);
 
  bezier(500,200,200,400,600,500,200,600); //MORADO

//lineas guia
 strokeWeight(.5);
 stroke(0,0,255); 
  line(500,200,200,400);
 stroke(255,0,0);
  line(200,600,600,500);
    

noStroke();

// X1,Y1 Punto AZUL  
  fill(0, 0,255);
  ellipse(500, 200, 15, 15);
// X2,Y2 Punto ROJO
  fill(255,0,0);
  ellipse(200,600,15,15);
// PCX1,PCY1 Punto AzulChico
  fill(0,0,255);
  ellipse (200,400,10,10);
// PCX2,PCY2 Punto RojoChico
  fill(255,0,0);
  ellipse (600,500,9,9);
}

// La mejor forma de entender este tipo de curva es usando un programa vectorial(illustrator) y jugar con las manijas de una curva

