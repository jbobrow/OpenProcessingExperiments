
// "Neuronas".  Exploración del movimiento definido según el mouse. 
// Basado en  Ejemplo Processing (File > Examples > Topics > Motion > MovingOnCurves).


float beginX = 300;  // Initial x-coordinate
float beginY = 200;  // Initial y-coordinate
float finalX = 300;   // Final x-coordinate
float finalY = 200;   // Final y-coordinate
float distX;          // X-axis distance to move
float distY;          // Y-axis distance to move
float exponent = 4;   // Determines the curve
float x = 0.0;        // Current x-coordinate
float y = 0.0;        // Current y-coordinate
float step = 0.01;    // tamaño de cada punto avanzado en el plano.
float pct = 0.0;      // Percentage traveled (0.0 to 1.0)
// Variables de la neurona. 
float direccion; 
float velocidad; 
float dx,dy;  //desplazamiento en x e y deducido de la direcci�n y velocidad.
float vertice = 10;
float gr= random(0.1,4);  // grado de rotación; oscila entre -1 y 4. 
float r; // radio 

void setup() 
{
  size(600, 400);
  noStroke();
  smooth();
  background(#F1EEC9);
  distX = finalX - beginX;
  distY = finalY - beginY;
}



void draw() 
{
  fill(255, -4); // se pueden apreciar los fotogramas pasados.
  rect (0, 0, width, height);
  pct += step; 
  if (pct < 1.0) {
    x = beginX + (pct * distX);
    y = beginY + (pow(pct, exponent) * distY);
  }
  //Neurona
  fill(random(x),random(34),random(56,223), 54);
  pushMatrix();
    translate(x,y);
    rotate((gr*millis()/100)); 
      beginShape();
      curveVertex(10,random(50,280)); // random en ese punto, da irregularidad a la forma.
      curveVertex(r*r,random(80));
      curveVertex(2*r,-2*r*r);
      curveVertex(-r*vertice,80);
      endShape();
    popMatrix();
// Núcleo  neurona 
    fill(x/2,y,x, random (10,70));
    pushMatrix();
    translate (x,y);
    rotate ((gr*millis()/10000));
     ellipse (r,r,2,2);
     popMatrix();
}

void mousePressed() {
   filter (BLUR);
  pct = -0.9; //al poner la cifra en negativo, hace un recorrido de manera inversa.
  beginX = x;
  beginY = y;
  finalX = mouseX; 
  finalY = mouseY;
  distX = finalX - beginX;
  distY = finalY - beginY;
}

void keyPressed(){ 
  if (key=='b'||key=='B'){
    setup();}
  } 



