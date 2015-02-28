
//////////////////////////////////////////////////////////////////SETUP
void setup () {
  size (1000, 625);
  background(250);
  frameRate(60);
}

//////////////////////////////////////////////////////////////////CONSTRUCTION
void bioPrism() {
  stroke(255, 255, 255, 50);
  int y = 80;
  int spacing = 100;
  int len = 1;
  float peakX = 350;
  float peakY = 150;
  float baseY = 450;
  float culetX = 350;
  float culetY = 600;


  for (int baseX=200; baseX<=800; baseX+= spacing) {
    line(baseX, baseY, baseX, baseY);
    line(peakX, peakY, baseX, baseY);
    line(baseX, baseY, culetX, culetY);
  }


  int jspacing = 100;
  int jen = 1;
  float jeakX = width/2;
  float jeakY = 80;
  float jaseY = 450;
  float juletX = width/2;
  float juletY = 600;

  for (int jaseX=200; jaseX<=800; jaseX+= jspacing) {
    line(jaseX, jaseY, jaseX, jaseY);
    line(jeakX, jeakY, jaseX, jaseY);
    line(jaseX, jaseY, juletX, juletY);
  }

  float sspacing = 100;
  int slen = 1;
  float speakX = 650;
  float speakY = 150;
  float sbaseY = 450;
  float sculetX = 650;
  float sculetY = 600;

  for (int sbaseX=200; sbaseX<=800; sbaseX+= sspacing) {
    line(sbaseX, sbaseY, sbaseX, sbaseY);
    line(speakX, speakY, sbaseX, sbaseY);
    line(sbaseX, sbaseY, sculetX, sculetY);
  }
  float rspacing = 100;
  int rlen = 1;
  float rpeakY = 450;
  float rbaseY = 100;
  float rculetX = 20;


  for (int rpeakX=200; rpeakX<=750; rpeakX+= rspacing) {
    rect(rpeakX, rpeakY, rbaseY, rculetX);
  }
  ///////////////////////////////////////////////////////END CONSTRUCTION
}




 

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////DRAW

///////////////////////////////////////////////shadingvariables


  //back
  float bShadeA = 0;
  float bShadeB = 0;
  float bShadeC = 0;
  float bShadeD = 0;
  float bShadeE = 0;
  float bShadeF = 0;

  //left
  float lShadeA = 0;
  float lShadeB = 0;
  float lShadeC = 0;
  float lShadeD = 0;
  float lShadeE = 0;
  float lShadeF = 0;

  //right
  float rShadeA = 0;
  float rShadeB = 0;
  float rShadeC = 0;
  float rShadeD = 0;
  float rShadeE = 0;
  float rShadeF = 0;
  
  //time
float timeA = 100;
float timeB = 350;
float timeC = 475;
float timeD = 625;
float timeE = 850;
float timeF = 900;

float transA = 255;


void draw() {

  smooth();


 


  ///////////////////////////////////////////////shadingback
        
  fill(0, bShadeA, 0, transA);
  triangle(width/2, 80, 200, 450, 300, 450);

  fill(0, bShadeB, 0, transA);
  triangle(width/2, 80, 300, 450, 400, 450);

  fill(0, bShadeC, 0, transA);
  triangle(width/2, 80, 400, 450, 500, 450);

  fill(0, bShadeD, 0, transA);
  triangle(width/2, 80, 500, 450, 600, 450);

  fill(0, bShadeE, 0, transA);
  triangle(width/2, 80, 600, 450, 700, 450);

  fill(0, bShadeF, 0, transA);
  triangle(width/2, 80, 700, 450, 800, 450);
  
  

  ///////////////////////////////////////////////shadingleft
  fill(lShadeA, 0, 0);
  triangle(350, 150, 200, 450, 300, 450);

  fill(lShadeB, 0, 0);
  triangle(350, 150, 300, 450, 400, 450);

  fill(lShadeC, 0, 0);
  triangle(350, 150, 400, 450, 500, 450);

  fill(lShadeD, 0, 0);
  triangle(350, 150, 500, 450, 600, 450);

  fill(lShadeE, 0, 0);
  triangle(350, 150, 600, 450, 700, 450);

  fill(lShadeF, 0, 0);
  triangle(350, 150, 700, 450, 800, 450);

  ///////////////////////////////////////////////shadingright
  fill(0, 0, rShadeA);
  triangle(650, 150, 200, 450, 300, 450);

  fill(0, 0, rShadeB);
  triangle(650, 150, 300, 450, 400, 450);

  fill(0, 0, rShadeC);
  triangle(650, 150, 400, 450, 500, 450);

  fill(0, 0, rShadeD);
  triangle(650, 150, 500, 450, 600, 450);

  fill(0, 0, rShadeE);
  triangle(650, 150, 600, 450, 700, 450);

  fill(0, 0, rShadeF);
  triangle(650, 150, 700, 450, 800, 450);


  ///////////////////////////////////////////////shadingmath

        if (mouseX>0 && mouseX<timeA) {
  bShadeA = bShadeA+5; }
else if  (mouseX>timeA && mouseX<timeB) {
  bShadeB = bShadeB+5; }
else if  (mouseX>timeB && mouseX<timeC) {
  bShadeC = bShadeC+5; }
else if (mouseX>timeC && mouseX<timeD) {
  bShadeD = bShadeD+5; }
else if (mouseX>timeD && mouseX<timeE) {
  bShadeE = bShadeE+5; }
else if (mouseX>timeE && mouseX<width) {
  bShadeF = bShadeF+5; }
  
          if (mouseX>0 && mouseX<timeA) {
  lShadeA = lShadeA+5; }
else if  (mouseX>timeA && mouseX<timeB) {
  lShadeB = lShadeB+5; }
else if  (mouseX>timeB && mouseX<timeC) {
  lShadeC = lShadeC+5; }
else if (mouseX>timeC && mouseX<timeD) {
  lShadeD = lShadeD+5; }
else if (mouseX>timeD && mouseX<timeE) {
  lShadeE = lShadeE+5; }
else if (mouseX>timeE && mouseX<width) {
  lShadeF = lShadeF+5; }
  
          if (mouseX>0 && mouseX<timeA) {
  rShadeA = rShadeA+5; }
else if  (mouseX>timeA && mouseX<timeB) {
  rShadeB = rShadeB+5; }
else if  (mouseX>timeB && mouseX<timeC) {
  rShadeC = rShadeC+5; }
else if (mouseX>timeC && mouseX<timeD) {
  rShadeD = rShadeD+5; }
else if (mouseX>timeD && mouseX<timeE) {
  rShadeE = rShadeE+5; }
else if (mouseX>timeE && mouseX<width) {
  rShadeF = rShadeF+5; }

 




  ///////////////////////////////////////////////shadingmath


  fill(0);
  stroke(255, 255, 255, 25);
  rect(0, 500, 1000, 150); 
  bioPrism();
  println (mouseX);
}

void mousePressed(){
    //back
   bShadeA = 0;
  bShadeB = 0;
  bShadeC = 0;
  bShadeD = 0;
   bShadeE = 0;
   bShadeF = 0;

  //left
  lShadeA = 0;
   lShadeB = 0;
  lShadeC = 0;
   lShadeD = 0;
  lShadeE = 0;
   lShadeF = 0;

  //right
   rShadeA = 0;
   rShadeB = 0;
   rShadeC = 0;
   rShadeD = 0;
   rShadeE = 0;
   rShadeF = 0;}

