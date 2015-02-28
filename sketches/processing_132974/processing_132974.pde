

size(800,480);
background (#F29B53);

float headX = 400;
float headY = 400;

//argument: x,y, width height

fill (#B2957E);
ellipse(headX, 200, 200, 200 );


//argument:x1,y1,x2,y2

line( headX-50,200-20, headX-10, 200-20);
line( headX+50,200-20, headX+10, 200-20);
//mouth
line( headX+20,200+50, headX-20, 200+50);




//Left eye
noStroke();
fill (#FFFFFF);
ellipse(headX+40,202,30,30);

//innereyeball_left
noStroke();
fill (#151414);
ellipse(headX+40,202,20,20);



//Right eye
noStroke();
fill (#FFFFFF);
ellipse(headX-40,202,30,30);

//innereyeball_right
noStroke();
fill (#151414);
ellipse(headX-40,202,20,20);

//Hair
fill ( #0A0A0A);
ellipse(headX,120,180,70);

//Beard
fill ( #0A0A0A);
rectMode (CENTER);
rect(headX,290,20,60);







