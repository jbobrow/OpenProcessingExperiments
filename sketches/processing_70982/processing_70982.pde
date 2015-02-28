
/*****************************************
 * Assignment 02
 * Name:         Xinyin Huang
 * E-mail:       xhuang01@brynmawr.edu
 * Course:       CS 110 - Section 01
 * Submitted:    9/18/2012
 * 
 * The theme of this assignment is love. At first, when you click on the screen, images of heart will apear randomly.
   Then, when you type 'l', 'o', 'v', 'e', they will appear on the screen and once you type again, it changes color. 
   Whenver you type 'c' which means clear, the background changes to a stable background which is my personal experience in Bryn Mawr. 
***********************************************/

boolean lDrawn = false;
boolean oDrawn = false;
boolean vDrawn = false;
boolean eDrawn = false;
boolean trueLoveExists = true;

void setup () {
  size (700, 700);
  smooth ();
  background (0);
  strokeCap (ROUND);
}

void draw () {}

void mousePressed () {
  
 //click mouse and heart appears
 PImage l;
 l= loadImage ("love.jpg"); 
 
 while (trueLoveExists = true) {
  background (0);
  image (l, 50+random (0, 600), 50+random (0, 600), 50, 50);
  image (l, 50+random (0, 600), 50+random (0, 600), 100, 100);
  image (l, 50+random (0, 600), 50+random (0, 600), 70, 70);
  image (l, 50+random (0, 600), 50+random (0, 600), 130, 130);
  image (l, 50+random (0, 600), 50+random (0, 600), 150, 150);
  image (l, 50+random (0, 600), 50+random (0, 600), 30, 30);
  image (l, 50+random (0, 600), 50+random (0, 600), 100, 100);
  image (l, 50+random (0, 600), 50+random (0, 600), 170, 170);
  break;
 }
}

void keyPressed () {
  
  //"LOVE" changes color
  switch (key) 
 {
  case 'l':
    int x=0; 
    while (x<444) {
      fill (random (255), random (255), random (255));
      x=x+1;
    } 
    beginShape ();
    vertex (80, 180);
    vertex (120, 180);
    vertex (110, 360);
    vertex (220, 370); 
    vertex (220, 400);
    vertex (70, 410);
    endShape (CLOSE);
    lDrawn = true;
    break;
   
  case 'o':
   int y=0; 
   while (y<444) {
     fill (random (255), random (255), random (255));
     y=y+1;
   }
  ellipse (260, 290, 120, 230);
  fill (0);
  ellipse (260, 290, 60, 130);
  oDrawn = true; 
  break;
  
  case 'v':
  int z=0; 
  while (z<444) {
     fill (random (255), random (255), random (255));
     z=z+1;
   }
  beginShape ();
  vertex (325, 200);
  vertex (355, 200); 
  vertex (395, 340);
  vertex (435, 200);
  vertex (465, 200);
  vertex (410, 400);
  vertex (380, 400);
  endShape (CLOSE);
  vDrawn = true; 
  break;
  
  case 'e':
  int a=0; 
  while (a<444) {
     fill (random (255), random (255), random (255));
     a=a+1;
   }
  beginShape ();
  vertex (475, 200);
  vertex (595, 180);
  vertex (595, 236);
  vertex (505, 236);
  vertex (505, 272);
  vertex (595, 272);
  vertex (595, 308);
  vertex (505, 308);
  vertex (505, 354);
  vertex (595, 354);
  vertex (595, 400);
  vertex (475, 400);
  endShape (CLOSE);
  eDrawn = true; 
  break;
  
  case 'c':
  
  //"c" changes to the duck pond
  while (lDrawn ==true && oDrawn ==true && vDrawn ==true && eDrawn ==true) {
  
  //sky and grass
  fill (135, 206, 250);
  rect (0, 0, 700, 250);
  fill (173, 255, 47);
  rect (0, 250, 700, 700);
              
 //blacket
  fill (255, 20, 147);
  rect (100, 350, 400, 300);
  
  //head and body
  fill (0);
  ellipse (230, 380, 100, 100);
  ellipse (360, 380, 100, 100);
  rect (225, 430, 10, 100);
  rect (355, 430, 10, 100);
  
  //left right hand
  beginShape ();
  vertex (230, 450);
  vertex (300, 500);
  vertex (295, 510);
  vertex (235, 470);
  endShape (CLOSE);
  
  //left left hand 
  beginShape ();
  vertex (230, 450);
  vertex (160, 500);
  vertex (165, 510);
  vertex (235, 460);
  endShape (CLOSE);
  
  //right right hand
  beginShape ();
  vertex (360, 450);
  vertex (430, 500);
  vertex (425, 510);
  vertex (365, 470);
  endShape (CLOSE);
  
  //right left hand
  beginShape ();
  vertex (360, 450);
  vertex (290, 500);
  vertex (290, 510);
  vertex (365, 465);
  endShape (CLOSE);
  
  //left left leg
  beginShape ();
  vertex (225, 530);
  vertex (235, 535);
  vertex (155, 600);
  vertex (150, 595);
  endShape (CLOSE);
  
  //right left leg
  beginShape ();
  vertex (355, 530);
  vertex (370, 535);
  vertex (295, 600);
  vertex (290, 595);
  endShape (CLOSE);
  
  //left right leg
  beginShape ();
  vertex (225, 530);
  vertex (240, 530);
  vertex (295, 600);
  vertex (290, 605);
  endShape (CLOSE);
 
  //right right leg
  beginShape ();
  vertex (355, 530);
  vertex (370, 530);
  vertex (425, 600);
  vertex (420, 605);
  endShape (CLOSE); 
    
 //pond 
  fill (0, 0, 255);
  ellipse (560, 280, 250, 120);
  
 //duck
  int b=100;
  int c=75;
  int d=125;
  int e=130;
  int f=140;
  int g=145;
  int h=160; 
  
  while (b<width && c<width && d<width && e<width && g<width &&
         f<width && h<width)  {
    //body
    fill (255, 255, 0);
    ellipse (b, 250, 100, 50);
    fill (0);
    ellipse (b, 250, 50, 25);
    
    //feet
    fill (139, 69, 19);
    ellipse (c, 275, 10, 20);
    ellipse (d, 275, 10, 20);
    
    //neck
    fill (255, 255, 0);
    ellipse (e, 225, 15, 30);
    
    //head
    fill (255, 255, 0);
    ellipse (f, 205, 45, 30);
    
    //eye
    fill (0);
    ellipse (g, 200, 10, 10);
    
    //mouth
    fill (0);
    ellipse (h, 210, 20, 10);
    
    b=b+200;
    c=c+200;
    d=d+200; 
    e=e+200;
    f=f+200;
    g=g+200;
    h=h+200;
   } 
   break;  
  }
 } 
}




