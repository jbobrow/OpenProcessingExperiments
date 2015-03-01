

void setup(){
  size (500,500);
  smooth();
}
 
 
void draw(){
  background(250, 230, mouseX-mouseY);//Cambios de amarillo dependiendo del mouse
   

  rectMode(CENTER);
   
  //cuerpo
  //el cuerpo crecerá ligeramente en la dirección del ratón
  stroke(0);
  fill(50);
  rect(mouseX, mouseY,10+(mouseX/10),20+(mouseY/10));
   
  //mancha en el cuerpo
  noStroke();
  fill(255,0,0);
  ellipse(mouseX, mouseY-5,4,4 );
  ellipse(mouseX, mouseY+1, 7, 7);
  ellipse(mouseX, mouseY+6, 10, 10);
   
  //pierna izquierda adelante
  stroke(0); 
  strokeWeight(2);
  line (mouseX-5-(mouseX/20), mouseY-10-(mouseY/20), mouseX-40, mouseY-45);//body segment
  stroke(0, 190);
  line (mouseX-40, mouseY-45, mouseX-20, mouseY-145);//medio
  strokeWeight(1);
  line (mouseX-20, mouseY-145, mouseX-10, mouseY-172);//termina
   
  //pierna derecha adelante
  stroke(0);
  strokeWeight(2);
  line (mouseX+5+(mouseX/20), mouseY-10-(mouseY/20), mouseX+40, mouseY-45);//cuerpo
  stroke(0, 190);
  line (mouseX+40, mouseY-45, mouseX+20, mouseY-145);//medio
  strokeWeight(1);
  line (mouseX+20, mouseY-145, mouseX+10, mouseY-172);//termina
   
  //pierna izquierda atras
  stroke(0);
  strokeWeight(3);
  line (mouseX-5-(mouseX/20), mouseY+10+(mouseY/20), mouseX-70, mouseY+65);//cuerpo
  strokeWeight(2);
  stroke(0, 190);
  line (mouseX-70, mouseY+65, mouseX-40, mouseY+145);//medio
  strokeWeight(1);
  line (mouseX-40, mouseY+145, mouseX-35, mouseY+175);//termina
   
  //pierna derecha atras
  stroke(0);
  strokeWeight(3);
  line (mouseX+5+(mouseX/20), mouseY+10+(mouseY/20), mouseX+70, mouseY+65);//cuerpo
  strokeWeight(2);
  stroke(0, 190);
  line (mouseX+70, mouseY+65, mouseX+40, mouseY+145);//medio
  strokeWeight(1);
  line (mouseX+40, mouseY+145, mouseX+35, mouseY+175);//termina
   
}
