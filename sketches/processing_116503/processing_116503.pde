
void setup(){
  size(400,400);
  background(#3C8FA0);
}

void draw(){
  //Color cara
  fill(#FECBA4);
  //Cara
  ellipse(200,200, 280,380);
  
  //Gafas
  noFill();
  
  //Lente izquierda
  rect(115, 115, 70, 45, 7);
  
  //Lente derecha
  rect(215, 115, 70, 45, 7);
  
  point(186, 136);
  point(215,136);
  line(186,136, 215,136);
  
  //Patilla gafas izquierda
  point(115,137);
  point(67,136);
  line(115,137, 67,137);
  
  //Patilla gafas derecha
  point(285,137);
  point(331,137);
  line(285,137, 331,137);
  
  //Ceja izquierda
  fill(#000000);
  arc(147, 110, 80, 20, PI, TWO_PI);
  
  //Ceja derecha
  fill(#000000);
  arc(253, 110, 80, 20, PI, TWO_PI);
  
  //Ojo izquierdo
  fill(#FFFFFF);
  ellipse(150,140,50,25);
  
  fill(#000000);
  ellipse(150,140, 25,25);
  
  //Ojo derecho 
  fill(#FFFFFF);
  ellipse(250,140,50,25);
  
  fill(#000000);
  ellipse(250,140,25,25);
  
  //Oreja izquierda
  noStroke();
  fill(#FECBA4);
  ellipse(55, 180, 50, 100);
  
  //Oreja derecha
  noStroke();
  fill(#FECBA4);
  ellipse(345, 180, 50, 100);
  
  //Boca
  stroke(0);
  fill(#E67070);
  arc(200,280, 138,125, 0, PI, CLOSE);
  
  //Nariz
  stroke(0);
  noFill();
  arc(195,230,70,50, 0, PI, OPEN);
  
  point(160,230);
  point(180,169);
  
  line(160,230, 180,169);
  
  point(230,229);
  point(216,169);
  
  line(230,229, 216,169);
  
  //Indicar posición con el cursor
  println(mouseX+","+mouseY);
}


