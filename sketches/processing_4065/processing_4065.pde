
/** ALISON SARAVIA_PROYECTO_LC0 <br /> 
 * Proyecto final Lenguaje Computacional Cero <br /> 
 * Martes 25 de Agosto 2009 <br /> 
 * SOL EN LA OSCURIDAD - Sketch Basado en "Caracol" por natalia <br />  
 * (http://www.openprocessing.org/visuals/?visualID=689) <br /> 
 
 * Aquellos "tentáculos" de color amarillo transparente,
 * simulan los rayos de un sol que ilumina el fondo negro
 * en el que se encuentran.
 * Girando a su alrededor hay una colección de círculos (elipses)
 * y cuadrados de distintos colores,los que le dan una
 * apariencia más alegre y psicodélica.
 * La función "rotate" y "translate" permite que los rayos
 * se contraigan y luego vuelvan a su forma inicial */ 


float inc = 0.0;//incremento de angulo 
float dim = 50; 
void setup() { 
  size(450, 450); 
  background(0); 
  smooth(); 

} 
void draw() { 
  background(0); 
  inc += 0.01; 
  float angle = sin(inc) /1.0 ; 
  translate(200,200); 
  for (int i = 0; i < 8; i++) { 
    rayos(0,-dim/2, 80, angle); 
    rotate(PI/4); 
  } 
  ellipse(0,0,dim,dim); 
} 
void rayos(float x,float y, int units, float angle) { 
  pushMatrix(); 
  translate(x, y); 
 for (int i = units; i > 0; i--) { 
    strokeWeight(i/2); 
    stroke(255,192,15,25);//color de los rayos de sol 
    line(0, 0, 0, 4); 
    strokeWeight(i/2); 
    line(0,0,4,0); 
    translate(0, -4); 
    rotate(angle); 
  } 
   
 //elementos que giran en torno a los rayos del sol 
    fill(242,235,20);
  ellipse(70,70,10,10);
   fill(227,7,22,300);
  ellipse(30,30,10,10);
  fill(53,227,7);
  ellipse(0,0,10,10);
  fill(227,7,22);
  rect(100,100,10,10);
  popMatrix(); 
} 








