
size(550,500);
background(40);
smooth();
int i= 0;

rectMode (CORNER);
strokeWeight(10);
stroke (40);
fill (200);
rect(0,(height/2)+100,width,150);



translate(height/2,(width/2)-100);

noStroke ();
fill (255);
rect(-5,55,3,130);

stroke (255);
strokeWeight(5);
fill (200,200,10);
ellipse (0,0,30,30);

for (i=0; i<50; i++) {

rotate (TWO_PI/50);
stroke (255);
strokeWeight(1);
fill (255);
ellipse (45,0,50,3);
}

for (i=0; i<25; i++) {

rotate (TWO_PI/25);
noStroke ();
strokeWeight(1);
fill (255,255,255,80);
ellipse (80,0,80,8);
}

for (i=0; i<5; i++) {

rotate (TWO_PI/5);
noStroke ();
strokeWeight(1);
fill (255,0,0);
ellipse (90,0,110,3);
}



