
float amplada = 405;
float alcada = 300;
float alcadaXe = 100;
float ampladaXe = 50;
float midaF = 35;
float hx;
float hy;
 
float s = second();
float m = minute();
float h = hour();
 
int tpomes1 = 60;
float[] pomes1X = new float[tpomes1];
float[] pomes1Y = new float[tpomes1];
int tpomes2 =60;
float[] pomes2X = new float[tpomes2];
float[] pomes2Y = new float[tpomes2];
 
void setup(){
  size (600,400);
  
  for (int i = 0; i< tpomes1; i++) {
    pomes1X[i] = int(random(30,80));
    pomes1Y[i] = int(random(240,280));
    
  }
for (int i = 0; i< tpomes2; i++) {
    pomes2X[i] = int(random(510,570));
    pomes2Y[i] = int(random(240,280));
    
  }
  
}
 void draw (){
  background (168,207,219);
 
 s = second();
 m = minute();
 h = hour();
 
  
  tronc ();
 
  edifici ();
  
  finestres ();
  
  pintarfinestresh ();
  
  pintarfinestresm ();
  
  //terra
  fill (77,77,76);
  stroke (77,77,76);
  rect (0,375,600,125);
  
  fulles();
  
  fum ();
  
  pomes();
    
 }
 
 
 
void edifici (){
  
  //rectangle edifici
  stroke (219,191,168);
  fill (219,191,168);
  rect (100, 150, amplada, alcada);
  
  //xemeneies 
  fill (201, 34, 54);
  stroke (201, 34, 54);
  rect (150, 40, ampladaXe, alcadaXe);
  rect (290, 40, ampladaXe, alcadaXe);
  rect (425, 40, ampladaXe, alcadaXe);
  
  
  
  //teulades
  stroke (219,191,168);
  fill (219,191,168);
  triangle (100,150, 235, 50, 235,150);
  triangle (235, 150, 370, 50, 370, 150);
  triangle (370, 150, 505, 50, 505, 150);
 
  
}
 
void finestres(){
  //color
  stroke (137, 71, 6);
  strokeWeight (6);
  fill (30,13,28);
  
  //primera fila (4)
  rect (165,165,midaF,midaF);
  rect (250,165, midaF, midaF);
  rect (335, 165, midaF, midaF);
  rect (420, 165, midaF, midaF);
  
  //segona fila (4)
  rect (165,225,midaF,midaF);
  rect (250,225, midaF, midaF);
  rect (335, 225, midaF, midaF);
  rect (420, 225, midaF, midaF);
  
  // tercera fila (4)
  rect (165,285,midaF,midaF);
  rect (250,285, midaF, midaF);
  rect (335, 285, midaF, midaF);
  rect (420, 285, midaF, midaF);
}
 
void pintarfinestresh (){
  float h=hour();
  if(h>12)
{  
  h=h-12;
}
  for(int i=1;i<=h;i++){
  if (((i>=1)&&(i<5))) {
     hx=165+(i-1)*85;
     hy=165;
    fill (252, 252,66);
    rect (hx,hy,midaF,midaF);
  }
  if (((i>=5)&&(i<9))) {
     hx=165+(i-5)*85;
     hy=225;
    fill (252, 252,66);
    rect (hx,hy,midaF,midaF);
  }
  if (((i>=9)&&(i<13))) {
     hx=165+(i-9)*85;
     hy=285;
    fill (252, 252,66);
    rect (hx,hy,midaF,midaF);
  }
}
 
 
 
}
 
void pintarfinestresm (){
 h=h+1;
  if(h>12)
{  
  h=h-12;
}
  if ((h>=1)&&(h<5)) {
     hx=165+(h-1)*85;
     hy=165;
  }
  if ((h>=5)&&(h<9)) {
     hx=165+(h-5)*85;
     hy=225;
  }
  if (((h>=9)&&(h<13))) {
     hx=165+(h-9)*85;
     hy=285;
  }
   fill (201, 34, 54);
   noStroke ();
   rect (hx+3,hy+3,(midaF-5)*m/60,midaF-5);
}
 
 
 
void tronc (){
  
  //tronc 
  fill (85,47,9);
  noStroke ();
  rect (30,275,50,100);
  fill (168,207,219);
  ellipse (20,325,40,105);
  ellipse (90,325, 40, 105);
  fill (85,47,9);
  
   fill (85,47,9);
  noStroke ();
  rect (520,275,50,100);
  fill (168,207,219);
  ellipse (510,325,40,105);
  ellipse (580,325, 40, 105);
  fill (85,47,9);
}
 
 
void fulles (){
 
  
  fill (9,98,18);
  noStroke();
  ellipse (30,265,50,50);
  ellipse (80,265,50,50);
  ellipse (55, 280, 50,50);
  ellipse (45, 240, 50,50);
  ellipse (70, 240, 50,50);
  
  ellipse (520,265,50,50);
  ellipse (570,265,50,50);
  ellipse (545, 280, 50,50);
  ellipse (535, 240, 50,50);
  ellipse (560, 240, 50,50);
  
  
}
 
 
void fum (){
  
 fill (180,185,180);
 noStroke ();
 ellipse (145,15,20,20);
 ellipse (155,15,20,20);
 ellipse (145,25,20,20);
 ellipse (155,25,20,20);
 
 ellipse (285,15,20,20);
 ellipse (295,15,20,20);
 ellipse (285,25,20,20);
 ellipse (295,25,20,20);
 
 ellipse (420,15,20,20);
 ellipse (430,15,20,20);
 ellipse (420,25,20,20);
 ellipse (430,25,20,20);
 
 
}
 
void pomes(){
  
  for (int i = 0; i< s; i=i+2) {
    fill(201,34,54);
    ellipse(pomes1X[i], pomes1Y[i], 5,5);
  }
  
for (int i = 1; i< s; i=i+2) {
    fill(201,34,54);
    ellipse(pomes2X[i], pomes2Y[i], 5,5);
  }
}
