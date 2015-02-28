
int relleno = 0;
void setup (){
  background (relleno);
  size (220,220);
  smooth ();
//cabeza
  fill (252,179,133);
  ellipse (40,140,170,150);
  noStroke();
  ellipse (30,65,100,80);
//pelo
  fill (188,97,11);
  ellipse (20,30,95,30);
//fondo ojos
  fill (0);
  ellipse (61,65,38,38);
  ellipse (16,65,38,38);
//ojos
  fill (255);
  ellipse (61,65,35,33);
  ellipse (16,65,35,33);
//lagrimal
  fill (0);
  ellipse (61,65,5,5);
  ellipse (16,65,5,5);
//gafas
  fill (0);
  rect (33,55,10,10);
//boca
  stroke(0);
  fill(0);
  ellipse (40,130,68,28);
  fill (255);
  ellipse (40,130,73,33);
//barbilla
  fill (255);
  stroke(0);
  noFill();
  arc (30,175,25,40,radians(0),radians(180));
  arc (55,175,25,40,radians(0),radians(180));
}
//Interactuar con el mouse
void draw (){
  fill(relleno);
  print(mouseX);
  print(",");
  println(mouseY);
  smooth();
}
//PULSAR
void mousePressed(){
//cabeza
  fill (252,179,133);
  ellipse (40,140,170,150);
  noStroke();
  ellipse (30,65,100,80);
//pelo
  fill (188,97,11);
  ellipse (20,30,95,30);
//fondo ojos
  fill (0);
  ellipse (61,65,38,38);
  ellipse (16,65,38,38);
//ojos
  fill (255);
  ellipse (61,65,35,33);
  ellipse (16,65,35,33);
//lagrimal
  fill (0);
  ellipse (61,55,5,5);
  ellipse (16,55,5,5);
//gafas
  fill (0);
  rect (33,55,10,10);
//boca
  stroke(0);
  fill(0);
  ellipse (40,130,100,60);
  fill (255);
  ellipse (40,130,97,57);
//barbilla
  fill (252,179,133);
  stroke(0);
  arc (30,158,25,40,radians(0),radians(180));
  arc (55,158,25,40,radians(0),radians(180));
//bocadillo
  fill (255);
  ellipse (100,70,10,10);
  ellipse (113,65,15,15);
  ellipse (162,40,90,90);
//hamburguesa
  fill (211,130,6);
  ellipse (162,56,60,40);
  fill (90,52,1);
  ellipse (162,54,50,35);
  fill (6,196,7);
  ellipse (162,52,48,28);
  fill (216,250,3);
  ellipse (162,50,46,26);
  fill (90,52,1);
  ellipse (162,48,44,24);
  fill (90,52,1);
  ellipse (162,46,42,22);
  fill (211,130,6);
  ellipse (162,40,60,40);
  point (146,31);
  point (176,32);
  point (152,45);
  point (165,46);
  point (179,42);
  point (161,30);
//babas
  fill (131,246,255);
  arc (85,153,10,20,radians(0),radians(360));
  arc (97,185,10,20,radians(0),radians(360));
  ellipse (131,208,80,20);
}
//SOLTAR
  void mouseReleased(){
  fill(relleno);
  fill (252,179,133);
  ellipse (40,140,170,150);
  noStroke();
  ellipse (30,65,100,80);
//pelo
  fill (188,97,11);
  ellipse (20,30,95,30);
//fondo ojos
  fill (0);
  ellipse (61,65,38,38);
  ellipse (16,65,38,38);
//ojos
  fill (255);
  ellipse (61,65,35,33);
  ellipse (16,65,35,33);
//lagrimal
  fill (0);
  ellipse (61,65,5,5);
  ellipse (16,65,5,5);
//gafas
  fill (0);
  rect (33,55,10,10);
//boca
  stroke(0);
  fill(0);
  ellipse (40,130,68,28);
  fill (255);
  ellipse (40,130,73,33);
//barbilla
  fill (252,179,133);
  stroke(0);
  arc (30,175,25,40,radians(0),radians(180));
  arc (55,175,25,40,radians(0),radians(180));
  fill(relleno);
  ellipse (131,208,85,25);
  ellipse (100,70,12,12);
  ellipse (113,65,17,17);
  ellipse (162,40,92,92);
}


