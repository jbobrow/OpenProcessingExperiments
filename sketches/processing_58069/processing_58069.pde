
// Created by Hana Svatos-Raznjevic
// ARCH 2503 Digital Media, Department of Architecture, Cornell AAP
// Unité d'Habitation by Le Corbusier

void setup () {
  size(1462, 648); 
  strokeWeight(0);
  background(0);
  smooth();
  frameRate(5);

  int x = 0;
  int y = 4;
  int m=436;
  int n=4;
  int a=4;
  int b=4;
  int e=4;
  int f=4;
  int g=4;
  int h=4;
  noStroke();
  fill (255);
  rect(0, 0, 1800, 1000);
  fill (221, 221, 227);
  for (int i=0; i<11; i++) {
    x= x+4;
    fill (178, 160, 188, 80);
    rect(x, y, 50, 15);
    x=x+50;
  }
  for (int j=0; j<16; j++) {
    fill (178, 160, 188, 60);
    rect (m, n+38, 50, 15);
    rect (m+54, n+38, 50, 15);
    rect (m+108, n+38, 50, 15);
    n=n+38;
  }
  fill (213, 203, 219, 40);
  rect (a, 23, 590, 15);  
  rect (a, 99, 1454, 15);
  rect (a, 137, 590, 15);
  rect (a, 213, 1454, 15);
  rect (a, 251, 590, 15);
  rect (a, 327, 1454, 15);
  rect (a, 403, 1454, 15);
  rect (a, 441, 590, 15);
  rect (a, 517, 1454, 15);
  rect (a, 556, 590, 15);
  rect (a, 630, 1454, 15);

  for (int j=0; j<8; j++) {
    int c=42;
    fill (186, 162, 198, 95);
    rect (b, c, 50, 40);
    rect (b, c+41, 50, 12);
    b= b+54;
  }

  for (int j=0; j<8; j++) {
    int c=156;
    rect (a, c, 50, 40);
    rect (a, c+41, 50, 12);
    a= a+54;
  }

  for (int j=0; j<8; j++) {
    int c=270;
    rect (e, c, 50, 40);
    rect (e, c+41, 50, 12);
    e= e+54;
  }

  for (int j=0; j<8; j++) {
    int c=346;
    rect (f, c, 50, 40);
    rect (f, c+41, 50, 12);
    f= f+54;
  }

  for (int j=0; j<8; j++) {
    int c=460;
    rect (g, c, 50, 40);
    rect (g, c+41, 50, 12);
    g= g+54;
  }

  for (int j=0; j<8; j++) {
    int c=574;
    rect (h, c, 50, 40);
    rect (h, c+41, 50, 12);
    h= h+54;
  }

  int k=598;

  fill (213, 203, 219, 40);
  rect (436, 4+57, 1022, 15);
  rect (436, 175, 1022, 15);
  rect (436, 289, 1022, 15);
  rect (436, 365, 158, 15);
  rect (436, 479, 1022, 15);
  rect (436, 593, 1022, 15);


  for (int j=0;j<16; j++) {
    int w=4;
    fill (186, 162, 198, 60);
    rect (k, w, 50, 40);
    rect (k, w+41, 50, 12);
    k=k+54;
  }

  int l=598;

  for (int j=0;j<16; j++) {
    int w=118;
    rect (l, w, 50, 40);
    rect (l, w+41, 50, 12);
    l=l+54;
  }


  int lj=598;
  for (int j=0;j<16; j++) {
    int w=232;
    rect(lj, w, 50, 40);
    rect(lj, w+41, 50, 12);
    lj=lj+54;
  }

  int lm=598;
  for (int j=0;j<16; j++) {
    int w=346;
    rect(lm, w, 50, 40);
    rect(lm, w+41, 50, 12);
    lm=lm+54;
  }

  int ln=598;
  for (int j=0;j<16; j++) {
    int w=422;
    rect(ln, w, 50, 40);
    rect(ln, w+41, 50, 12);
    ln=ln+54;
  }

  int ll=598;
  for (int j=0;j<16; j++) {
    int w=536; 
    rect(ll, w, 50, 40);
    rect(ll, w+41, 50, 12);
    ll=ll+54;
  }


  for (int j=0; j<16; j++) {
    fill (80, 80, 80, 80);
    rect (m, n+38, 50, 15);
    rect (m+54, n+38, 50, 15);
    rect (m+108, n+38, 50, 15);
    n=n+38;
  }

  for (int i=0; i<16; i++) {
    x= x+4;
    fill (194, 171, 206);
    rect(x, 80, 50, 15);
    x=x+50;
  } 
  int r=594;
  for (int i=0; i<16; i++) {
    r=r+4;
    rect(r, 194, 50, 15);
    r=r+50;
  } 

  int mh=594;
  for (int i=0; i<16; i++) {
    mh= mh+4;
    rect(mh, 308, 50, 15);
    mh=mh+50;
  } 

  int hh=594;
  for (int i=0; i<16; i++) {
    hh= hh+4;
    rect(hh, 498, 50, 15);
    hh=hh+50;
  } 

  int nh=594;
  for (int i=0; i<16; i++) {
    nh= nh+4;
    rect(nh, 612, 50, 15);
    nh=nh+50;
  } 

  int s=0;
  for (int j=0; j<8; j++) {
    s=s+4;
    rect (s, 118, 50, 15);
    s=s+50;
  }

  int sl=0;
  for (int j=0; j<8; j++) {
    sl=sl+4;
    rect (sl, 232, 50, 15);
    sl=sl+50;
  }

  int sm=0;
  for (int j=0; j<8; j++) {
    sm=sm+4;
    rect (sm, 422, 50, 15);
    sm=sm+50;
  }

  int mm=0;
  for (int j=0; j<8; j++) {
    mm=mm+4;
    rect (mm, 536, 50, 15);
    mm=mm+50;
  }
}
void draw () {

  if (mouseX>4 && mouseX<216 && mouseY>42 & mouseY <95) {
    drawSavoye (4, 42);
  }
  if (mouseX>4 && mouseX<216 && mouseY>156& mouseY <209) {
    drawSavoye (4, 156);
  }
  if (mouseX>4 && mouseX<216 && mouseY>270 & mouseY <323) {
    drawSavoye (4, 270);
  }
  if (mouseX>4 && mouseX<216 && mouseY>346 & mouseY <399) {
    drawSavoye (4, 346);
  }
  if (mouseX>4 && mouseX<216 && mouseY>460 & mouseY <513) {
    drawSavoye (4, 460);
  }
  if (mouseX>4 && mouseX<216 && mouseY>574 & mouseY <627) {
    drawSavoye (4, 574);
  }

  if (mouseX>220 && mouseX<292 && mouseY>574 & mouseY <627) {
    drawSavoye (220, 574);
  }
  if (mouseX>220 && mouseX<292 && mouseY>460 & mouseY <513) {
    drawSavoye (220, 460);
  }
  if (mouseX>220 && mouseX<292 && mouseY>346 & mouseY <399) {
    drawSavoye (220, 346);
  }
  if (mouseX>220 && mouseX<292 && mouseY>270 & mouseY <323) {
    drawSavoye (220, 270);
  }
  if (mouseX>220 && mouseX<292 && mouseY>156& mouseY <209) {
    drawSavoye (220, 156);
  }
  if (mouseX>220 && mouseX<292 && mouseY>42 & mouseY <95) {
    drawSavoye (220, 42);
  }

  if (mouseX>598 && mouseX<810 && mouseY>4 & mouseY <57) {
    drawSavoye (598, 4);
  }
  if (mouseX>814 && mouseX<1026 && mouseY>4 & mouseY <57) {
    drawSavoye (814, 4);
  }
  if (mouseX>1030 && mouseX<1242 && mouseY>4 & mouseY <57) {
    drawSavoye (1030, 4);
  }
  if (mouseX>1246 && mouseX<1458 && mouseY>4 & mouseY <57) {
    drawSavoye (1246, 4);
  }

  if (mouseX>598 && mouseX<810 && mouseY>118 & mouseY <171) {
    drawSavoye (598, 118);
  }
  if (mouseX>814 && mouseX<1026 && mouseY>118 & mouseY <171) {
    drawSavoye (814, 118);
  }
  if (mouseX>1030 && mouseX<1242 && mouseY>118 & mouseY <171) {
    drawSavoye (1030, 118);
  }
  if (mouseX>1246 && mouseX<1458 && mouseY>118 & mouseY <171) {
    drawSavoye (1246, 232);
  }

  if (mouseX>598 && mouseX<810 && mouseY>232 & mouseY <285) {
    drawSavoye (598, 232);
  }
  if (mouseX>814 && mouseX<1026 && mouseY>232 & mouseY <285) {
    drawSavoye (814, 232);
  }
  if (mouseX>1030 && mouseX<1242 && mouseY>232 & mouseY <285) {
    drawSavoye (1030, 232);
  }
  if (mouseX>1246 && mouseX<1458 && mouseY>232 & mouseY <285) {
    drawSavoye (1246, 232);
  }

  if (mouseX>598 && mouseX<810 && mouseY>346 & mouseY <399) {
    drawSavoye (598, 346);
  }
  if (mouseX>814 && mouseX<1026 && mouseY>346 & mouseY <399) {
    drawSavoye (814, 346);
  }
  if (mouseX>1030 && mouseX<1242 && mouseY>346 & mouseY <399) {
    drawSavoye (1030, 346);
  }
  if (mouseX>1246 && mouseX<1458 && mouseY>346 & mouseY <399) {
    drawSavoye (1246, 346);
  }

  if (mouseX>598 && mouseX<810 && mouseY>422 & mouseY <475) {
    drawSavoye (598, 422);
  }
  if (mouseX>814 && mouseX<1026 && mouseY>422 & mouseY <475) {
    drawSavoye (814, 422);
  }
  if (mouseX>1030 && mouseX<1242 && mouseY>422 & mouseY <475) {
    drawSavoye (1030, 422);
  }
  if (mouseX>1246 && mouseX<1458 && mouseY>422 & mouseY <475) {
    drawSavoye (1246, 422);
  }

  if (mouseX>598 && mouseX<810 && mouseY>536 & mouseY <599) {
    drawSavoye (598, 536);
  }
  if (mouseX>814 && mouseX<1026 && mouseY>536 & mouseY <599) {
    drawSavoye (814, 536);
  }
  if (mouseX>1030 && mouseX<1242 && mouseY>536 & mouseY <599) {
    drawSavoye (1030, 536);
  }
  if (mouseX>1246 && mouseX<1458 && mouseY>536 & mouseY <599) {
    drawSavoye (1246, 536);
  }
}




