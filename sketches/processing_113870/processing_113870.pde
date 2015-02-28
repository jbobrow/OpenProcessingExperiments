
void setup() {
  size(600, 600);
  background(0);
  smooth();
}


void draw() {
  //Muevo el eje de coordenadas temporalmente
  pushMatrix();
  translate(300, 300);
  fill(209, 130, 35);
  ellipse(0, 0, 300, 300);
  strokeWeight(3);
  
  //Rayos verticales centrales
  line(0, 150, 0, 250);
  line(0, -150, 0, -250);
  
  //Rayos horizontales centrales
  line(150, 0, 250, 0);
  line(-150, 0, -250, 0);
  fill(247,245,242);
  
  //Dibujo de la cara
  ellipse(-60,-40,20,20);
  ellipse(60,-40,20,2);
  line(-60,60,60,60);
  popMatrix();
  
  //Rayos oblicuos
  stroke(240,198,5);
  line(405,405,450,450);
  line(195,195,150 ,150);
  line(405,195,450,150);
  line(195,405,150,450);

}



