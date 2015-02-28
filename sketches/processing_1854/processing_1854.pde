
float numeropetalas = 80;
float grados = 360.0/numeropetalas;
int Xpetala = 100;
int Ypetala = 0;

void setup (){
  size (800,600);
  background (40);
  translate (width/2, height/2);
  smooth ();
  stroke (200);
  strokeWeight (10);
  line (0,-120,0,200);



  noStroke ();
  fill (80);
  rectMode (CENTER);

  rect (0,200,850,200);
  fill (220);
  ellipse (0,-120,100,100);
  translate (0,-120);




  for(int i=0; i<numeropetalas; i++){
    fill (150,random (0,150),0,20);
    stroke (255,80);
    strokeWeight (1);
    rotate (radians (grados));
    ellipse (Xpetala, Ypetala, 200,40);



  } 



}









