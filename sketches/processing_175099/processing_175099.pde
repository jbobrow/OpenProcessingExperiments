



/*
Two of the largest democracies in the world, suffered most, when  terrorists in the name of religion attacked and took away the lives of several hundreds of human beings.
What we witness in the world today is a skewed intrepretation of religion to such an extent that one wonders if anyone has understood its real meaning. 
The situation is going to affect the value systems of millions of children across the globe.
It is time for "God", in whatever form He/She is (be it Krishna, Jesus or Allah) to come in and take charge.

This artwork depicts this theme.

A temple Car "Surya" inspired by the Sun Temple at Konark, India (www.konark.nic.in) emanates in the blue sky (the backdrop).
The temple car contains images of Lord Ganesh (Hindu), Jesus (Christianity) & Allah (Islamic). 

"Surya" emanates brightness and rays of hope for humanity as we move along in life.
The initial click of the mouse and continuous clicking indicate that everything lies in our hands.

It is based on the Generative Design  P_2_0_01.pde  ( Ref: http://www.generative-gestaltung.de).
Music Courtesy: Colonial Cousins (by Hariharan & Leslie).
Image Courtesy: Free Images from Google for Jesus & Allah;
Image of Lord Ganesh: Photo by self at an Indian Temple
 
*/

//Importing audio

import ddf.minim.*;

//Global Variables

