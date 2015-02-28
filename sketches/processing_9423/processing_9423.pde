
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



void setup () {
  size (700,700);
  smooth ();
  imageMode (CENTER);
  colorMode(HSB,360, 100, 100);
  

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
 

}



   

void draw () {
  
 background (0);
 noLoop();
  //blackhole
   
   pushMatrix();
    x=random (200,width);
    y= random (200,500);
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
    image(imgB, 500, 500);
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
    image(imgC, 300, 250);
    popMatrix();
    
  //Baron Dog
   pushMatrix();
    x=random (width);
    y= random (height);
    translate (x,y);
    r= random (-HALF_PI,HALF_PI);
    rotate (r); 
  image(imgD, 700, 200);
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
  
 // image(imgR, 0, 0);
  //image(imgS, 0, 0);
  //image(imgT, 0, 0);
 //image(imgU, 0, 0);


  if (b>=360) { b=0;} else if (b>=0) { b++;}
   fill (b,100,100);

     pushMatrix();
    x=random (width);
    y= random (height);
    translate (x,y);
    r= random (-QUARTER_PI,QUARTER_PI);
    rotate(r);
text ("FASHION", 0,0);
popMatrix();

  pushMatrix();
    x=random (width);
    y= random (height);
    translate (x,y);
r= random (-QUARTER_PI,QUARTER_PI);
    rotate(r);
text ("COTOURE", 0, 0);
popMatrix();

  pushMatrix();
    x=random (width);
    y= random (height);
    translate (x,y);
r= random (-QUARTER_PI,QUARTER_PI);
    rotate(r);
text ("SOPHISTICATION", 0, 0);
popMatrix();

  pushMatrix();
    x=random (width);
    y= random (height);
    translate (x,y);
    r= random (-HALF_PI,HALF_PI);
text ("AVANT-GARDE", 0, 0);
popMatrix();

  pushMatrix();
    x=random (width);
    y= random (height);
    translate (x,y);
r= random (-QUARTER_PI,QUARTER_PI);
    rotate(r);
text ("TRES CHIC", 0,0);
popMatrix();
}

void mousePressed() {
  if (mousePressed) {
    redraw();}
}
  

