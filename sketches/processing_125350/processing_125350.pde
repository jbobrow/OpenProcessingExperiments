
//LLAMADA A LA CLASE
Bubbles[] step = new Bubbles[1000];
//VARIABLE QUE DEFINE EL NÚMERO DE BURBUJAS QUE SALEN EN CADA CLICK
int click = 0;

void setup(){
 size(500,500);
 frameRate(200);
 /*Aquí las variables que le pasa el consturtor son recogidas y se
 les asigna un valor RANDOM a cada una de ellas. Como estas variables
 pertenecen al las de la ellipse todas ellas saldrán con diferente 
 color opacidad y tamaño*/
   for(int i = 0; i < step.length; i++){
     /*Se introduce los valores del consturtor dentro de un array
     "step" y se la asigna un valor RANDOM a cada varlor que se 
     añade al array*/
     step[i] = new Bubbles(random(width), random(height), random(5,50), color(random(0,255),random(0,255),random(0,255),random(25,150)));
   }
 }

void draw(){
  background(255);
  for(int i = 0; i < step.length && i < click; i++){
    //LAMADA A LOS METODOS
    step[i].dibuixa();
    step[i].explosion();
  }
}
void mousePressed(){
  //CONTADOR QUE DETERMINARÁ CUANTAS BURBUJAS SALDRÁN EN CADA CLICK
  click = click + 30;
}
  


class Bubbles{
  float xran;
  float yran;
  float radio;
  float xPos;
  float yPos;
  color c;
   //CONSTRUCTOR QUE LE PASA LAS VARIABLES DE LA CLASE AL ALGORITMO 
   //PRINCIPAL
  Bubbles(float x, float y, float r, color col){
  xran = x;
  yran = y;
  radio = r;
  c = col;
  
  }
  //DIBUJO DE LA ELIPSE
  void dibuixa(){
  noStroke();
  fill(c);
  ellipse(xPos, yPos, radio, radio);
  }
  //EN EL PRIMER IF SE ENCUENTRA LA FUNCIÓN QUE HACE QUE LAS 
  //VALLAN HACIA DONDE ESTÁ EL RATÓN CUANDO ESTE NO ESTÁ PULSADO
  void explosion(){
  if(mousePressed == false){
    /*En cada iteración del DRAW las burbujas se acercan mas 
    al ratón. La orden es que xPos e yPos denven acercarse al 
    la actual posición del ratón de manera que su velocidad dependerá 
    a la hora de hacecarse al ratón dependerá del diametro del la 
    ellipse: menor diametro mayor velocidad y a la inversa con mayor diametro*/
    xPos = xPos + (mouseX - xPos)/radio;
    yPos = yPos + (mouseY - yPos)/radio;
  }
  if(mousePressed){
    /*En este IF en cambio lo que hacen es expandirse por todo 
    el area de dibujo cundo el ratón no está pulsado. Aquí le digo
    a procesin que asigne una posición al azar(RANDOM) a cada burbuja
    de manera que cuando el ratón no este pulsado la burbuja en vez de
    seguir al ratón deverá volver a la posición asignada al azar por 
    la función RANDOM creando así un efecto de explosión */
    xPos = xPos + (xran - xPos)/radio;
    yPos = yPos + (yran - yPos)/radio;
    
  }

  }


}







