
PImage img;
PImage imgA;
PImage imgB;
PImage imgC;
PImage imgD;
PImage imgE;
PImage imgF;
PImage imgG;
PImage imgH;
PImage imgI;
PImage imgJ;
PImage imgK;
PImage imgL;
PImage imgM;
PImage imgN;
PImage imgO;
PImage imgP;
PImage imgQ;
PImage imgR;
PFont imp;
int b = 0;
float x;
float y;
float r;
float w;
float x1;
float x2;
float x3;
float x4;
float x5;
float x6;
float x7;
float x8;
float y1;
float y2;
float y3;
float y4;
float y5;
float y6;
float y7;
float y8;

float r1;
float r2;
float r3;
float r4;
float r5;
float r6;
float r7;
float r8;



void setup () {
  size (900,700);
  smooth ();
  imageMode (CENTER);
  colorMode(HSB,360, 100, 100);
   background (0);

  img = loadImage ("bizniss.png");
  imgA= loadImage ("clown.png");
  imgB= loadImage ("fur.png");
  imgC= loadImage ("diva.png");
  imgD= loadImage ("cinderella.png");
  imgE= loadImage ("dogfight.png");
  imgF= loadImage ("diva.png");
  imgG= loadImage ("pig.png");
  imgH= loadImage ("gameboy.png");
  imgI= loadImage ("gator.png");
  imgJ= loadImage ("penguin.png");
  imgK= loadImage ("pirate.png");
  imgL= loadImage ("plaid.png");
 imgM= loadImage ("prisoner.png");
  imgN= loadImage ("punk.png");
  imgO =loadImage ("scuba.png");
  imgP =loadImage ("southerncharm.png");
  imgQ =loadImage ("threemusketeers.png");
  imgR= loadImage ("glowball.png");
  imp = loadFont ("Impact-36.vlw");
  textFont (imp);
    //blackhole
   
   pushMatrix();
    x=random (200,700);
    y= random (200,700);
    w= random (800,2000);
    translate (x,y);
    r= random (-HALF_PI,HALF_PI);
    rotate (r); 
  image(imgR, 0, 0, w,w);
  popMatrix();
  
 
  //fur dog
    pushMatrix();
    x=random (width);
    y= random (height);
    translate (x,y);
    r= random (-HALF_PI,HALF_PI);
    rotate (r); 
    image(imgB, 0, 0);
    popMatrix();
  
  
  //final dog
  pushMatrix();
    x=random (width);
    y= random (height);
    translate (x,y);
    r= random (-HALF_PI,HALF_PI);
    rotate (r); 
 image(imgQ, 0, 0);
 popMatrix();
 

  
  //PIG
  
   pushMatrix();
    x=random (width);
    y= random (height);
    translate (x,y);
    r= random (-HALF_PI,HALF_PI);
    rotate (r); 
  image(imgE, 0,0);
  popMatrix ();
  
  //image(imgF, 300, 600);
   
   //Game-Dog
   pushMatrix();
    x=random (width);
    y= random (height);
    translate (x,y);
    r= random (-HALF_PI,HALF_PI);
    rotate (r); 
  image(imgG, 0,0);
  popMatrix();
  
  //Gator Dog
   pushMatrix();
    x=random (width);
    y= random (height);
    translate (x,y);
    r= random (-HALF_PI,HALF_PI);
    rotate (r); 
  image(imgH, 0,0);
  popMatrix();
  
  //Penguin Dog
   pushMatrix();
    x=random (width);
    y= random (height);
    translate (x,y);
    r= random (-HALF_PI,HALF_PI);
    rotate (r); 
  image(imgI, 0,0);
  popMatrix();
  
  //Pirate Dog
   pushMatrix();
    x=random (width);
    y= random (height);
    translate (x,y);
    r= random (-HALF_PI,HALF_PI);
    rotate (r); 
  image(imgJ, 0,0);
  popMatrix();
  
  //Cinderella Dog
   pushMatrix();
    x=random (width);
    y= random (height);
    translate (x,y);
    r= random (-HALF_PI,HALF_PI);
    rotate (r); 
    image(imgC, 0, 0);
    popMatrix();
    
  //Baron Dog
   pushMatrix();
    x=random (width);
    y= random (height);
    translate (x,y);
    r= random (-HALF_PI,HALF_PI);
    rotate (r); 
  image(imgD, 0, 0);
  popMatrix();
 
  
  //Prisoner
   pushMatrix();
    x=random (width);
    y= random (height);
    translate (x,y);
    r= random (-HALF_PI,HALF_PI);
    rotate (r); 
  image(imgL, 0, 0);
  popMatrix();
  
  //Punk
   pushMatrix();
    x=random (width);
    y= random (height);
    translate (x,y);
    r= random (-HALF_PI,HALF_PI);
    rotate (r); 
  image(imgM, 0,0);
  popMatrix();
  
  //Scuba
   pushMatrix();
    x=random (width);
    y= random (height);
    translate (x,y);
    r= random (-HALF_PI,HALF_PI);
    rotate (r); 
  image(imgN, 0, 0);
  popMatrix();
  
  //Southern Belle
   pushMatrix();
    x=random (width);
    y= random (height);
    translate (x,y);
    r= random (-HALF_PI,HALF_PI);
    rotate (r); 
 image(imgO, 0,0);
 popMatrix ();
 
 
 
 //Musketeers
  pushMatrix();
    x=random (width);
    y= random (height);
    translate (x,y);
    r= random (-HALF_PI,HALF_PI);
    rotate (r); 
   image(imgP, 0, 0);
     popMatrix();

 
 
 
   //bizniss dog
    pushMatrix();
    x=random (width);
    y= random (height);
    translate (x,y);
    r= random (-HALF_PI,HALF_PI);
    rotate (r);
    image(img, 0, 0);
    popMatrix();
  
  //clown dog
    pushMatrix();
    x=random (20,400);
    y= random (200,500);
    translate (x,y);
    r= random (-HALF_PI,HALF_PI);
    rotate (r);
    image(imgA, 0, 0);
    popMatrix();
    
     //Plaid 
   pushMatrix();
    x=random (width);
    y= random (height);
    translate (x,y);
    r= random (-HALF_PI,HALF_PI);
    rotate (r); 
  image(imgK, 0, 0);
  popMatrix();
 
  x1= random(width);
  y1= random (height);
  translate (x1, y1);
  r1= random (-QUARTER_PI,QUARTER_PI);
  
   x2= random(width);
  y2= random (height);
  translate (x2, y2);
  r2= random (-QUARTER_PI,QUARTER_PI);
  
   x3= random(width);
  y3= random (height);
  translate (x3, y3);
  r3= random (-QUARTER_PI,QUARTER_PI);
  
   x4= random(width);
  y4= random (height);
  translate (x4, y4);
  r4= random (-QUARTER_PI,QUARTER_PI);
  
   x5= random(width);
  y5= random (height);
  translate (x5, y5);
  r5= random (-QUARTER_PI,QUARTER_PI);
  
   x6= random(width);
  y6= random (height);
  translate (x6, y6);
  r6= random (-QUARTER_PI,QUARTER_PI);
  
   x7= random(width);
  y7= random (height);
  translate (x7, y7);
  r7= random (-QUARTER_PI,QUARTER_PI);
  
   x8= random(width);
  y8= random (height);
  translate (x8, y8);
  r8= random (-QUARTER_PI,QUARTER_PI);
  
  


}



   

void draw () {
  



  



  if (b>=360) { b=0;} else if (b>=0) { b+=10;}
   fill (b,100,100);
   

     pushMatrix();
 
    rotate(r1);
text ("FASHIONISTA", x1,y1);
popMatrix();

  pushMatrix();
  
    rotate(r2);
text ("COTOURE", x2, y2);
popMatrix();

  pushMatrix();

    rotate(r3);
text ("SOPHISTICATION", x3, y3);
popMatrix();

  pushMatrix();
   rotate (r4);
text ("AVANT-GARDE",x4, y4);
popMatrix();

  pushMatrix();
 
    rotate(r5);
text ("TRES CHIC", x5,y5);
popMatrix();


pushMatrix();
  
    rotate(r6);
text ("En Vogue", x6,y6);
popMatrix();


pushMatrix();
    
    rotate(r7);
text ("Beyond", x7,y7);
popMatrix();


pushMatrix();
  
    rotate(r8);
text ("the new black...", x8,y8);
popMatrix();
}

//void mousePressed() {
//  if (mousePressed) {
//    redraw();}
//}
  