void mousePressed()
{

  if (mouseX>814 && mouseX<1026 && mouseY>422 & mouseY <475) {
    drawNO (814, 422);
  }
  if (mouseX>1030 && mouseX<1242 && mouseY>422 & mouseY <475) {
    drawNO (1030, 422);
  }
  if (mouseX>1246 && mouseX<1458 && mouseY>422 & mouseY <475) {
    drawNO (1246, 422);
  }

  if (mouseX>598 && mouseX<810 && mouseY>536 & mouseY <599) {
    drawNO (598, 536);
  }
  if (mouseX>814 && mouseX<1026 && mouseY>536 & mouseY <599) {
    drawNO (814, 536);
  }
  if (mouseX>1030 && mouseX<1242 && mouseY>536 & mouseY <599) {
    drawNO (1030, 536);
  }
  if (mouseX>1246 && mouseX<1458 && mouseY>536 & mouseY <599) {
    drawNO (1246, 536);
  } 

  if (mouseX>4 && mouseX<216 && mouseY>42 & mouseY <95) {
    drawNO (4, 42);
  }
  if (mouseX>4 && mouseX<216 && mouseY>156& mouseY <209) {
    drawNO (4, 156);
  }
  if (mouseX>4 && mouseX<216 && mouseY>270 & mouseY <323) {
    drawNO (4, 270);
  }
  if (mouseX>4 && mouseX<216 && mouseY>346 & mouseY <399) {
    drawNO (4, 346);
  }
  if (mouseX>4 && mouseX<216 && mouseY>460 & mouseY <513) {
    drawNO (4, 460);
  }
  if (mouseX>4 && mouseX<216 && mouseY>574 & mouseY <627) {
    drawNO (4, 574);
  }

  if (mouseX>220 && mouseX<292 && mouseY>574 & mouseY <627) {
    drawNO (220, 574);
  }
  if (mouseX>220 && mouseX<292 && mouseY>460 & mouseY <513) {
    drawNO (220, 460);
  }
  if (mouseX>220 && mouseX<292 && mouseY>346 & mouseY <399) {
    drawNO (220, 346);
  }
  if (mouseX>220 && mouseX<292 && mouseY>270 & mouseY <323) {
    drawNO (220, 270);
  }
  if (mouseX>220 && mouseX<292 && mouseY>156& mouseY <209) {
    drawNO (220, 156);
  }
  if (mouseX>220 && mouseX<292 && mouseY>42 & mouseY <95) {
    drawNO (220, 42);
  }

  if (mouseX>598 && mouseX<810 && mouseY>4 & mouseY <57) {
    drawNO (598, 4);
  }
  if (mouseX>814 && mouseX<1026 && mouseY>4 & mouseY <57) {
    drawNO (814, 4);
  }
  if (mouseX>1030 && mouseX<1242 && mouseY>4 & mouseY <57) {
    drawNO (1030, 4);
  }
  if (mouseX>1246 && mouseX<1458 && mouseY>4 & mouseY <57) {
    drawNO (1246, 4);
  }

  if (mouseX>598 && mouseX<810 && mouseY>118 & mouseY <171) {
    drawNO (598, 118);
  }
  if (mouseX>814 && mouseX<1026 && mouseY>118 & mouseY <171) {
    drawNO (814, 118);
  }
  if (mouseX>1030 && mouseX<1242 && mouseY>118 & mouseY <171) {
    drawNO (1030, 118);
  }
  if (mouseX>1246 && mouseX<1458 && mouseY>118 & mouseY <171) {
    drawNO (1246, 232);
  }

  if (mouseX>598 && mouseX<810 && mouseY>232 & mouseY <285) {
    drawNO (598, 232);
  }
  if (mouseX>814 && mouseX<1026 && mouseY>232 & mouseY <285) {
    drawNO (814, 232);
  }
  if (mouseX>1030 && mouseX<1242 && mouseY>232 & mouseY <285) {
    drawNO (1030, 232);
  }
  if (mouseX>1246 && mouseX<1458 && mouseY>232 & mouseY <285) {
    drawNO (1246, 232);
  }

  if (mouseX>598 && mouseX<810 && mouseY>346 & mouseY <399) {
    drawNO (598, 346);
  }
  if (mouseX>814 && mouseX<1026 && mouseY>346 & mouseY <399) {
    drawNO (814, 346);
  }
  if (mouseX>1030 && mouseX<1242 && mouseY>346 & mouseY <399) {
    drawNO (1030, 346);
  }
  if (mouseX>1246 && mouseX<1458 && mouseY>346 & mouseY <399) {
    drawNO (1246, 346);
  }

  if (mouseX>598 && mouseX<810 && mouseY>422 & mouseY <475) {
    drawNO (598, 422);
  }
}
void keyTyped () {
  saveFrame ("myframe###.jpg");
}

