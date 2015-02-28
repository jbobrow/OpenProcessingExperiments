

void setup (){
  
  size (600,600);
  background (0);
  smooth (); 
}
  
void draw (){
  
  stroke (234, 50, 121, 100); 
  noFill (); 
  //según aumenta la velocidad del ratón aumenta el grosor (abosulte value)
  strokeWeight (abs (pmouseX-mouseX));
  
  //se mueve junto al puntero.mouse
  ellipse(pmouseX, pmouseY, mouseX, mouseY); 
 
}

//cada vez que haga click con el ratón cambiará el color del fondo
void mousePressed (){
background (255);
}


