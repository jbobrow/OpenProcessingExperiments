
void setup (){
//tamaño de fondo 
  size (300, 400);
}
void draw (){
  println(mouseX+ "," +mouseY);
  stroke(1,1,1);
// cabeza rodones (x, y, width, hight)
  background(255,255,255);
  fill(255,204,153);
  ellipse(150, 200, 100, 130);
//cuello
  line(125, 255, 125, 290);
  line(175, 255, 175, 290);
//pelo
  //lado izquiero
  fill(1, 1, 1);
  triangle(90, 260, 70, 290, 80, 185);
  triangle(90, 260, 100, 210, 80, 185);
  triangle(100, 185, 100, 210, 80, 185);
  triangle(100, 185, 85, 135, 80, 185);
  triangle(100, 185, 85, 135, 115, 135);
  triangle(130, 135, 107, 165, 115, 135);
  triangle(123, 144, 130, 140, 125, 140);
  //lado derecho
  triangle(210, 260, 230, 290, 220, 185);
  triangle(210, 260, 200, 210, 220, 185);
  triangle(200, 187, 200, 210, 220, 185);
  triangle(200, 187, 215, 135, 220, 185);
  triangle(200, 187, 215, 135, 185, 135);
  triangle(193, 163, 170, 135, 185, 135);
  triangle(175, 140, 170, 140, 178, 145);
  //parte superior
  arc(150, 140, 130, 120, PI, TWO_PI);
//ojo derecho
  fill(255, 255, 255);
  ellipse(175, 180, 15, 25);
  ellipse(175, 185, 15, 15);
  ellipse(175, 180, 15, 10);
  fill(0,0,255);
  ellipse(175, 180, 7, 10);
  fill(1,1,1);
  ellipse(175, 180, 3, 3);
  //ojo izquierdo
  fill(255,255,255);
  ellipse(125, 180, 15, 25);
  ellipse(125, 185, 15, 15);
  ellipse(125, 180, 15, 10);
  fill(0,0,255);
  ellipse(125, 180, 7, 10);
  fill(1,1,1);
  ellipse(125, 180, 3, 3);
//pestañas derecha
  line(170, 168, 169, 160);
  line(175, 165, 175, 160);
  line(180, 168, 181, 160);
  //pestañas inzquierda
  line(120, 168, 119, 160);
  line(125, 165, 125, 160);
  line(130, 168, 131, 160);
//cejas
  noFill();
  arc(175, 160, 20, 15, PI, TWO_PI);
  arc(125, 160, 20, 15, PI, TWO_PI);
// nariz
  arc(150, 200, 15, 10, 0, PI, OPEN);
// boca
  fill(255,0,0);
  arc(150, 225, 16, 35, 0, PI, OPEN);
  fill(255, 255, 255);
  rect(142, 219, 16, 5);
//mejilla derecha
  noStroke();
  fill(255,193,153);
  ellipse(175, 210, 20, 20);
  fill(255,173,153);
  ellipse(175, 210, 15, 15);
  fill(255,153,153);
  ellipse(175, 210, 10, 10);
  fill(255,143,153);
  ellipse(175, 210, 5, 5);
  //mejilla izquierda
  fill(255,193,153);
   ellipse(125, 210, 20, 20);
   fill(255,173,153);
   ellipse(125, 210, 15, 15);
   fill(255,153,153);
   ellipse(125, 210, 10, 10);
    fill(255,143,153);
   ellipse(125, 210, 5, 5);

}

