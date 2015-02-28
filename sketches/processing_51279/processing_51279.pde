
//Sarah Keeling, 2/2/12
//Jim Roberts Processing for the Art, CMU Spr'12  
//Assignment 6
//copyright 2012

float tx, ty, td, tSpeed;
float tx2, ty2, ts2, txSpeed2, tySpeed2;

int pink = #F2BFD3;
void setup () {
  size (400, 400);
  background (255);
  
  tx = random (0, width); 
  ty = 0;
  td = 60;
  tSpeed = 3 ;
  tx2 = random (0, width);
  ty2 = 200;
  ts2 = 100;
  txSpeed2 = 4;
  tySpeed2 = 2;
  smooth();
}

void draw () {
  prepWindow();
  drawObject1 (tx, ty, td);
  drawObject2 (tx2, ty2, ts2, ts2);
  moveObject1 ();
  bouceObject2 ();
}

void prepWindow () {
  fill (255, 10);
  rect (0, 0, width, height) ;
}

void drawObject1 (float x, float y, float d) {
  noStroke ();
  fill (#A4FC03, 120);
  ellipse (x, y, d, d);
}

void drawObject2 (float x, float y, float wd, float ht) {

  fill (0, 0, 0, 120);
  rect (x, y, wd, ht);

  fill (#EA0781);
  noStroke ();
  rect (x, y, wd+2, ht+2);
  fill (#EA0781, 200);
  rect (x-15, y-15, wd+30, ht+30);

  //>>>S
  noFill();
  stroke (#A4FC03);
  strokeWeight (.2*wd);
  beginShape ();
  curveVertex (x+ .5*wd, y+ .2*ht);
  curveVertex (x+ .5*wd, y+ .2*ht);
  curveVertex (x+ .35*wd, y+ .15*ht);
  curveVertex (x+ .2*wd, y+ .2*ht);
  curveVertex (x+ .2*wd, y+ .35*ht);
  curveVertex (x+ .4*wd, y+ .5*ht);
  curveVertex (x+ .5*wd, y+ .7*ht);
  curveVertex (x+ .47*wd, y+ .87*ht);
  curveVertex (x+ .35*wd, y+ .95*ht);
  curveVertex (x+ .25*wd, y+ .97*ht);
  curveVertex (x+ .05*wd, y+ .9*ht);
  curveVertex (x+ .05*wd, y+ .7*ht);
  curveVertex (x+.15*wd, y+ .6*ht);
  curveVertex (x+.15*wd, y+ .6*ht);
  endShape ();

  //>>  K
  beginShape ();
  curveVertex (x+ .6*wd, y+ .15*ht);
  curveVertex (x+ .6*wd, y+ .15*ht);
  curveVertex (x+ .55*wd, y+ .97*ht);
  curveVertex (x+ .55*wd, y+ .97*ht);
  endShape ();
 
  beginShape ();
  curveVertex (x+ .9*wd, y+ .15*ht);
  curveVertex (x+ .9*wd, y+ .15*ht);
  curveVertex (x+ .75*wd, y+ .45*ht);
  curveVertex (x+ .6*wd, y+ .5*ht);
  curveVertex (x+ .75*wd, y+ .53*ht);
  curveVertex (x+ .8*wd, y+ .6*ht);
  curveVertex (x+ .9*wd, y+ .9*ht);
  curveVertex (x+ .97*wd, y+ .97*ht);
  curveVertex (x+ .97*wd, y+ .97*ht);
  endShape ();

  //>>E

  stroke (#0AEFF5);
  strokeWeight (.1*wd);
  beginShape ();
  curveVertex (x+ .65*wd, y+ .35*ht);
  curveVertex (x+ .65*wd, y+ .35*ht);
  curveVertex (x+ .45*wd, y+ .4*ht);
  curveVertex (x+ .4*wd, y+ .45*ht);
  curveVertex (x+ .35*wd, y+ .60*ht);
  curveVertex (x+ .4*wd, y+ .75*ht);
  curveVertex (x+ .45*wd, y+ .8*ht);
  curveVertex (x+ .65*wd, y+ .85*ht);
  curveVertex (x+ .65*wd, y+ .85*ht);
  endShape ();

  beginShape ();
  curveVertex (x+ .35*wd, y+ .6*ht);
  curveVertex (x+ .35*wd, y+ .6*ht);
  curveVertex (x+ .5*wd, y+ .6*ht);  
  curveVertex (x+ .5*wd, y+ .6*ht);
  endShape ();
  noStroke ();
}

void moveObject1 () {
  ty = ty + tSpeed;
  if (ty > height + (td/2)) {
    ty = 0;
    tx = tx + 40 ;
  }
  if (tx > width + (td/2) ) {
    tx = 0 ;
  }
}



void bouceObject2 () {
  tx2 = tx2 + txSpeed2;
  ty2 = ty2 + tySpeed2;
  if ((tx2 >= width - (ts2))) {
    txSpeed2 = -txSpeed2;
  }
  else if   
    ( tx2 <= 0) { 
    txSpeed2 = - txSpeed2;
  }

  if (ty2 >= height - (ts2)) {
    tySpeed2 = -tySpeed2;
  }
  else if (ty2 <= 0) {
    tySpeed2 = -tySpeed2;
  }
}


