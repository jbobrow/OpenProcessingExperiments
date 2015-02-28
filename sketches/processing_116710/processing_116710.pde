
void setup(){
  size(500,500); //la mida del recuadre.
  background(#FFC95C); //El color de fons.
 }

void draw(){
  
  println(mouseX+","+mouseY); //Per a veure la posició del mouse en pantalla.
  
  //cara
  line(250,450, 350,400);
  line(250,450, 150,400);
  line(150,400, 130,300);
  line(350,400, 370,300);
  line(370,300, 350,200);
  line(130,300, 150,200);
  line(350,200, 250,210);
  line(150,200, 250,210);
  
  //ulls
  fill(#FFFFFF);
  ellipse(200,265, 60,30);
  
  fill(#574115);
  ellipse(200,265, 20,20);
  
  fill(#FFFFFF);
  ellipse(300,265, 60,30);
  
  fill(#574115);
  ellipse(300,265, 20,20);
  
  //nas
  line(250,265, 240,325);
  line(240,325, 255,320);
  
  //boca
  line(230,375, 295,345);
  
  //celles
  triangle(170,240, 235,240, 230,250);
  triangle(270,250, 265,240, 330,240);
 }


