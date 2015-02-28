
/* 

la idea principal es tomar de los tutoriales todo lo que se pueda:
ver http://processing.org/tutorials/
http://vimeo.com/22992956

1 - usar campos de vectores, particulas con distinto peso (y antiparticulas)
cada particula al moverse cambia el timbre de un ton en un loop)

2 - formar el campo vectorial analizando alguna pista de audio o samples

3 - tomar algo de interactividad con el mouse, para modificar el campo de vectores, spawn de nuevas particulas, orientación velocidad de las particulas

4 - logear algunos parametros para hacer gráficos tiempo/posicion o algo asi en los márgenes

5 - si hay colisiones de las particulas, producir cambios en el campo vectorial.

6 - agregar video de fondo ???

*/




int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
