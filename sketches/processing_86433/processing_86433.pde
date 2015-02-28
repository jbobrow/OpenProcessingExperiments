
/* Homework 2:: 60-257
Copyright Lila Fagen
Lila.Fagen@gmail.com (ldf) */

size (400, 400);
background (220);
smooth ( );

float x, y, wd, ht;
x= 200;
y= 200;
wd= 200;
ht= 200;

//hands
fill (190, 165, 105);
noStroke ( );
ellipse (x - (.23 * wd), y + (.8 * ht), (.1 * wd), (.1 * ht));
ellipse (x + (.23 * wd), y + (.8 * ht), (.1 * wd), (.1 * ht));

//body shirt
fill (15, 110, 180);
noStroke ( );
ellipse (x, y + (.5 * ht), (.8 * wd), (.35 * ht));
quad (x - (.4 * wd), y + (.53 * ht), x - (.27 * wd), y + (.8 * ht), x + (.27 * wd), y + (.8 * ht), x + (.4 * wd), y + (.53 * ht));
strokeWeight (1);
stroke (220);
line (x + (.24 * wd), y + (.75 * ht), x + (.27 * wd), y + (.6 * ht));
line (x - (.24 * wd), y + (.75 * ht), x - (.27 * wd), y + (.6 * ht));


//face shape
fill (190, 165, 105);
noStroke ( );
ellipse (x, y, wd, ht);
ellipse (x, y - (.5 * ht), (1.1 * wd), (.5 * ht));
quad (x - (.55 * wd), y - (.5 * ht), x + (.55 * wd), y - (.5 * ht), x + (.5 * wd), y, x - (.5 * wd), y);


//shoes
fill (60, 20, 60);
ellipse (x + (.1 * wd), y + (.9 * ht), (.1 * wd), (.15 * ht));
ellipse (x - (.1 * wd), y + (.9 * ht), (.1 * wd), (.15 * ht));


//body pants
strokeWeight (0);
noStroke ( );
fill (30, 105, 80);
point (x + (.25 * wd), y + (.75 * ht));
point (x + (.15 * wd), y + (.9 * ht));
point (x + (.05 * wd), y + (.9 * ht));
point (x, y + (.85 * ht));
point (x - (.05 * wd), y + (.9 * ht));
point (x - (.15 * wd), y + (.9 * ht));
point (x - (.25 * wd), y + (.75 * ht));
beginShape ( );
vertex (x + (.25 * wd), y + (.75 * ht));
vertex (x + (.15 * wd), y + (.9 * ht));
vertex (x + (.05 * wd), y + (.9 * ht));
vertex (x, y + (.85 * ht));
vertex (x - (.05 * wd), y + (.9 * ht));
vertex (x - (.15 * wd), y + (.9 * ht));
vertex (x - (.25 * wd), y + (.75 * ht));
endShape ( );
strokeWeight (3);
stroke (60, 50, 15);
line (x - (.24 * wd), y + (.75 * ht), x + (.24 * wd), y + (.75 * ht));


/* "L" */
strokeWeight (4);
noFill ( );
stroke (250, 215, 235);
point (x - (.1 * wd), y - (.25 * ht));
point (x - (.1 * wd), y + (.25 * ht));
point (x + (.2 * wd), y + (.25 * ht));
beginShape ( );
vertex (x - (.1 * wd), y - (.25 * ht));
vertex (x - (.1 * wd), y + (.25 * ht));
vertex (x + (.2 * wd), y + (.25 * ht));
endShape ( );



//eyebrows
strokeWeight (3);
noStroke ( );
noFill ( );
//left
point (x - (.7 * wd), y - (.1 * ht));//reference
point (x - (.6 * wd), y - (.4 * ht));
point (x - (.4 * wd), y - (.55 * ht));
point (x - (.2 * wd), y - (.55 * ht));
point (x - (.1 * wd), y - (.53 * ht)); //reference
beginShape ( );
stroke (255);
curveVertex (x - (.7 * wd), y - (.1 * ht));//reference
curveVertex (x - (.6 * wd), y - (.4 * ht));
curveVertex (x - (.4 * wd), y - (.55 * ht));
curveVertex (x - (.2 * wd), y - (.55 * ht));
curveVertex (x - (.1 * wd), y - (.53 * ht)); //reference
endShape ( );
//right
noStroke ( );
point (x + (.7 * wd), y - (.1 * ht));//reference
point (x + (.6 * wd), y - (.4 * ht));
point (x + (.4 * wd), y - (.55 * ht));
point (x + (.2 * wd), y - (.55 * ht));
point (x + (.1 * wd), y - (.53 * ht)); //reference
beginShape ( );
stroke (255);
curveVertex (x + (.7 * wd), y - (.1 * ht));//reference
curveVertex (x + (.6 * wd), y - (.4 * ht));
curveVertex (x + (.4 * wd), y - (.55 * ht));
curveVertex (x + (.2 * wd), y - (.55 * ht));
curveVertex (x + (.1 * wd), y - (.53 * ht)); //reference
endShape ( );

