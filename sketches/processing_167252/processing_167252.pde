

void setup(){
 size (255,255);

}

void draw (){
 background (0); //fondo de pantalla
 strokeWeight(4); //ancho de línea
  stroke(255,255,255); //color de línea
  fill(mouseX,0,0); //relleno del dibujo

  line(mouseX-40,mouseY-40,mouseX+40,mouseY+40);
  line(mouseX+40,mouseY-40,mouseX-40,mouseY+40);
  ellipse(mouseX,mouseY,mouseY/2,mouseY/2);
  ellipse(mouseX-40,mouseY-40,mouseY/4,mouseY/4);
  ellipse(mouseX+40,mouseY-40,mouseY/4,mouseY/4);
}


