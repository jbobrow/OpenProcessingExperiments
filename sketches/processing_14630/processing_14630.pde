
PImage la;
PImage la_1;
PImage la_3;
PImage la1; 
PImage la2; 
PImage la3; 
PImage la4; 
PImage la5; 
PImage la6; 
PImage la7; 
PImage la8; 
PImage la9; 
PImage la10; 
PImage la11; 
PImage la12;
PImage la13; 
PImage la14; 
PImage la15; 
PImage la16; 
PImage la17; 
PImage la18;
PImage la19; 
PImage la20; 
PImage la21; 

float ang;



void setup() {
  size(800,800);
  smooth();
la = loadImage("la.jpg");  
la_3 = loadImage("la-3.jpg"); 
la_1 = loadImage("la-1.jpg");
la1 = loadImage("la+1.jpg"); 
la2 = loadImage("la+2.jpg"); 
la3 = loadImage("la+3.jpg");
la4 = loadImage("la+4.jpg"); 
la5 = loadImage("la+5.jpg"); 
la6 = loadImage("la+6.jpg");
la8 = loadImage("la+8.jpg"); 
la9 = loadImage("la+9.jpg"); 
la10 = loadImage("la+10.jpg");
la11 = loadImage("la+11.jpg"); 
la12 = loadImage("la+12.jpg"); 
la13 = loadImage("la+13.jpg");
la14 = loadImage("la+14.jpg"); 
la15 = loadImage("la+15.jpg"); 
la16 = loadImage("la+16.jpg");
la17 = loadImage("la+17.jpg"); 
la18 = loadImage("la+18.jpg"); 
la19 = loadImage("la+19.jpg"); 
la20 = loadImage("la+20.jpg"); 
la21 = loadImage("la+21.jpg"); 
}




void draw() {

  float hrotation = map(hour(),0,24,0,TWO_PI)-HALF_PI;
  ang = hrotation;
  pushMatrix();
  translate(400,400);
  rotate(hrotation);
  scale(.6,.6);
 /*
     if (ang>HALF_PI&& ang<HALF_PI+PI){
      pushMatrix();
      translate(la.width,la.height);
      rotate(PI);
       image(la,0,0);
      popMatrix();
    } else {
       image(la,0,0);
    }
/* 
    rotate(TWO_PI/24);
    ang += TWO_PI/24 ;
    if (ang>HALF_PI&& ang<HALF_PI+PI){
      pushMatrix();
      translate(la_1.width,la_1.height);
      rotate(PI);
      image(la_1,0,0);
      popMatrix();
    } else {
      image(la_1,0,0);
    }
    
  */  
    drawHand(la_1);
    drawHand(la_3);
    drawHand(la);
    drawHand(la1);
    drawHand(la2);
    drawHand(la3);
    drawHand(la4);
    drawHand(la5);
    drawHand(la6);
    drawHand(la8);
    drawHand(la9);
    drawHand(la10);
    drawHand(la11);
    drawHand(la12);
    drawHand(la13);
    drawHand(la14);
    drawHand(la15);
    drawHand(la16);
    drawHand(la17);
    drawHand(la18);
    drawHand(la19);
    drawHand(la20);
    drawHand(la21);

      popMatrix();
  
}


void drawHand(PImage img) {
    rotate(TWO_PI/24);
    ang += TWO_PI/24 ;
    if (ang>HALF_PI&& ang<HALF_PI+PI){
      pushMatrix();
      translate(img.width,img.height);
      rotate(PI);
      image(img,0,0);
      popMatrix();
    } else {
      image(img,0,0);
    }
}
  

