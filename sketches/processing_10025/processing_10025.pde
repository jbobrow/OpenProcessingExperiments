
int card =0;
//int card =1;
//int card =2;
//int card =3;
//int card =4;
//int card =5;
//int card =6;
//int card =7;
//int card =8;
//int card =9;
//int card =10;
//int card =11;
//int card =12;
//int card =13;
//int card =14;
//int card =15;
//int card =16;
//int card =17;
//int card =18;
//int card =19;
//int card =20;
//int card =21;
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
PImage imgV;
PImage imgW;
PImage imgX;
PImage imgY;
PImage imgZ;
PImage imgAA;
PImage imgBB;
PImage imgCC;
PImage imgDD;
PImage imgEE;
PImage imgFF;
PImage imgGG;
PImage imgHH;
PImage imgII;
PImage imgJJ;
PImage imgKK;
PImage imgLL;
PImage imgMM;
PImage imgNN;
PImage imgOO;
PImage imgPP;
PImage imgQQ;

PFont snell ;
float x;
float y;
float a =0 ; 
float adirection;
float a1 =180 ; 
float a1direction;
float r;
float vx;
float vy;

float vx1;
float vy1;
float x1;
float y1;
float vx2;
float vy2;
float x2;
float y2;
float vx3;
float vy3;
float x3;
float y3;
float m=360;
float m1 = 240;
int mdirection = -1;
int h=240;
int w=320;
int w2 = 66 ;
int w3 = 40;
int t=1;
int e=-50;
int f=530;

void setup () {
  size (640, 480);
  smooth ();
   
  img= loadImage ("card5.png");
  imgA= loadImage ("card5.1.png");
  imgB= loadImage ("card5.4.png");
  imgC= loadImage ("crad5.6.png");
  imgD= loadImage ("Untitled-5.png");
  imgE= loadImage ("card5.twizz.png");
  imgF= loadImage ("card6.png");
  imgG= loadImage ("card6.3 copy.png");
  imgH= loadImage ("card6.4 copy.png");
  imgI= loadImage ("card6.2.png");
//  imgJ= loadImage ("pussnboots.png");
    imgK= loadImage ("card1.png");
  imgL= loadImage ("card1.2.png");
  imgM = loadImage("card2 copy.png");
  imgN= loadImage ("card2.1.png");
  imgO = loadImage ("Untitled-3.png");
  imgP = loadImage ("card2.3.png");
  imgQ = loadImage ("windmill.png");
  imgR = loadImage ("card3.3.png");
  imgS=  loadImage ("card3.png");
   imgT=  loadImage ("card4.png");
    imgU=  loadImage ("card4.1.png");
     imgV=  loadImage ("card4.4.png");
      imgW=  loadImage ("card4.5.png");
      imgX = loadImage ("card8.1.jpg");
        imgY = loadImage ("card9.png");
         imgZ = loadImage ("card10.png");
         imgAA= loadImage ("10.1.png");
         imgBB= loadImage ("card7.png");
         imgCC= loadImage ("card11.1.png");
         imgDD= loadImage ("card12.png");
         imgEE= loadImage ("card11.1.png");
         imgFF= loadImage ("card11.1.png");
         imgGG= loadImage ("card12.2.png");
           imgHH= loadImage ("card12.3.png");
             imgII= loadImage ("card13.png");
               imgJJ= loadImage ("card14.1.png");
                 imgKK= loadImage ("card14.png");
                   imgLL= loadImage ("card15.png");
                     imgMM= loadImage ("card4.4.png");
                     imgNN= loadImage ("card4.3.png");

 
  snell= loadFont ("LucidaBlackletter-24.vlw");
  textFont (snell);
  imageMode (CENTER);
 
  
  vx= random(-5, 5);
  vy=random (-5, 5);
  vx1= random(-5, 5);
  vy1=random (-5, 5);
  vx2= random(-5, 5);
  vy2=random (-5, 5);
  vx3= random(-5, 5);
  vy3=random (-5, 5);
  
}



