
void setup(){
  size (400,400);
  background(#264299);
}

void draw(){
  println(mouseX+","+mouseY);
  //sombrero
  fill (#991321);
  triangle (118,112,196,63,260,112);
  //cara
  fill (#CC9966);
  ellipse(184,154,110,90);
  //Ojo izquierdo
  fill(#FFFFFF);
  ellipse(160,142,20,10);
  fill(#000000);
  ellipse(160,142,7,5);
  
  //Ojo derecho
  fill(#FFFFFF);
  ellipse(200,142,20,10);
  fill(#000000);
  ellipse(200,142,7,5);
 
  //Oreja izquierda
  noStroke();
  fill(#CC9966);
  ellipse(122,150,25,40);
  //Oreja derecha
  noStroke();
  fill(#CC9966);
  ellipse(245,150,25,40);
  //Boca
  stroke(0);
  fill(#E65665);
  arc(182,165,50,50,0, PI, CLOSE);
  
  //nariz
  stroke (#000000);
  line(178,146,172,150);
  line(172,150,176,157);
 
}


