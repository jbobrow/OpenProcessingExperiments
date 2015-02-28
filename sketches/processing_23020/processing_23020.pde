
int card = 0;
int x=105;
int y=149;
int t=255;

float xpos, ypos;    
float xpos1, ypos1; 
float xpos2, ypos2; 

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  
float xspeed1 = 1.3;  
float yspeed1 = 1.2;
float xspeed2 = 1;  
float yspeed2 = .5;

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom
int xdirection1 = 1;  
int ydirection1 = 1; 
int xdirection2 = 1;  
int ydirection2 = 1; 
int size = 60;

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
PImage imgS;
PImage imgT;
PImage imgU;


PFont font;

void setup () {
  size (640, 480);
  smooth ();
  img= loadImage ("2card.png");
  imgA= loadImage ("3card.png");
  imgB = loadImage ("nero.png");
  imgC = loadImage ("icepick.png");
  imgD = loadImage ("RomanAqueduct.jpg");
  imgE = loadImage ("romantemple.jpg");
  imgF = loadImage ("4card.png");
  imgG = loadImage ("5card.png");
  imgH = loadImage ("6card.png");
  imgI = loadImage ("louislouis.png");
  imgJ = loadImage ("jackson.png");
  imgK = loadImage ("india.png");
  imgL = loadImage ("disneyland.jpg");
  imgM = loadImage ("peterpan.png");
  imgN = loadImage ("atlanta.jpg");
  imgO = loadImage ("dinero.jpg");
  imgP = loadImage ("690.jpg");
  imgQ= loadImage ("monarchy.png");
  imgR = loadImage("0card.png");
    font= loadFont ("EdwardianScriptITC-24.vlw");
    textFont (font);
    imageMode(CENTER);
    
    xpos = 80;
  ypos = 110;
  xpos1= 110;
  ypos1= 80;
  
}



