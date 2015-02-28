
void setup()
{
  size(500, 500);
  background(255);
}



void draw()
{
  //J'agrandis ma forme
  scale(3);
  // Je la centre bien dans mon sketch
  translate(-65, -70);


  //variables ma position X
  int mpx;
  mpx=100;
  //variables ma position Y
  int mpy;
  mpy=100;
  //variable épaisseur de trait
  int ep;
  ep=12;


  //variable COULEUR JAUNE
  int r;
  r=255;

  int v;
  v=216;

  int b;
  b=18;

  //variable COULEUR ROSE
  int rr;
  rr=222;

  int vr;
  vr=0;

  int br;
  br=81;

//variable opacité 1
int opa;
opa=95;

//variable opacité 2
int opa2;
opa2=80;

  //diagonales JAUNES
  strokeWeight(ep);
  stroke(r, v, b, opa);
  line(mpx, mpx, mpy+100, mpy+100);
  line(mpx+100, mpx, mpy, mpy+100);




  //LIGNES ROSES

  stroke(rr, vr, br, opa2);
  //ligne coté centre gauche
  strokeWeight(ep+8);
  line(mpx+25, mpx+25, mpy, mpy+50);
  line(mpx, mpx+50, mpy+25, mpy+75);



  stroke(rr, vr, br, 80);
  //bas gauche
  line(mpx+25, mpx+75, mpy, mpy+100);


  //bas droit
  line(mpx+75, mpx+75, mpy+100, mpy+100);

  //line du sommet
  line(mpx+25, mpx+25, mpy+50, mpy+50);
  line(mpx+50, mpx+50, mpy+75, mpy+25);

  //ligne coté centre droit
  line(mpx+75, mpx+25, mpy+100, mpy+50);
  line(mpx+100, mpx+50, mpy+75, mpy+75);

  //bas droit
  line(mpx+75, mpx+75, mpy+100, mpy+100);

  //line du sommet
  line(mpx+25, mpx+25, mpy+50, mpy+50);
  line(mpx+50, mpx+50, mpy+75, mpy+25);

  noLoop();
}

