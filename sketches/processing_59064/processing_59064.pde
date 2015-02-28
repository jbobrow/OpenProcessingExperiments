
/*
Madeleine Aronson
Scape
April 15
*/

println("hello world");
size (500, 400);

smooth();
//background(#F2DFD2); //sky color PInk
//background(#91CAE0); //sky color blue
background(#97E5CC); //sky color green
noStroke();

//horizon lines 
fill(#BC65B2, 40);
rect(-1,50, 502, 400);//lightpink horizon
fill(#310A2D, 50);
rect(-1,200,502,400); //berry horizon
fill(#DE4C24,50);
rect(-1,180, 502, 250);//orange tint horizon
fill(#832173, 50); //pink foreground 
rect(-1, 300, 502, 400);
rect(-1, 300, 502, 400);
fill(#030100, 140);

rect(-1, 350, 502, 400); //black for
triangle (-10, 350, 150, 310, 300, 350);
triangle (50, 367, 140, 320, 300, 368);
rect(-1, 365, 502, 400); //black for
rect(-1, 390, 502, 400); //black for
rect(-1, 395, 502, 400); //black for

fill(#BFEAF2, 30);
ellipse (100, 30, 400, 150);
ellipse (140, 30, 400, 150);
ellipse (0, 30, 400, 150);

fill(#EFFAB6, 10);
ellipse(120, 200, 450, 200);
fill(#7E6381, 40);
ellipse (120, 200, 450, 100);
ellipse (120, 200, 450, 150);
ellipse (120, 200, 450, 200);
ellipse (120, 200, 450, 50);
ellipse (120, 200, 450, 20);
ellipse (120, 200, 450, 25);

///mountains
fill(#580B4A); 
triangle(385,285, 387, 310, 600, 370); //shading - right dark purp ridge
//back mountain line

fill( #E1CEE5);//right white back partlight
triangle(380,270, 600, 400, 450, 600);
fill( #E1CEE5);
triangle (330, 220, 340, 260, 380, 320); //right top ledge light

fill(#580B4A);
//triangle(380, 270, 400, 282,440, 500); //shade to right side of black mtn

fill(#030100);
triangle(50, 400, 300,300, 400, 400);//leftforemountains
triangle(170, 400, 330, 220, 400, 400); //higher right
triangle(320, 250, 380, 270, 450, 500); //right fill piece jet

//shading
fill(#41044D, 140);
triangle(448, 310, 510, 360, 500, 341);//puple RIGHT ridge top
triangle(470, 323, 380, 270, 384, 285);//purple LEFT ridge top
fill(#41044D, 80);//bottom lighter ridges purple
triangle(448, 310, 470, 370, 500, 341); //r1
triangle (470,370, 500, 341, 520, 420);//r2


stroke(#580B4A);
line(380,270,448, 310); 
line (380, 270, 330, 223);
noStroke();
fill (#580B4A);
triangle(380, 270, 400, 282,440, 500); //shade to right side of black mtn

fill(#E1CEE5);
triangle (330, 225, 340, 260, 380, 270);//top ridge light purp shade
fill(#290523,200);//top mountain point dark shading line
triangle(327, 221, 340, 260, 350, 268);
fill(#580B4A,90);
triangle(327, 219, 340, 260, 360, 268);


