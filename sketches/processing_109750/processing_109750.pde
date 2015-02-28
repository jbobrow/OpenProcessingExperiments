
// HW #1
// Written by Mark Choi
// Andrew ID: mschoi
// © Mark Choi September 2013 Pittsburgh, Pa 15213  All Rights reserved
size( 400, 400 );
background( 24, 72, 100);
noFill();
int radius = 50;
int initialX = 100;
int initialY = 175;

//circle background
for (int i = 0; i < (width/radius); i++)
for (int j = 0; j < (height/radius); j++)
  {  //stroke( random(100+i*10+j*10), random(100+i*10+j*10), random(100+i*10+j*10));
     //stroke( (175+i*5+j*5), (175+i*5+j*5), (100+i*5+j*5));
     //stroke( 230, 230, 120);
     stroke( (230+i+j), (230+i+j), (120+i+j));
     stroke( 30, 195+random(60), 115+random(60), 90);
     //stroke( random(255), random(255), random(255), 80);

     ellipse(radius*i+radius/2, radius/2+radius*j, radius, radius);
  }

stroke( 255, 99, 71);
int k=0;

//m
strokeWeight(4);
arc(initialX-radius/2, initialY, radius, radius, PI+HALF_PI, TWO_PI);
arc(initialX+0.5*radius, initialY, radius, radius, PI, TWO_PI);
arc(initialX+1.5*radius, initialY, radius, radius, PI, TWO_PI);
line(initialX, initialY, initialX, initialY+radius/2);
line(initialX+radius, initialY, initialX+radius, initialY+radius/2);
line(initialX+2*radius, initialY, initialX+2*radius, initialY+radius/2);
//s
strokeWeight(2);
arc(initialX+2.5*radius, initialY, radius, radius, HALF_PI, PI+HALF_PI+QUARTER_PI);
arc(initialX+2.5*radius, initialY+radius, radius, radius, PI+HALF_PI, TWO_PI+HALF_PI+QUARTER_PI);
//c
strokeWeight(4);
arc(initialX+3.5*radius, initialY+radius, radius, radius, QUARTER_PI, HALF_PI+QUARTER_PI+PI);

//saveFrame(“hw1.jpg”);
