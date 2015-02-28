
String s;

void setup () {
  size (800, 600);
  fill (#CBCBCB);
  s ="make me smile! click&hold! ";
}

void draw() {
  textSize (42);
  text (s,50,50);
  rectMode(CENTER);
  fill (#15831D);
  rect (400, 300, 50, 150);
  fill (#FCF0F0);
  ellipseMode (CENTER);
  ellipse (400, 200, 80, 80);
  line (375,250,350,300);
  line (425,250,450,300);
  strokeWeight (2);
  line (383,378,383,430);
  line (417,378,417,430);
  fill (#FFFFFF);
  ellipseMode (CENTER);
  ellipse (385,190,15,15);
  ellipse (415,190,15,15);
  fill (#000000);
  ellipse (385,190,3,3);
  ellipse (415,190,3,3);
  line (400,200,397,210);
  line (397,210,400,210);
  if (mousePressed){
  bezier (385,222,395,232,405,232,415,222);
  }
  else {
  bezier (385,222,395,212,405,212,415,222);
  }
}



