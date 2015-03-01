


import ddf.minim.*; //Importamos la librería que reproducirá el sonido.
AudioPlayer player; //Definimos el reproductor.
Minim minim; //Definimos el objeto minim.
geometria geo1; //Creamos el elemento que vamos a llamar.

void setup() {
  
  size(1200, 1100); //Indicamos el tamaño del lienzo.
  noFill(); //No quereomos que nada tenga relleno.
loadFont("TrajanPro3-Bold-48.vlw"); //Cargamos la fuente para el texto.
  minim=new Minim(this); //creamos el reproductor mediante el objeto minimç.
 player=minim.loadFile("insane_destiny2.wav"); //Cargamos el audio.
 player.play(); //Lo reproducimos.
 player.loop(); //Y lo ponemos en repetición constante.
 
 geo1= new geometria(width/2,height/2); //Llamamos a la geometría y la definimos.
}
 
void draw() {
  background(random(255),random(255),random(255));//Creamos un fondo con constante cambio aleatorio de color.
   textSize(200-(mouseX*0.13)); //Hacemos que el tamaño del texto depenga del mouseX.
   textAlign(CENTER); //Alineamos el texto centrado.
   text("Insane destiny",width/2,height/2); //Creamos el texto centrado en el lienzo.

geo1.volar();//Llamamos a la geometría para que actúe.

  }

class geometria{//Creamos la clase.
  float posX; //Creamos los valores que definirán nuestra clase.
  float posY;
  
 geometria(float posX, float posY){ //Creamos el objeto y su estructura.
   this.posX=posX; //Asignamos los valores temporales a los valores introducidos en la llamada.
   this.posY=posY;
 }
 void volar(){ //Creamos la acción volar.
    float maxX = (float)180/width*mouseX; //Asignamos que maxX dependa de la posición del mouseX.
  float maxY = (float)180/height*mouseX; //Asignamos que maxY dependa de la posición del mouseY
 if(mouseX<width/2){ //Si el ratón se encuentra en la parte izquierda del lienzo:
  translate(posX, posY); //Nos movemos a este punto.
  for (int i = 0; i < 360; i+=5) { //Creamos la repetición en bucle:
    float x = sin(radians(i)) * maxX; //Vamos cambiando la posición X con el contador i.
    float y = cos(radians(i)) * maxY;//Vamos cambiando la posición y con el contador i.
    pushMatrix();//Movemos el lienzo.
    translate(x, y); //A los puntos x, y.
    stroke(255); //Con línea blanca.
    rotate(radians(i+frameCount*10)); //Rotamos según pasan los frames.
    triangle(200, 0, 100, 100,0,0); //Este triángulo.
    popMatrix(); //Y volvemos al origen.
     
    pushMatrix(); //Nos movemos de nuevo.
    translate(-x, -y); //Al punto -x, -y.
    rotate(radians(i-frameCount*14)); //Rotamos según pasan los frames.
    rect(0, 0, 100, 100); //Este cuadrado.
    popMatrix(); //Y volvemos al origen.
  }
}else  if(mouseX>width/2){ //Si el ratón se encuentra en la parte derecha del lienzo:
  translate(posX, posY); //Nos movemos a este punto.
  for (int i = 0; i < 360; i+=5) { //Creamos la repetición en bucle:
    float x = sin(radians(i)) * maxX; //Vamos cambiando la posición X con el contador i.
    float y = cos(radians(i)) * maxY; //Vamos cambiando la posición Y con el contador i.
    pushMatrix(); //Movemos el lienzo.
    translate(x, y); //Al punto x, y.
    stroke(255); //Con línea blanca.
    rotate(radians(i-frameCount*10)); //Rotamos según pasan los frames.
    triangle(200, 0, 100, 100,0,0); //Este triángulo.
    popMatrix(); //Y volvemos al origen.
     
    pushMatrix(); //Nos movemos de nuevo.
    translate(-x, -y); //Al punto -x, -y.
    rotate(radians(i+frameCount*14)); //Rotamos según pasan los frames.
    rect(0, 0, 100, 100); //Este cuadrado.
    popMatrix(); //Y volvemos al origen.
    

 } 
 }
}
}