void draw () {
  background (255);
  fill (0);
  
  
  if (card==0) {
    image (imgR, width/2, height/2);
    
    
   if (mouseX>= 484 & mouseX<=565 & mouseY>=75 & mouseY<=110) { fill(129,12,12);} else {
  fill (255);}
  
   if ((mousePressed) & mouseX>= 484 & mouseX<=565 & mouseY>=75 & mouseY<=110)  {card=1;}
  
  
  
   text ("Begin", 484, 100);}
    
    
    


 else if (card==1) {
  cursor(); 
   t=255;
  image (img, width/2, height/2);
    if (mouseX>= 51 & mouseX<=137 & mouseY>=173 & mouseY<=301) { fill(129,12,12);} else {
  fill (0);}
  text ("Nero", 67, 355);
 
  
  if ((mousePressed) & mouseX>= 51 & mouseX<=137 & mouseY>=173 & mouseY<=301)  {card=2;}

   if (mouseX>= 196 & mouseX<=285 & mouseY>=173 & mouseY<=301) { fill(129,12,12);} else {
  fill (0);}
  
  text ("Louis", 222, 355);
  
  if ((mousePressed) & mouseX>= 196 & mouseX<=285 & mouseY>=173 & mouseY<=301)  {card=3;}
  
    if (mouseX>= 353 & mouseX<=432 & mouseY>=173 & mouseY<=301) { fill(129,12,12);} else {
  fill (0);}
  
  text ("M.J.", 374, 355);
  
  if ((mousePressed) & mouseX>= 353 & mouseX<=432 & mouseY>=173 & mouseY<=301)  {card=4;}
  
  if (mouseX>= 506 & mouseX<=586 & mouseY>=173 & mouseY<=301) { fill(129,12,12);} else {
  fill (0);}
  
  text ("Murkesh", 516, 353);
  
  if ((mousePressed) & mouseX>= 506 & mouseX<=586 & mouseY>=173 & mouseY<=301)  {card=5;}
  
  
   } else if (card==2) {
  noCursor();
  
    noTint();
   image (imgA, width/2, height/2);
   if(x>=350) {x=105; y=149;}
   
   if((mousePressed) & mouseX>= 424 & mouseX<=550 & mouseY>=169 & mouseY<=342) {
   t=0;}
   
   if (t==0) {
   xpos = xpos + ( xspeed * xdirection );
   ypos = ypos + ( yspeed * ydirection );
   xpos1 = xpos1 + ( xspeed1 * xdirection1 );
   ypos1 = ypos1 + ( yspeed1 * ydirection1 );
   xpos2 = xpos2 + ( xspeed2 * xdirection2 );
   ypos2 = ypos2 + ( yspeed2 * ydirection2 );
   if (xpos > width-size || xpos < 0) {
   xdirection *= -1;}
    if (ypos > height-size || ypos < 0) {
     ydirection *= -1;
     } 
    
   
   image (imgD,xpos, ypos, 200,200); 
   
      if (xpos1 > width-size || xpos1 < 0) {
   xdirection1 *= -1;}
    if (ypos1 > height-size || ypos1 < 0) {
     ydirection1 *= -1;
     } 
   
   
   image (imgE, xpos1, ypos1, 200,200);
   
   
   
     



 }
   tint (255,t);
   image (imgB, 491,255, x+=1, y+=1);
   
    noTint();
   
   image (imgC, mouseX, mouseY, 200, 200);
   
   
   if (mouseX>= 484 & mouseX<=575 & mouseY>=40 & mouseY<=59) { fill(129,12,12);} else {
  fill (255);}
  
   if ((mousePressed) & mouseX>= 484 & mouseX<=575 & mouseY>=40 & mouseY<=59)  {card=1;}
  
  
  
   text ("Return", 484, 59);
   
   
   
   }    else if (card==3) {
      noCursor();
  
    noTint();
     image (imgF, width/2, height/2);
      if(x>=350) {x=105; y=149;}
   
   if((mousePressed) & mouseX>= 424 & mouseX<=550 & mouseY>=169 & mouseY<=342) {
   t=0;}
   
   if (t==0) {
   xpos = xpos + ( xspeed * xdirection );
   ypos = ypos + ( yspeed * ydirection );
   xpos1 = xpos1 + ( xspeed1 * xdirection1 );
   ypos1 = ypos1 + ( yspeed1 * ydirection1 );
   xpos2 = xpos2 + ( xspeed2 * xdirection2 );
   ypos2 = ypos2 + ( yspeed2 * ydirection2 );
   if (xpos > width-size || xpos < 0) {
   xdirection *= -1;}
    if (ypos > height-size || ypos < 0) {
     ydirection *= -1;
     } 
    
   
   image (imgP,xpos, ypos, 200,200); 
   
      if (xpos1 > width-size || xpos1 < 0) {
   xdirection1 *= -1;}
    if (ypos1 > height-size || ypos1 < 0) {
     ydirection1 *= -1;
     } 
   
   
   image (imgQ, xpos1, ypos1, 200,200);
   
   
   
     



 }
   tint (255,t);
   image (imgI, 491,255, x+=1, y+=1);
   
    noTint();
   
   image (imgC, mouseX, mouseY, 200, 200);
   
   
   if (mouseX>= 484 & mouseX<=575 & mouseY>=40 & mouseY<=59) { fill(129,12,12);} else {
  fill (255);}
  
   if ((mousePressed) & mouseX>= 484 & mouseX<=575 & mouseY>=40 & mouseY<=59)  {card=1;}
  
  
  
   text ("Return", 484, 59);
     
     
     
     
     
     
   }    else if (card==4) {
   noCursor();

 noTint();
     image (imgG, width/2, height/2);
      if(x>=350) {x=105; y=149;}
   
   if((mousePressed) & mouseX>= 424 & mouseX<=550 & mouseY>=169 & mouseY<=342) {
   t=0;}
   
   if (t==0) {
   xpos = xpos + ( xspeed * xdirection );
   ypos = ypos + ( yspeed * ydirection );
   xpos1 = xpos1 + ( xspeed1 * xdirection1 );
   ypos1 = ypos1 + ( yspeed1 * ydirection1 );
   xpos2 = xpos2 + ( xspeed2 * xdirection2 );
   ypos2 = ypos2 + ( yspeed2 * ydirection2 );
   if (xpos > width-size || xpos < 0) {
   xdirection *= -1;}
    if (ypos > height-size || ypos < 0) {
     ydirection *= -1;
     } 
    
   
   image (imgL,xpos, ypos, 200,200); 
   
      if (xpos1 > width-size || xpos1 < 0) {
   xdirection1 *= -1;}
    if (ypos1 > height-size || ypos1 < 0) {
     ydirection1 *= -1;
     } 
   
   
   image (imgM, xpos1, ypos1, 200,200);
   
   
   
     



 }
   tint (255,t);
   image (imgJ, 491,255, x+=1, y+=1);
   
    noTint();
   
   image (imgC, mouseX, mouseY, 200, 200);
   
   
   if (mouseX>= 484 & mouseX<=575 & mouseY>=40 & mouseY<=59) { fill(129,12,12);} else {
  fill (255);}
  
   if ((mousePressed) & mouseX>= 484 & mouseX<=575 & mouseY>=40 & mouseY<=59)  {card=1;}
  
  
  
   text ("Return", 484, 59);
     
     
     
   }  else if (card==5) {
     
       noCursor();

 noTint();
     image (imgH, width/2, height/2);
      if(x>=350) {x=105; y=149;}
   
   if((mousePressed) & mouseX>= 45 & mouseX<=160 & mouseY>=169 & mouseY<=342) {
   t=0;}
   
   if (t==0) {
   xpos = xpos + ( xspeed * xdirection );
   ypos = ypos + ( yspeed * ydirection );
   xpos1 = xpos1 + ( xspeed1 * xdirection1 );
   ypos1 = ypos1 + ( yspeed1 * ydirection1 );
   xpos2 = xpos2 + ( xspeed2 * xdirection2 );
   ypos2 = ypos2 + ( yspeed2 * ydirection2 );
   if (xpos > width-size || xpos < 0) {
   xdirection *= -1;}
    if (ypos > height-size || ypos < 0) {
     ydirection *= -1;
     } 
    
   
   image (imgN,xpos, ypos, 200,200); 
   
      if (xpos1 > width-size || xpos1 < 0) {
   xdirection1 *= -1;}
    if (ypos1 > height-size || ypos1 < 0) {
     ydirection1 *= -1;
     } 
   
   
   image (imgO, xpos1, ypos1, 200,200);
   
   
   
     



 }
   tint (255,t);
   image (imgK, 97, 255, x+=1, y+=1);
   
    noTint();
   
   image (imgC, mouseX, mouseY, 200, 200);
   
   
   if (mouseX>= 484 & mouseX<=575 & mouseY>=40 & mouseY<=59) { fill(129,12,12);} else {
  fill (255);}
  
   if ((mousePressed) & mouseX>= 484 & mouseX<=575 & mouseY>=40 & mouseY<=59)  {card=1;}
  
  
  
   text ("Return", 484, 59);

     
   } 
     
}

