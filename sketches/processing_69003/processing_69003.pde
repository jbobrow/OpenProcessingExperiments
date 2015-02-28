
float rads;
float radsc;
final int ON = 1;
final int OFF = 0;


float cx = 125;
float cy = 200;
float cax = 275;
float cay = 200;
float d = 50;
int etatcercle = OFF;

int nombreDeRayons = 20;
float longueurDesRayons = 30;
float tranche = TWO_PI/nombreDeRayons;
int nombreDeRayonsC = 50;
float longueurDesRayonsC = 30;
float trancheC = TWO_PI/nombreDeRayonsC;
float inc = 0;


int etatcarre;


float incC = 0 ;
//float y = 0;



void setup () {
size(400,400);

smooth();
}
 
 
void draw () {
background(255);
rectMode(CENTER);
noStroke();

//                                                CERCLE  ***************************

//  condition + Changements

 if (etatcercle == ON) {
    fill (255,0,255);
    if  (inc < TWO_PI) {
    inc = inc + 0.05;}
  } else {
    fill (0,255,0);
     if  (inc > 0) {
    inc = inc - 0.05; }
  }
  ellipse (cx,cy,d,d);
  
//  Rayons

stroke(0);
strokeWeight(5);
rads = 0;
while ( rads < inc)  {

 float x1 = cx +cos(rads) * longueurDesRayons * 2;
 float y1 = cy + sin(rads) * longueurDesRayons * 2;
 float x2 = cx +cos(rads) * longueurDesRayons;
 float y2 = cy + sin(rads) * longueurDesRayons;
 line(x1,y1,x2,y2 );
  
rads = rads + tranche;

 }

//                                                 CARRÉ  ***************************

//  condition + Changements

 if (etatcarre == ON) {
 
    if  (incC < height) {
    incC = incC + 0.05;}
  } else {
   
     if  (incC > 0) {
    incC = incC - 0.05; }
  }
  

//  Rayons

stroke(0);
strokeWeight(5);
radsc = 0;
while ( radsc < incC)  {

 float xx1 = 0;
 float yy1 = cy * radsc;
 float xx2 =height;
 float yy2 = cy *radsc;
 line(xx1,yy1,xx2,yy2 );
  
radsc = radsc + trancheC;


}
 if (etatcarre == ON) {
    fill (255,0,255);

  } else {
    fill (0,255,0);

  }
  noStroke();
  rect (cax, cay, d, d);
}


 
void mousePressed () {
 float distance = dist (mouseX, mouseY, cx, cy);
  if (distance < 25 ) {
  
  if (etatcercle == OFF ) {
    etatcercle = ON;
  } else {
    etatcercle = OFF;
  }

  }
  if ( mouseX > 225 && mouseX < 275 && mouseY > 175 && mouseY < 225 ) {
      if (etatcarre == OFF ) {
    etatcarre = ON;
  } else {
    etatcarre = OFF;
  }

  }

}

void mouseReleased() { 
  etatcarre =OFF ;
  
}