void draw () {
  background (255);
  fill (0);
  if (card==0) {
   

  image (imgK, width/2, height/2);
  image (imgL, w, h);
  text ("You, a lowly cat have been inhereted by you master's son. If you fail to use your wit from this point forth will surely become lunch", 12, 50, 600, 400);
  if (mouseX>= 395 & mouseX<=490 & mouseY>=170 & mouseY<=200) { fill(255,0,0);} else {
  fill (5);}
  text ("START", 395, 187);
  if ((mousePressed) & mouseX>= 395 & mouseX<=490 & mouseY>=170 & mouseY<=200)  { w+=30;} 
  if (w>=900) {card=1;}
  
} else if (card==1) {
     background (255);
  w=321;
  image (imgM, width/2, height/2);
  pushMatrix();
  translate (25, 229);
  rotate (radians(frameCount));
  image (imgQ, 0, 0);
  popMatrix ();
  image (imgP, width/2, height/2);
   image (imgN, w2, 366);
 

  text ("Your new master wants to eat you, Make a decision!", 10,15, 200, 200);
  if (mouseX>= 10 & mouseX<=210 & mouseY>=130 & mouseY<=150) { fill(255,0,0);} else {
  fill (5);}
  text ("ASK FOR BOOTS", 10, 150);
  if (mouseX>= 410 & mouseX<=530 & mouseY>=130 & mouseY<=145) { fill(255,0,0);} else {
  fill (5);}
  text ("BE CUTE", 410, 145); 
  if ((mousePressed) & mouseX>= 10 & mouseX<=210 & mouseY>=130 & mouseY<=150) { w2+=5;} 
  if (w2>=240) { card=2;}
  if ((mousePressed) & mouseX>= 410 & mouseX<=530 & mouseY>=130 & mouseY<=145) { card=5;}
 
 
  } else if (card==2) {
  w2 =66;
    image(imgS, width/2, height/2);
   image(imgR, w3, 380);
   
    text("Your new boots have enabled you to hunt rabbits with ease.", 0, 10, 380, 400);
   if (mouseX>= 365 & mouseX<=485 & mouseY>=30 & mouseY<=90) { fill(255,0,0);} else {
  fill (5);}
    text("TAKE TO KING",365, 30, 150,150 );
    if (mouseX>= 133 & mouseX<=275 & mouseY>=82 & mouseY<=103) { fill(255,0,0);} else {
  fill (5);}
    if ((mousePressed) & mouseX>= 365 & mouseX<=485 & mouseY>=30 & mouseY<=90) { w3+=2;}
    text("EAT THEM", 133,100);
     if ((mousePressed) & mouseX>= 133 & mouseX<=275 & mouseY>=82 & mouseY<=103) { w3-=2;}
    if (w3>=240) { card=3;}
    if (w3<=-30) {card = 5;}
    
  
    } else if (card==3) {
     
     w3= 41;
      image (imgT, width/2, height/2);
       pushMatrix();
  translate (465, 240);
  rotate (radians(frameCount));
  image (imgNN,0, 0);
  popMatrix();
       pushMatrix();
  translate (519, 234);
  rotate (radians(frameCount));
  image (imgMM,0, 0);
  popMatrix();  

      
    
      image (imgU, 420, m);
      if (m>=350) { mdirection=-1;} else if (m<=340) { mdirection=1;}
      image (imgW, width/2, height/2);
      text ("To take advantage of your new relationship with the king, you convince your master to pretend like he is drowning. The king is approaching.", 313, 10, 325,300);
       if (mouseX>= 537 & mouseX<=620 & mouseY>=175 & mouseY<=195) { fill(255,0,0);} else {
  fill (5);}
       text ("ALERT" , 537, 195);
       if (mouseX>= 252 & mouseX<=340 & mouseY>=175 & mouseY<=195) { fill(255,0,0);} else {
  fill (5);}
       text ("IGNORE", 252, 195); 
         if ((mousePressed) & mouseX>= 252 & mouseX<=340 & mouseY>=175 & mouseY<=195) { m++;} 
       else { m+= mdirection *.2;}
       if (m>=500) {card=17;}
        if ((mousePressed) & mouseX>= 537 & mouseX<=620 & mouseY>=175 & mouseY<=195) {card=4;}


      
  
  
  } else if (card==4) {
     
      
           image (imgF, width/2, height/2);
  image (imgI, width/2, height/2);
 
  imageMode (CORNER);
 
 a+= (adirection *.3);
 
  pushMatrix ();

  translate (144, 182);
 a= constrain (a, 0, 60);
  rotate (radians(a+=adirection*.3));
   image (imgG, 116-144, 172-182);
   if (a<=0) { adirection=1;} else if (a>=60) { adirection=-1;}
  popMatrix();
   
     pushMatrix ();

  translate (317, 200);
 a1= constrain (a1, 270, 360);
  rotate (radians(a1+=adirection*.05));
   image (imgH, 283-317, 185-200);
   
   if (a1<=0) { adirection=1;} else if (a1>=90) { a1direction=-1;}
   popMatrix();
   
   imageMode (CENTER); 
   image (imgI, width/2, height/2);
   fill(0);
   scale(.75);
   text("The king has introduced your wet master to his smokin' daughter. If you alert the workers in the upcoming field , they will help your masters 'chances'", 0, 5, 640, 200);
   if (mouseX>= 272 & mouseX<=335 & mouseY>=61 & mouseY<=76) { fill(255,0,0);} else {
  fill (5);}
   text ("ALERT", 355, 95);
   if (mouseX>= 365 & mouseX<=428 & mouseY>=61 & mouseY<=76) { fill(255,0,0);} else {
  fill (5);}
   text ("LEAVE", 480, 95);
    if ((mousePressed) & mouseX>= 272 & mouseX<=335 & mouseY>=61 & mouseY<=76) { card=6;}
  
  if ((mousePressed) & mouseX>= 365 & mouseX<=428 & mouseY>=61 & mouseY<=76) { card=16;}
   
 
 } else if (card==5){ 
   image (imgJJ, width/2, height/2);
   text ("Your Master Has No Use for you. You've been eaten", 10, 8, 600, 200);
    if ( mouseX>= 542 & mouseX<=630 & mouseY>=430 & mouseY<=455) {  fill(255,0,0);} else {
  fill (5);}
   text ("RETRY",  542, 454);
  
 if ((mousePressed) & mouseX>= 542 & mouseX<=630 & mouseY>=430 & mouseY<=455) { card=0;}
    
   
   w3=41;
       x+= vx;
  y+= vy;
   x1+= vx1;
  y1+= vy1;
   x2+= vx2;
  y2+= vy2;
   x3+= vx3;
  y3+= vy3;
  
  
  pushMatrix();
  translate(x, y);
  rotate(radians(frameCount));
  scale (.5);
  image (imgA, 0, 0);
  popMatrix();
  
   pushMatrix();
  translate(x1, y1);
  rotate(radians(frameCount));
  scale (.5);
  image (imgB, 0, 0);
  popMatrix();
  
    pushMatrix();
  translate(x2, y2);
  rotate(radians(frameCount));
 scale (.5);
  image (imgC, 0, 0);
  popMatrix();
  
   pushMatrix();
  translate(x3, y3);
  rotate(radians(frameCount));
  scale (.5);
  image (imgD, 0, 0);
  popMatrix();



 
  
  if (x>width || x< 0 || y>height || y< 0) {
    x= random (0,width);
    y= random (0,height);
     vx= random(-5, 5);
  vy=random (-5, 5);
    
  }
  
   if (x1>width || x1< 0 || y1>height || y1< 0) {
    x1= random (0,width);
    y1= random (0,height);
     vx1= random(-5, 5);
  vy1=random (-5, 5);
    
  }
  
   if (x2>width || x2< 0 || y2>height || y2< 0) {
    x2= random (0,width);
    y2= random (0,height);
     vx2= random(-5, 5);
  vy2 =random (-5, 5);
    
  }
  
   if (x3>width || x3< 0 || y3>height || y3< 0) {
    x3= random (0,width);
    y3= random (0,height);
     vx3= random(-5, 5);
  vy3=random (-5, 5);
  
    
  }
    
image (img, width/2, height/2);

m1+= (mdirection *.25);

image (imgE, 320, m1);

if (m1>=255) { mdirection=-1;} else if (m1<=240) { mdirection=1;}

if ((mousePressed) & mouseX<=10) {card=0;}
   
      
  
  
  } else if (card==6) {
    image (imgX, width/2, height/2);
    text ("The king is impressed with your master's wealth. You continue to make the field workers tell the king the land belongs to your master. The princess blushes.", 2, 2, 640, 200);
    if (mouseX>= 240 & mouseX<=355 & mouseY>=370 & mouseY<=390) { fill(255,0,0);} else {
  fill (5);}
    text("CONTINUE", 240, 382);
    
    if ((mousePressed) & mouseX>= 240 & mouseX<=355 & mouseY>=365 & mouseY<=390) { card=7;}
  
    

    
  
    } else if (card==7) {
      image (imgY, width/2, height/2);
      text ("The king continues to be impressed with your master's riches. If you could somehow prove that the upcoming castle belongs to him, the princess will surely be his bride. However, you know that an ogre lives inside. Beware..", 5,5,640, 300);
      if (mouseX>= 200 & mouseX<=400 & mouseY>=173 & mouseY<=205) { fill(255,0,0);} else {
  fill (5);}
      text ("ENTER CASTLE", 200, 200);
      if (mouseX>= 200 & mouseX<=400 & mouseY>=228 & mouseY<=258) { fill(255,0,0);} else {
  fill (5);}
      text ("KEEP RIDING", 200, 250);
         if ((mousePressed) &mouseX>= 200 & mouseX<=400 & mouseY>=173 & mouseY<=205) { card=8;}
     if ((mousePressed) & mouseX>= 200 & mouseX<=400 & mouseY>=228 & mouseY<=258) { card=17;} 
  
      
  } else if (card==8) {
    image (imgZ, width/2, height/2);
   
  
    image (imgAA, width/2, height/2);
    text ("You discover that the baby-eating ogre can shapeshift.", 5, 5, 500, 200);
    if (mouseX>= 139 & mouseX<=260 & mouseY>=38 & mouseY<=65) { fill(255,0,0);} else {
  fill (5);}
    text ("Make Lion",139, 67);
   if (mouseX>= 139 & mouseX<=260 & mouseY>=90 & mouseY<=105) { fill(255,0,0);} else {
  fill (5);}
    text ("Run Away", 139, 107);
    if ((mousePressed) & mouseX>= 139 & mouseX<=220 & mouseY>=90 & mouseY<=105) {card=13;}
     if ((mousePressed) & mouseX>= 139 & mouseX<=260 & mouseY>=38 & mouseY<=65)  {card = 9;}
    
    
    
    
  
    } else if (card==9) {
     image (imgBB, width/2, height/2);
     image (imgCC, m1, height/2);
     text ("Roar!, the ogre has turned into a scary lion.",10, 30);
       if (mouseX>= 270 & mouseX<=380 & mouseY>=50 & mouseY<=70) { fill(255,0,0);} else {
  fill (5);}
     text ("Run Away", 270, 60);
   if (mouseX>= 400 & mouseX<=560 & mouseY>=50 & mouseY<=70) { fill(255,0,0);} else {
  fill (5);}
     text ("Make Mouse", 400, 60);
       if ((mousePressed) & mouseX>= 270 & mouseX<=380 & mouseY>=50 & mouseY<=70) { m1+=50;}
      if ((mousePressed) & mouseX>= 400 & mouseX<=560 & mouseY>=50 & mouseY<=70) { card=11;} 
      if (m1>=300) {card=14;}
  
    } else if (card==11) {
      m1= 240;
      image (imgDD, width/2, height/2);
      image (imgGG, width/2, e);
      image (imgHH, width/2, f);
      text ("Smart move, the ogre is now a mouse", 10, 30);
     if (mouseX>= 10 & mouseX<=70 & mouseY>=60 & mouseY<=85) { fill(255,0,0);} else {
  fill (5);}
      text ("EAT",10, 70);
       if (mouseX>= 100 & mouseX<=185 & mouseY>=60 & mouseY<=85) { fill(255,0,0);} else {
  fill (5);}
      text ("LEAVE", 100, 70);
      if ((mousePressed) & mouseX>= 10 & mouseX<=70 & mouseY>=60 & mouseY<=85) {
      f-=5;
    e+=5;}
    
    if (e>=220) { card=12;}
     if ((mousePressed) &mouseX>= 100 & mouseX<=185 & mouseY>=60 & mouseY<=85) {card=13;}
  
  
  } else if (card==12) {
    image (imgII, width/2, height/2);
    e=-30;
   scale (.75);
    text ("Congrats!! you are a loyal kitty. Your master is meow a prince", 10, 2, 480, 300);
  
    } else if (card==13) {
  image (imgJJ, width/2, height/2);
  
  
    w3=41;
       x+= vx;
  y+= vy;
   x1+= vx1;
  y1+= vy1;
   x2+= vx2;
  y2+= vy2;
   x3+= vx3;
  y3+= vy3;
  
  
  pushMatrix();
  translate(x, y);
  rotate(radians(frameCount));
  scale (.5);
  image (imgA, 0, 0);
  popMatrix();
  
   pushMatrix();
  translate(x1, y1);
  rotate(radians(frameCount));
  scale (.5);
  image (imgB, 0, 0);
  popMatrix();
  
    pushMatrix();
  translate(x2, y2);
  rotate(radians(frameCount));
 scale (.5);
  image (imgC, 0, 0);
  popMatrix();
  
   pushMatrix();
  translate(x3, y3);
  rotate(radians(frameCount));
  scale (.5);
  image (imgD, 0, 0);
  popMatrix();



 
  
  if (x>width || x< 0 || y>height || y< 0) {
    x= random (0,width);
    y= random (0,height);
     vx= random(-5, 5);
  vy=random (-5, 5);
    
  }
  
   if (x1>width || x1< 0 || y1>height || y1< 0) {
    x1= random (0,width);
    y1= random (0,height);
     vx1= random(-5, 5);
  vy1=random (-5, 5);
    
  }
  
   if (x2>width || x2< 0 || y2>height || y2< 0) {
    x2= random (0,width);
    y2= random (0,height);
     vx2= random(-5, 5);
  vy2 =random (-5, 5);
    
  }
  
   if (x3>width || x3< 0 || y3>height || y3< 0) {
    x3= random (0,width);
    y3= random (0,height);
     vx3= random(-5, 5);
  vy3=random (-5, 5);
  
    
  }
  
  image (imgKK, width/2, height/2);
  text ("In Russia, ogre eats YOU!!!!!", 441, 108, 200,200);
     if ( mouseX>= 542 & mouseX<=630 & mouseY>=430 & mouseY<=455) {  fill(255,0,0);} else {
  fill (5);}
   text ("RETRY",  542, 454);
  
 if ((mousePressed) & mouseX>= 542 & mouseX<=630 & mouseY>=430 & mouseY<=455) { card=0;}
    


if ((mousePressed) & mouseX<=10) {card=0;}
  
  } else if (card==14) {
    m1=240;
    image (imgLL, width/2, height/2);
    scale (.65);
    text ("In a crazy turn of events, the king and master impatiently entered the castle, only to be eaten by the ogre. Your clever self ran away and snagged the princess. You're hitched meow",25, 2, 680, 300);
   scale (1);
      if ( mouseX>= 542 & mouseX<=630 & mouseY>=430 & mouseY<=455) {  fill(255,0,0);} else {
  fill (5);}
   text ("RETRY",  542, 454);
  
 if ((mousePressed) & mouseX>= 542 & mouseX<=630 & mouseY>=430 & mouseY<=455) { card=0;}
    } else if (card==15) {
  
  
  } else if  (card==16) {
     image (imgJJ, width/2, height/2);
    text ("Your master is a fraud and will now eat your cat parts", 10, 25);
   text ("RETRY",  542, 454);
  if ( mouseX>= 542 & mouseX<=630 & mouseY>=430 & mouseY<=455) {  fill(255,0,0);} else {
  fill (5);}
 if ((mousePressed) & mouseX>= 542 & mouseX<=630 & mouseY>=430 & mouseY<=455) { card=0;}
    
  
  
    w3=41;
       x+= vx;
  y+= vy;
   x1+= vx1;
  y1+= vy1;
   x2+= vx2;
  y2+= vy2;
   x3+= vx3;
  y3+= vy3;
  
  
  pushMatrix();
  translate(x, y);
  rotate(radians(frameCount));
  scale (.5);
  image (imgA, 0, 0);
  popMatrix();
  
   pushMatrix();
  translate(x1, y1);
  rotate(radians(frameCount));
  scale (.5);
  image (imgB, 0, 0);
  popMatrix();
  
    pushMatrix();
  translate(x2, y2);
  rotate(radians(frameCount));
 scale (.5);
  image (imgC, 0, 0);
  popMatrix();
  
   pushMatrix();
  translate(x3, y3);
  rotate(radians(frameCount));
  scale (.5);
  image (imgD, 0, 0);
  popMatrix();



 
  
  if (x>width || x< 0 || y>height || y< 0) {
    x= random (0,width);
    y= random (0,height);
     vx= random(-5, 5);
  vy=random (-5, 5);
    
  }
  
   if (x1>width || x1< 0 || y1>height || y1< 0) {
    x1= random (0,width);
    y1= random (0,height);
     vx1= random(-5, 5);
  vy1=random (-5, 5);
    
  }
  
   if (x2>width || x2< 0 || y2>height || y2< 0) {
    x2= random (0,width);
    y2= random (0,height);
     vx2= random(-5, 5);
  vy2 =random (-5, 5);
    
  }
  
   if (x3>width || x3< 0 || y3>height || y3< 0) {
    x3= random (0,width);
    y3= random (0,height);
     vx3= random(-5, 5);
  vy3=random (-5, 5);
  
  image (img, width/2, height/2);

m1+= (mdirection *.25);

image (imgE, 320, m1);

if (m1>=255) { mdirection=-1;} else if (m1<=240) { mdirection=1;}
  
    
  }
  
  
  
  
    } else if (card==17) {
      
      m=360 ;
      image (imgJJ, width/2, height/2);
    text ("You've ruined your master's chances with the princess. Great Job, you're dead", 10, 25, 600, 200);
   if ( mouseX>= 542 & mouseX<=630 & mouseY>=430 & mouseY<=455) {  fill(255,0,0);} else {
  fill (5);}
   text ("RETRY",  542, 454);
  
 if ((mousePressed) & mouseX>= 542 & mouseX<=630 & mouseY>=430 & mouseY<=455) { card=0;}
    
  
  
    w3=41;
       x+= vx;
  y+= vy;
   x1+= vx1;
  y1+= vy1;
   x2+= vx2;
  y2+= vy2;
   x3+= vx3;
  y3+= vy3;
  
  
  pushMatrix();
  translate(x, y);
  rotate(radians(frameCount));
  scale (.5);
  image (imgA, 0, 0);
  popMatrix();
  
   pushMatrix();
  translate(x1, y1);
  rotate(radians(frameCount));
  scale (.5);
  image (imgB, 0, 0);
  popMatrix();
  
    pushMatrix();
  translate(x2, y2);
  rotate(radians(frameCount));
 scale (.5);
  image (imgC, 0, 0);
  popMatrix();
  
   pushMatrix();
  translate(x3, y3);
  rotate(radians(frameCount));
  scale (.5);
  image (imgD, 0, 0);
  popMatrix();



 
  
  if (x>width || x< 0 || y>height || y< 0) {
    x= random (0,width);
    y= random (0,height);
     vx= random(-5, 5);
  vy=random (-5, 5);
    
  }
  
   if (x1>width || x1< 0 || y1>height || y1< 0) {
    x1= random (0,width);
    y1= random (0,height);
     vx1= random(-5, 5);
  vy1=random (-5, 5);
    
  }
  
   if (x2>width || x2< 0 || y2>height || y2< 0) {
    x2= random (0,width);
    y2= random (0,height);
     vx2= random(-5, 5);
  vy2 =random (-5, 5);
    
  }
  
   if (x3>width || x3< 0 || y3>height || y3< 0) {
    x3= random (0,width);
    y3= random (0,height);
     vx3= random(-5, 5);
  vy3=random (-5, 5);
  
  image (img, width/2, height/2);

m1+= (mdirection *.25);

image (imgE, 320, m1);

if (m1>=255) { mdirection=-1;} else if (m1<=240) { mdirection=1;}
  
  
  
  } else if (card==18) {
  
      } else if (card==19) {
  
  
  } else if (card==20) {
  
      } else if (card==21) {
  
  
  } else if (card==22) {
  
  }
  
 
 
  }
  
  

}