//eyeballs
strokeWeight (10);
stroke (30);
point (x - (.3 * wd), y - (.2 * ht));
point (x + (.3 * wd), y - (.2 * ht));

//*Glasses*//
strokeWeight (5);
stroke (240, 200, 60);
fill (240, 200, 60, 70);
//left lense//
point (x - (.1 * wd), y - (.25 * ht));//reference
point (x - (.1 * wd), y - (.25 * ht));
point (x - (.125 * wd), y - (.4 * ht));
point (x - (.5 * wd), y - (.4 * ht));
point (x - (.58 * wd), y - (.2 * ht));
point (x - (.55 * wd), y);
point (x - (.25 * wd), y - (.05 * ht));
point (x - (.25 * wd), y - (.05 * ht));//reference
beginShape ( );
curveVertex (x - (.1 * wd), y - (.25 * ht));//reference
curveVertex (x - (.1 * wd), y - (.25 * ht));
curveVertex (x - (.125 * wd), y - (.4 * ht));
curveVertex (x - (.5 * wd), y - (.4 * ht));
curveVertex (x - (.58 * wd), y - (.2 * ht));
curveVertex (x - (.55 * wd), y);
curveVertex (x - (.25 * wd), y - (.05 * ht));
curveVertex (x - (.25 * wd), y - (.05 * ht));//reference
endShape ( );
beginShape ( );
vertex (x - (.25 * wd), y - (.05 * ht));
vertex (x - (.1 * wd), y - (.25 * ht));
endShape ( );
//right lense//
point (x + (.1 * wd), y - (.25 * ht));//reference
point (x + (.1 * wd), y - (.25 * ht));
point (x + (.125 * wd), y - (.4 * ht));
point (x + (.5 * wd), y - (.4 * ht));
point (x + (.58 * wd), y - (.2 * ht));
point (x + (.55 * wd), y);
point (x + (.25 * wd), y - (.05 * ht));
point (x + (.25 * wd), y - (.05 * ht));//reference
beginShape ( );
curveVertex (x + (.1 * wd), y - (.25 * ht));//reference
curveVertex (x + (.1 * wd), y - (.25 * ht));
curveVertex (x + (.125 * wd), y - (.4 * ht));
curveVertex (x + (.5 * wd), y - (.4 * ht));
curveVertex (x + (.58 * wd), y - (.2 * ht));
curveVertex (x + (.55 * wd), y);
curveVertex (x + (.25 * wd), y - (.05 * ht));
curveVertex (x + (.25 * wd), y - (.05 * ht));//reference
endShape ( );
beginShape ( );
vertex (x + (.1 * wd), y - (.25 * ht));
vertex (x + (.25 * wd), y - (.05 * ht));
endShape ( );



//moustache
strokeWeight (1);
fill (255, 50);
//fill (30, 165, 165);
//noFill ( );
stroke (255);
point (x - (.3 * wd), y + (.3 * ht));
point (x - (.4 * wd), y + (.4 * ht));
point (x + (.3 * wd), y + (.3 * ht));
point (x + (.4 * wd), y + (.4 * ht));

beginShape ( );
vertex (x - (.3 * wd), y + (.3 * ht));
vertex (x - (.4 * wd), y + (.4 * ht));
vertex (x + (.4 * wd), y + (.4 * ht));
vertex (x + (.3 * wd), y + (.3 * ht));
vertex (x - (.3 * wd), y + (.3 * ht));
endShape ( );

stroke (255, 255, 255, 100);
strokeWeight (1);
line (x + (.3 * wd), y + (.3 * ht), x - (.3 * wd), y + (.3 * ht));
line (x + (.31 * wd), y + (.31 * ht), x - (.31 * wd), y + (.31 * ht));
line (x + (.32 * wd), y + (.32 * ht), x - (.32 * wd), y + (.32 * ht));
line (x + (.33 * wd), y + (.33 * ht), x - (.33 * wd), y + (.33 * ht));
line (x + (.35 * wd), y + (.35 * ht), x - (.35 * wd), y + (.35 * ht));
line (x + (.37 * wd), y + (.37 * ht), x - (.37 * wd), y + (.37 * ht));
line (x + (.4 * wd), y + (.4 * ht), x - (.4 * wd), y + (.4 * ht));

//saveFrame("hw2.jpg");


