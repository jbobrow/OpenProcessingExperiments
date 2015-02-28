
float radio1;
float radio2;
float posx1;
float posy1;
float gris;
float bordo;
float acu;
float acu2;
float acu3;

void setup () {
  size (800, 600);
  background (255);
  radio1=20;
  radio2=60;
  posx1=width/2;
  posy1=height/2;
  gris=#2d2d2d;
  bordo=#CC000C;
  acu=1;
  acu2=0;
  acu3=0;
}

void draw () {
  
  smooth ();
  fill (#2d2d2d);
  noStroke();
  ellipse (posx1, posy1, radio2+12, radio2+12);
  
  smooth ();
  fill (255);
  stroke (#CC000C);
  strokeWeight (8);
  ellipse (posx1, posy1, radio2, radio2);
  
  smooth();
  fill (#2d2d2d);
  noStroke ();
  ellipse (posx1, posy1, radio1, radio1);
  
  acu=acu+1;
  posx1=width/2+random(-width/7, width/7);
  posy1=height/2+random(-height/6, height/6);
  radio1=random(-20, 55);
  radio2=radio1*3;
  
  //chorros sangrientos
  if (keyPressed==true && key=='q') {
   
   fill(#CC000C);
   noStroke ();
   smooth();
   acu2=acu2+.5;
   ellipse (width/2, height/2+acu2, 20, 20);
   ellipse (width/2+50, height/2+acu2*10, 10, 10);
   ellipse (width/2-50, height/2+acu2*5, 10, 10);
   ellipse (width/2-20, height/2-50+acu2*5, 30, 30);
   ellipse (width/2+150, height/2-100+acu2*7, 10, 10);
   ellipse (width/2-150, height/2-100+acu2, 15, 15);
   
   ellipse (width/2-10, -height/2+acu2, 20, 20);
   ellipse (width/2+40, -height/2+acu2*10, 10, 10);
   ellipse (width/2-60, -height/2+acu2*5, 10, 10);
   ellipse (width/2-180, -height/2-50+acu2*5, 30, 30);
   ellipse (width/2+180, -height/2-100+acu2*7, 10, 10);
   ellipse (width/2-200, -height/2-100+acu2, 15, 15);
  }
  
  
  //chorros blancos
  if (keyPressed==true && key=='w') {
   
   fill(#2d2d2d);
   noStroke ();
   smooth();
   acu3=acu3+1;
   ellipse (width/2, 0+acu3, 100, 100);
   ellipse (width/2+300, 0+acu3-200, 150, 150);
   ellipse (width/2-200, 0+acu3-50, 80, 80);
   
   ellipse (50, -height/2+acu3, 20, 20);
   ellipse (100, -height/2+acu3*10, 10, 10);
   ellipse (0, -height/2+acu3*5, 10, 10);
   ellipse (width-180, -height/2-50+acu3*5, 30, 30);
   ellipse (width-20, -height/2-100+acu3*7, 10, 10);
   ellipse (width-200, -height/2-100+acu3, 15, 15);
  
  }
  
  //println (posx1);
  
}

void keyPressed () { //puede usarse tambien "mousePressed"
  if (key=='s') {
    saveFrame ("img.png");
  }
}




