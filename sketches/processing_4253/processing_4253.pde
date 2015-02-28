

  //Basado en un sketch propio(ataque palillstico).
  //Proyecto interactivo que simula el desenfrenado crecimiento de palillos de pasto.Al mover el mouse  
  //aparecen circulos que intentan borrar el crecimiento y regresar el fondo negro.A medida que se acerca  
  //el mouse a la esquina superior izquierda,los  circulos se hacen mas pequeños y si se alejan de este, 
  //se agrandan.Ademas al presionar el mouse aparece un flash que vuelve el fondo negro a blanco 
  //evidenciando por donde crece cada palillo y borrando parte del crecimiento.
  
  
void setup() { 
  size(950, 250); //tamaño de la tela
  smooth(); //suaviza las lineas
  background(0); //color de fondo

  noStroke();//sin lineas de contorno
}

void draw() { //funcion para dibujar el pasto
 
  for(int i=0; i<200; i=i+1){ 
  palillos(); } 
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);//declara la funcion para hacer aparecer los circulos
}  

void palillos() { //funcion para el como dibujar los palillos
  
  strokeWeight(random(5)); 
  float d1 = random(50); 
  if(d1 < 12) {  //palillos verde oscuro
    stroke(63,118,26); 
    rotate(5);
  } 
  if(d1 < 6) {  //palillos verde claro 
    stroke(128,196,3); 
    rotate(5);
  } 
  if(d1 < 2) {  // palillos negros 
    stroke(0); 
    rotate(5);
  } 
  float x1 = random(width); 
  float x2 = random(height+5); 
 float y1 = random(width+5);
 float y2 = random(height);
  //aqui se determina como se moveran y creceran las lineas
  line(x2,x1,second()/10,millis()/10); 
  line(x1,x2,second()/10,millis()/10);
  line(y1,y2,millis(),200);
  stroke(450,150); 
}
void variableEllipse(int x, int y, int px, int py) //aparecen las ellipses pretenden bloquear a los palillos
{
  float speed = abs(x-px-y/2) + abs(y-py-x/2);//abs calcula el valor absoluto de un numero.El valor absoluto sera siempre positivo.
  
  fill(0);
  translate(random(2),speed);
  ellipse(x, y, speed, speed);
  ellipse(x*2,y*2,speed,speed);
  ellipse(x/2,y/2,speed,speed);
}
 

void mousePressed() { 
  background(255); 

} 


