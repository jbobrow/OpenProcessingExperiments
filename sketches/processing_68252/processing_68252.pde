
//Christopher Chan
//ckchan
//(C) Aug 29 2012


size (400,400);
background (#EEEEEE);
smooth ();

fill (#33CCFF,10);
strokeWeight (0);

beginShape ();
vertex (0,0);
vertex (200,400);
vertex (0,400);
endShape ();

rect (200,0,200,267);

beginShape ();
vertex (150,0);
vertex (50,0);
vertex (150,198);
endShape ();

beginShape ();
vertex (400,400);
vertex (400,335);
vertex (218,335);
vertex (250,400);
endShape ();

fill (#AA0000,20);

beginShape ();
vertex (0,200);
vertex (0,400);
vertex (100,400);
vertex (400,100);
vertex (400,0);
vertex (200,0);
endShape ();

strokeWeight (1);

//cross
//line (183,0,183,400);
line (150,0,150,400);
line (200,0,200,400);
line (0,267,400,267);
//line (0,300,400,300);
line (0,335,400,335);

//22.5-degree lines
line (0,0,200,400);
line (0,100,150,400);
line (0,200,100,400);
line (50,0,250,400);
line (100,0,300,400);
line (150,0,350,400);
line (200,0,400,400);
line (250,0,450,400);

//45-degree lines
strokeWeight (2);
line (0,200,200,0);
line (100,400,400,100);

strokeWeight (1);
line (0,250,250,0);
line (50,400,400,50);

//C1-Fill
fill (#220066,40);
strokeWeight (0);
beginShape ();
vertex (0,200);
vertex (100,400);
vertex (200,300);
vertex (183,267);
vertex (116,333);
vertex (50,200);
vertex (117,133);
vertex (100,100);
vertex (0,200);
endShape ();

//K-Fill
fill (#FFBB00,25);
strokeWeight (0);
beginShape ();
vertex (0,0);
vertex (200,400);
vertex (250,400);
vertex (218,335);
vertex (400,335);
vertex (400,267);
vertex (200,267);
vertex (200,0);
vertex (150,0);
vertex (150,203);
vertex (50,0);
endShape ();

translate (134,-133);
//C2-Fill
fill (#220066,40);
strokeWeight (0);
beginShape ();
vertex (0,200);
vertex (100,400);
vertex (200,300);
vertex (183,267);
vertex (116,333);
vertex (50,200);
vertex (117,133);
vertex (100,100);
vertex (0,200);
endShape ();

//saveFrame ("hw1.jpg");

