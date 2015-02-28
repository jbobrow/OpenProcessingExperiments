
void setup()
{
  size(500, 500);
  background(255);
  smooth();
}

void draw()
{
  //couleur
  int rouge;
  rouge=32;
  int vert;
  vert=124;
  int bleu;
  bleu=28;

  fill(rouge, vert, bleu);

  /*
modèle de base
   //polygone à 6 côtés
   beginShape();
   //point dans le sens horaire en partant de celui le plus haut
   vertex(50, 10);
   vertex(85, 30);
   vertex(85, 70);
   vertex(50, 90);
   vertex(15, 70);
   vertex(15, 30);
   endShape(CLOSE);
   
   //centre du polygone
   point(50,50);
   */

  //points dans le sene horaire en partant de celui le plus haut
  //point1
  int a1;
  a1=50;
  int b1;
  b1=10;

  //point2
  int a2;
  a2=85;
  int b2;
  b2=30;

  //point3
  int a3;
  a3=85;
  int b3;
  b3=70;

  //point4
  int a4;
  a4=50;
  int b4;
  b4=90;

  //point5
  int a5;
  a5=15;
  int b5;
  b5=70;

  //point6
  int a6;
  a6=15;
  int b6;
  b6=30;

  //centre
  int ac;
  ac=50;
  int bc;
  bc=50;

  //contour de base
  int C;
  C=1;
  
  //grosseur des point
  int pt;
  pt=6;
  
  //ellipse centre1 (pleine)
  int l1;
  l1=30;
  int h1;
  h1=30;
  
  //petit ellipse (pleine)
  int l2;
  l2=l1/2;
  int h2;
  h2=h1/2;  
  
  //crecle circonscrit
  int l3;
  l3=80;
  int h3;
  h3=80;
  
  //cercle circonscrit petit
  int l4;
  l4=l3/2;
  int h4;
  h4=h3/2;
  
  
  //1
  beginShape();
  //point dans le sens horaire en patant de celui le plus haut
  vertex(a1, b1);
  vertex(a2, b2);
  vertex(a3, b3);
  vertex(a4, b4);
  vertex(a5, b5);
  vertex(a6, b6);
  endShape(CLOSE);

  //centre du polygone
  point(ac, bc);

  //2
  translate(80, 0);

  strokeWeight(pt);

  point(a1, b1);
  point(a2, b2);
  point(a3, b3);
  point(a4, b4);
  point(a5, b5);
  point(a6, b6);

  point(ac, bc);

  //3
  translate(80, 0);

  strokeWeight(C);

  beginShape();
  vertex(a2, b2);
  vertex(a1, b1);

  strokeWeight(pt);
  point(a3, b3);
  strokeWeight(C);

  vertex(a4, b4);
  vertex(a5, b5);
  vertex(a6, b6);
  endShape(CLOSE);

  point(ac, bc);

  //4
  translate(80, 0);

  beginShape();
  vertex(a1, b1);
  vertex(a5, b5);
  vertex(a3, b3);
  vertex(a2, b2);
  vertex(a4, b4);
  vertex(ac, bc);
  vertex(a6, b6);
  endShape(CLOSE);

  fill(0);
  ellipse(ac, bc, l1, h1);
  fill(rouge, vert, bleu);

  //5
  translate(80, 0);

  beginShape();
  vertex(a1, b1);
  vertex(ac, bc);
  vertex(a5, b5);
  vertex(a3, b3);
  vertex(a4, b4);
  vertex(a2, b2);
  vertex(a6, b6);
  endShape(CLOSE);

 fill(0);
  ellipse(ac, bc, l1, h1);
  fill(rouge, vert, bleu);

  //6
  translate(80, 0);

  beginShape();
  vertex(a5, b5);
  vertex(a1, b1);
  vertex(a2, b2);
  vertex(ac, bc);
  vertex(a4, b4);
  vertex(a3, b3);
  vertex(a6, b6);
  endShape(CLOSE);

  fill(0);
 ellipse(ac, bc, l1, h1);
  fill(rouge, vert, bleu);

  //7
  translate(-400, 100);

 fill(0);
 ellipse(ac, bc, l1, h1);
  fill(rouge, vert, bleu);

  beginShape();
  vertex(a5, b5);
  vertex(a1, b1);
  vertex(a2, b2);
  vertex(ac, bc);
  vertex(a4, b4);
  vertex(a3, b3);
  vertex(a6, b6);
  endShape(CLOSE);

  //8
  translate(80, 0);

 fill(0);
  ellipse(ac, bc, l1, h1);
  fill(rouge, vert, bleu);

  beginShape();
  vertex(a1, b1);
  vertex(ac, bc);
  vertex(a5, b5);
  vertex(a3, b3);
  vertex(a4, b4);
  vertex(a2, b2);
  vertex(a6, b6);
  endShape(CLOSE);

  //9
  translate(80, 0);

  fill(0);
  ellipse(ac, bc, l1, h1);
  fill(rouge, vert, bleu);

  beginShape();
  vertex(a1, b1);
  vertex(a5, b5);
  vertex(a3, b3);
  vertex(a2, b2);
  vertex(a4, b4);
  vertex(ac, bc);
  vertex(a6, b6);
  endShape(CLOSE);

  //10
  translate(80, 0);

  fill(0);
  ellipse(ac, bc, l1, h1);
  fill(rouge, vert, bleu);

  noFill();
  ellipse(ac, bc, l1*2, h1*2);
  fill(rouge, vert, bleu);

  beginShape();
  vertex(a1, b1);
  vertex(a5, b5);
  vertex(a3, b3);
  vertex(a2, b2);
  vertex(a4, b4);
  vertex(ac, bc);
  vertex(a6, b6);
  endShape(CLOSE);

  //11
  translate(80, 0);

 fill(0);
ellipse(ac, bc, l1, h1);
  fill(rouge, vert, bleu);

  beginShape();
  vertex(a1, b1);
  vertex(ac, bc);
  vertex(a5, b5);
  vertex(a3, b3);
  vertex(a4, b4);
  vertex(a2, b2);
  vertex(a6, b6);
  endShape(CLOSE);

  //12
  translate(80, 0);

  noFill();
  ellipse(ac, bc, l3, h3);
  fill(rouge, vert, bleu);

  beginShape();
  vertex(a1, b1);
  vertex(ac, bc);
  vertex(a5, b5);
  vertex(a3, b3);
  vertex(a4, b4);
  vertex(a2, b2);
  vertex(a6, b6);
  endShape(CLOSE);

  fill(0);
ellipse(a1, b2, l2, h2);
  fill(rouge, vert, bleu);

  //13
  translate(-400, 100);

  strokeWeight(5);
  noFill();
  ellipse(ac, bc, l4, h4);
  strokeWeight(C);

  fill(rouge, vert, bleu);

  beginShape();
  vertex(a1, b1);
  vertex(a5, b5);
  vertex(a3, b3);
  vertex(a2, b2);
  vertex(a4, b4);
  vertex(ac, bc);
  vertex(a6, b6);
  endShape(CLOSE);

  fill(0);
ellipse(ac, bc, l2, h2);
  fill(rouge, vert, bleu);

  noFill();
  strokeWeight(2);
  ellipse(ac, bc, l1*2, h1*2);
  strokeWeight(C);

  fill(rouge, vert, bleu);

  //14
  translate(80, 0);

  noFill();
  strokeWeight(4);
  ellipse(a1, b2, l4, h4);
  strokeWeight(C);

  fill(rouge, vert, bleu);

  beginShape();
  vertex(a1, b1);
  vertex(ac, bc);
  vertex(a5, b5);
  vertex(a3, b3);
  vertex(a4, b4);
  vertex(a2, b2);
  vertex(a6, b6);
  endShape(CLOSE);

  fill(0);
ellipse(ac, bc, l2, h2);
  fill(rouge, vert, bleu);

  noFill();
  strokeWeight(C*2);
  ellipse(a5+(a3-a5)/3*2, bc+(b4-bc)/2, l4, h4);
  strokeWeight(C);
  fill(rouge, vert, bleu);

  //15
  translate(80, 0);

  strokeWeight(5);
  noFill();
  ellipse(ac, bc, l4, h4);
  strokeWeight(C);

  fill(rouge, vert, bleu);

  beginShape();
  vertex(a5, b5);
  vertex(a1, b1);
  vertex(a2, b2);
  vertex(ac, bc);
  vertex(a4, b4);
  vertex(a3, b3);
  vertex(a6, b6);
  endShape(CLOSE);

  fill(0);
  ellipse(ac, bc, l1, h1);
  fill(rouge, vert, bleu);

  //16
  translate(80, 0);

  noFill();
  ellipse(ac, bc, l3, h3);

  fill(rouge, vert, bleu);

  beginShape();
  vertex(a1, b1);
  vertex(a5, b5);
  vertex(a3, b3);
  vertex(a2, b2);
  vertex(a4, b4);
  vertex(ac, bc);
  vertex(a6, b6);
  endShape(CLOSE);

  fill(0);
ellipse(a6+(ac-a6)/2, b1+(b5-b1)/2, l2, h2);
  fill(rouge, vert, bleu);

  //17
  translate(80, 0);

  noFill();
  ellipse(ac, bc, l3, h3);

  fill(rouge, vert, bleu);

  beginShape();
  vertex(a5, b5);
  vertex(a1, b1);
  vertex(a2, b2);
  vertex(ac, bc);
  vertex(a4, b4);
  vertex(a3, b3);
  vertex(a6, b6);
  endShape(CLOSE);

  fill(0);
ellipse(ac, bc, l2, h2);
  fill(rouge, vert, bleu);

  noLoop();
}



