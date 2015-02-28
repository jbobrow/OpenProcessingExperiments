

//parámetros del "lienzo".
void setup(){
  size(500,500);
  background(0);
  noFill();
 
}

void draw(){
background(0);
  for(int x=0;x<mouseX/75;x++){  //parametros de la variable x  al mover el mouse
  for(int y=0;y<mouseY/75;y++){ //parametros de la variable y al mover el mouse
    if (mousePressed)    { //al apretar el mouse...
  
  float tam = random(0, 100); 
      stroke(180, random(0, 24), random(0, 24)); 
    ellipse(x*100, y*100, tam, tam); //aparecen unas elipses de tamaño al azar de 0 a 100,de color en gama de purpuras ...se multiplican las x y las y por que ,recuerden que tienen valor 0 
} 
  else { //si no se aprieta...
    float tam = random(0, 100); 
    stroke(random(0, 114), 25, random(0,180)); 
    rect(x*100, y*100, tam, tam); //aparecen unos cuadrados de tamaño al azar de 0 a 100,de color en gama de purpuras
  } 
  } 
} 
 
 
 }

 void keyPressed(){  
  saveFrame("rectellipse_pulsatingwaves.jpg");  
  println("fotograma grabado");  
}  
 