void drawSavoye (int xLoc, int yLoc) {

  float colA = random (0, 150);
  float colB = random (0, 100);
  float colC = random (0, 200);


  fill(68+colA, 23+colC, 93+colB, 90);
  rect ( xLoc, yLoc+19, 50, 15);
  rect ( xLoc+54, yLoc +19, 104, 15);
  rect( xLoc+162, yLoc+19, 50, 15);
}


void drawNO (int xLoc, int yLoc) {
  fill(255);
  rect (xLoc, yLoc, 212, 53);

  float roofDraw = random (0, 1);
  if ((roofDraw >= 0.2) && (roofDraw <= 0.6)) {
    float colD = random (0, 150);
    float colE = random (0, 100);
    float colF = random (0, 200);
    fill(40+colD, 53+colE, 93+colF, 80);
    rect (xLoc+1, yLoc-36, 95, 36);
    fill(49+colE, 153+colF, 293+colD, 80);
    rect (xLoc+60, yLoc-36, 6, 36);
    fill(140+colD, 433+colE, 53+colF, 80);
    rect (xLoc+120, yLoc-36, 6, 36);
  } 




  float roof3Draw = random (0, 1);
  if (roof3Draw > 0.7) {
    float colD = random (0, 200);
    float colE = random (0, 700);
    float colF = random (0, 180);
    fill(40+colD, 53+colE, 93+colF, 70);
    rect (xLoc, yLoc+53, 4, 40);
  } 

  float roof4Draw = random (0, 1);
  if (roof4Draw > 0.6) {
    float colD = random (0, 500);
    float colE = random (0, 300);
    float colF = random (0, 60);
    fill(20+colD, 64+colE, 93+colF, 50);
    rect (xLoc+50, yLoc+53, 4, 40);
  } 
  float roof5Draw = random (0, 1);
  if (roof5Draw > 0.5) {
    float colD = random (0, 320);
    float colE = random (0, 90);
    float colF = random (0, 550);
    fill(colD+104, 53+colE, 33+colF, 50);
    rect (xLoc+104, yLoc+53, 4, 40);
  } 

  float roof6Draw = random (0, 1);
  if (roof6Draw > 0.6) {
    float colD = random (0, 520);
    float colE = random (0, 300);
    float colF = random (0, 120);
    fill(colD+10, 91+colE, 76+colF, 50);
    rect (xLoc+158, yLoc+53, 4, 40);
  } 

  float roof7Draw = random (0, 1);
  if (roof7Draw > 0.5) {
    float colD = random (0, 420);
    float colE = random (0, 120);
    float colF = random (0, 700);
    fill(colD+22, 153+colE, 93+colF, 50);
    rect (xLoc+208, yLoc+53, 4, 40);
  } 

  float roof9Draw = random (0, 1);
  if ((roof9Draw > 0) && (roof9Draw < 0.2)) {
    float colD = random (0, 600);
    float colE = random (0, 120);
    float colF = random (0, 700);
    fill(colF+22, 43+colE, 93+colD, 70);
    rect (xLoc+108, yLoc-36, 104, 36);
    fill(colD+22, 153+colE, 93+colF, 70);
    rect (xLoc+80, yLoc-36, 6, 36);
    fill(colD+32, 123+colE, 83+colF, 80);
    rect (xLoc+158, yLoc-36, 6, 36);
    fill(colE+32, 123+colD, 763+colF, 90);
    rect (xLoc+158, yLoc-25, 50, 15);
  } 


  float roof81Draw = random (0, 1);
  if (roof81Draw > 0.7) {
    float colD = random (0, 420);
    float colE = random (0, 540);
    float colF = random (0, 700);
    fill(colD+22, 153+colE, 93+colF, 70);
    rect (xLoc+108, yLoc-36, 104, 36);
    fill(colD+62, 443+colE, 3+colF, 70);
    rect (xLoc+35, yLoc-36, 50, 36);
    fill(colD+72, 14+colE, 22+colF, 70);
    rect (xLoc+80, yLoc-36, 30, 36);
    fill(colD+88, 94+colE, 32+colF, 70);
    rect (xLoc+110, yLoc-36, 70, 36);
  } 
  float roof888Draw = random (0, 1);
  if ((roof888Draw > 0.6) && (roof888Draw < 0.7)) {
    float colD = random (0, 420);
    float colE = random (0, 540);
    float colF = random (0, 700);
    fill(colF+22, 153+colD, 93+colE, 70);
    rect (xLoc+25, yLoc-36, 170, 36);
  }
}




