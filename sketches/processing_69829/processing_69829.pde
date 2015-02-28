
void setup() {
  size( 600, 600 );
 background (255);
  rectMode( CORNERS );
  ellipseMode( CENTER );
  
  //feet
  strokeWeight (3);
  stroke (139, 137, 112);
  fill (255, 250, 205);
  rect (225,  510,  270,  495);
  rect ( 330,  510,  375,  495);
  //arms
   strokeWeight (8);
  stroke (72, 61, 139);
  fill (132, 112, 255);
  line ( 225,  390,  255,  345);
  line ( 345,  345,  375,  390);
  //ears
  strokeWeight (3);
  ellipse ( 270,  150, 30, 120);
  ellipse ( 330,  150, 30, 120);
  //inside ears
  stroke (255, 192, 203);
  fill (255, 192, 203);
  ellipse ( 270,  180, 10, 120);
  ellipse ( 330,  180, 10, 120);
  //legs
  stroke (72, 61, 139);
  fill (132, 112, 255);
  ellipse ( 255,  465, 60, 60);
  ellipse ( 345,  465, 60, 60);
   //belly
  ellipse ( 300,  420, 120, 120);
  //shoulders
  ellipse ( 270,  330, 60, 60);
  ellipse ( 330,  330, 60, 60);
  //paws and chest
  stroke (139, 137, 112);
  fill (255, 250, 205);
  ellipse ( 225,  390, 30, 30);
  ellipse ( 375,  390, 30, 30);
  ellipse ( 300,  375, 90, 150);
  //scarf
  stroke (255, 192, 203);
  fill (255, 192, 203);
  rect ( 255,  315,  345,  285);
  rect ( 315,  390,  340,  315);
  //scarfdesign
  rectMode( CENTER );
  stroke (135, 72, 83);
  pushMatrix ();
  translate ( 327,  370);
  rotate (radians (45));
  rect (0,0, 17, 17);
  popMatrix();
   pushMatrix ();
  translate ( 327,  340);
  rotate (radians (45));
  rect (0,0, 17, 17);
  popMatrix();
  //head
  stroke (72, 61, 139);
  fill (132, 112, 255);
  ellipse ( 300,  234, 135, 135);
  //mouth
  stroke (139, 137, 112);
  fill (255, 250, 205);
  ellipse ( 300,  261, 75, 75);
  //face
  stroke (72, 61, 139);
  strokeWeight (3.5);
  line ( 255,  240,  285,  210);
  line ( 315,  210,  345,  240);
  line ( 285,  285,  309,  250);
  line ( 291,  250,  315,  285);
  line ( 291,  250,  309,  250);
  }
  

