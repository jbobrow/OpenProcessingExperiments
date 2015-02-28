
/**
 * 
 * <strong>Flor Colibrí</strong><br />
 * por Carla Renault Z., Agosto 2009<br />
 * Proyecto final LC0 <br /> 
 * Diseño. e[ad]. PUCV <br /> 
 * <br />
 * <pre>
 * Mouse click : movimiento.
 * '0': reinicia (apretar una vez)
 * '0' : muestra la estructura (presionado).
 * </pre>
 *      <br /> 
 *  Proyecto interactivo que muestra un personaje planta-animal, 
 * Floribrí, que vuela y a través de su estela genera su propio tallo. 
 *  Quien vea este sketch, puede  jugar con Floribrí mediante las siguientes señas:
 *  Click en cualquier punto de la pantalla para generar un nuevo movimiento.
 *  nuevo movimiento (único), y apretar 0 una vez para volver a empezar.
 *  Para  ver el esqueleto de Floribrí, mantega presionado el 0.
 *   El color es variado, y dependiendente de la posición de nuestro personaje.
 * // Basado en  Ejemplo Processing (File > Examples > Topics > Motion > MovingOnCurves).
 */ 



float x,y;
float inicioX = 180;  // Inicie en el punto 370 del eje X.
float inicioY = 700;  // Initial y-coordinate
float finalX = 180;   // coordenada final de x
float finalY = 100;   // Final y-coordinate
float distX;          // distancia de X para moverse, calculada en setup (ver abajo).
float distY;          // distancia de y.
float exponente = 2.5;  // el exponente influye en la curvatura del movimiento.

float avance = 0.01;    // tamaño de cada punto avanzado en el plano.
float  recorrido = 0.2;  
  
// Variables de volador
float direccion; 
float velocidad; 
float dx,dy;  //desplazamiento en x e y deducido de la direcci�n y velocidad.
float vertice = random(1,4);
float gr= 2.6;  // grado de rotación; oscila entre -1 y 4. 
float r; // radio 

void setup() 
{ 
  size(390, 700);
  noStroke();
  smooth();
  background(0);
  distX =  finalX - inicioX; // calcule la posición inicial.
  distY = finalY - inicioY;
 }



void draw() 
{
 manto();
  recorrido += avance; 
  if (recorrido < 0.95) { //0.8 flor pequeña, 0.9 mediana, 1 grande.
    x = inicioX + (recorrido * distX);
    y = inicioY + (pow(recorrido, exponente) * distY); //pow=exponentee
  } 
  floribri(); //inicie el personaje
 }
 
 
 
  void floribri(){
  fill(random(y),random(x),random(56,223), 54);
  pushMatrix();
    translate(x,y);
    rotate((gr*millis()/300)); 
      bezier(40,90,1,2*r,-2*r,r,2*r,40);
      bezier(34,90,1,2*r,-2*r,r,2*r,2);
    popMatrix();
   
   pushMatrix();
    translate(x,y);
     rotate((gr*millis()/-300)); 
       bezier(40,90,1,2*r,-2*r,r,2*r,40);
      bezier(34,90,1,2*r,-2*r,r,2*r,2);
    popMatrix();
  
polen ();}

      void polen (){
     fill(#F9FF67,random (50,200));
    pushMatrix();
    translate (x,y);
    rotate ((gr*millis()/(PI*50)));
     ellipse (r+4,r,3,3);
     ellipse (r-2,r,2,2);
     ellipse (r,10,1,1);
     popMatrix(); 
}

//Manto: cubre los fotogramas, y dependiendo de su transparencia (canal alpha) se hacen visibles las huellas que deja el fotograma pasado.
 void manto (){
   fill (0,-4);
   rect (0,0,width,height); 
 }