color [] palette = {#9DD1FF, #050505, #05E02E, #FFA5E1, #413CF0, #763704, #F5FA03, #E30724, #C668F0, #90FFFE };
float p;
float q;
PImage Ganesh;
PImage Jesus;
PImage Allah;
PImage Nov;
PImage Sep;
PImage Terrorism;
Minim minim;
AudioPlayer krishna;

// The background is set to sky (blue) where "Surya" resides

void setup () { size(800,800);
background(palette[0]); 
Ganesh = loadImage ("IMG_4515.jpg");
Jesus = loadImage ("jesus.jpg");
Allah = loadImage ("allah.jpg");
Nov = loadImage ("26 nov.jpg");
Sep = loadImage ("11 sep.jpg");
Terrorism = loadImage ("terrorism.jpg");
minim = new Minim(this);
krishna = minim.loadFile ("krishna.wav");
krishna.play();
}

//draw

void draw () {

  /* The screen is blank indicating the open sky blue background.
  When we open our eyes (click of the mouse), the grandeur sight of "Surya" in the temple car appears.
  */
  
 if (mousePressed){
   pushMatrix ();
   
  
background(palette[0]);  
p=800.00;
q=800.00;
strokeWeight (1);
stroke (#080808);
noFill();



//construction of the temple car's wheel base 
noFill();
stroke (palette[1]);
strokeWeight (1);
line (100+ p/3.25, q/1.5, p/1.5-100, q/1.5);
line (95+ p/3.25, q/1.6, p/1.5-90, q/1.6);
line (70+ p/3.25, q/1.7, p/1.5-70, q/1.7);
stroke (palette[3]);
strokeWeight (2);
beginShape ();
fill (#9D7575);
vertex (100+ p/3.25,  q/1.5);
vertex (95+ p/3.25, q/1.6);
vertex (70+ p/3.25, q/1.7);
vertex (p/3.25, q/1.775);
vertex (p/1.5, q/1.775);
vertex (p/1.5-70, q/1.7);
vertex (p/1.5-90, q/1.6);
vertex (p/1.5-100, q/1.5);
endShape ();


//construction of the bottom structure 
stroke (palette [int(1)]);
strokeWeight (1);
fill (palette [int(5)]);
quad (p/3.25, q/1.775, p/4.5,q/1.85, p/1.325, q/1.85, p/1.5, q/1.775);
quad (p/4.5,q/1.85, p/4.75, q/1.95, p/1.30, q/1.95, p/1.325, q/1.85);
quad (p/4.75, q/1.95, p/5.0,q/2.05, p/1.275, q/2.05, p/1.30, q/1.95);
noFill();


//construction of the wheels
float r = random (1,6);
stroke (palette[int(r)]);
fill (palette[2]);
ellipse (p/3.25, q/1.5, 210,210);
noFill ();

stroke (palette[int(r)]);
fill (palette[4]);
ellipse (p/3.25, q/1.5, 150,150);
noFill();

stroke (palette[int(r)]);
fill (palette[7]);
ellipse (p/3.25, q/1.5, 100,100);
noFill();

stroke (palette[int(r)]);
fill (palette[3]);
ellipse (p/3.25, q/1.5, 50,50);
noFill();

stroke (palette [int(1)]);
fill (palette [int(1)]);
rect (p/3.25-5,q/1.5-5, 10,10);
rect (p/3.25-2.00, q/1.5-15 , 2.5,30);

stroke (palette[int(r)]);
fill (palette[2]);
ellipse (p/1.5, q/01.5, 210,210);
noFill();

stroke (palette[int(r)]);
fill (palette[4]);
ellipse (p/1.5, q/1.5, 150,150);
noFill();

stroke (palette[int(r)]);
fill (palette[7]);
ellipse (p/1.5, q/1.5, 100,100);
noFill();

stroke (palette[int(r)]);
fill (palette[3]);
ellipse (p/1.5, q/1.5, 50,50);
noFill();

stroke (palette [int(1)]);
fill (palette [int(1)]);
rect (p/1.5-5,q/1.5-5, 10,10);
rect (p/1.5-2.00, q/1.5-15 , 2.5,30);


//Construction of the housing called "mantap"
fill (palette [int(3)]);
rect(p/5.0, q/4.2, 20,200);
noFill();

fill (palette [int(7)]);
rect(p/4.50, q/4.2, 20,200);
noFill();

fill (palette [int(3)]);
rect(p/2.64, q/4.2, 20,200);
noFill();

fill (palette [int(6)]);
rect(p/2.50, q/4.2, 20,200);
rect(p/1.725, q/4.2, 20,200);
noFill();

fill (palette [int(3)]);
rect(p/1.675, q/4.2, 20,200);
noFill();

fill (palette [int(7)]);
rect(p/1.340, q/4.2, 20,200);
noFill();

fill (palette [int(3)]);
rect(p/1.308, q/4.2, 20,200);
noFill();

//Construction of the tower called "gopura"
fill (palette [int(8)]);
quad(p/5-35,q/4.2-30, p/1.308+60,q/4.2-30, p/1.34+60,q/4.2, p/5-20,q/4.2);
float a;
a=400;
fill (palette [int (4)]);
ellipse (a,210, 40,40);
fill (palette [int (2)]);
ellipse (a+40,210, 40,40);
fill (palette [int (3)]);
ellipse (a-40,210, 40,40);
fill (palette [int (8)]);
ellipse (a-140,210, 40,40);
ellipse (a+140,210, 40,40);
fill (#F7BF23);
triangle (400,20,  350,80, 450,80);
arc (450,160, 150,150, 3*PI/2, 2*PI);
arc (350,160, 150,150, PI, 3*PI/2);
rect (350,80, 100, 77);
stroke (#F7BF23);
arc (130,160,100,100, PI, 3*PI/2);
arc (670,160,100,100, 3*PI/2, 2*PI);
stroke (palette[int(r)]);
fill (palette[int(r)]);

//Importing the images

image (Ganesh, 320,220, 170,170);
image (Jesus, 170,220,170,170);
image (Allah, 470,220,150,170);
image (Terrorism, 350,700,100,100);
image (Nov, 0,700,100,100);
image (Sep, 700,700,100,100);


//Surya and its rays of hope

  smooth();
  noFill();
  int circleResolution = (int) map(mouseY, 0,height, 2,80);
  float radius = mouseX+width/5 + 0.5;
  float angle = TWO_PI/circleResolution;
  //strokeWeight(mouseY/100);
  beginShape();
  for (int i=0; i<=circleResolution; i++){
    float x = tan(angle*i) * radius;
    float y = sin(angle*i) * radius;
    //line(400,280, x/2, y/2);
    ellipse (400,280, x, y);
  }
  endShape();

 
textSize(24);
textAlign (CENTER);
text (" Religious Tolerance - The only Ray of Hope for Humanity", 400,675);

popMatrix();
 }


}





