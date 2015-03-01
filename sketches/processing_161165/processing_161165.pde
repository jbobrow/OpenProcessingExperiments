

size(600,600);
background(#4FD309);
fill(#3E9013);
rect(30,0,20,600);
rect(130,0,20,600);
rect(230,0,20,600);
rect(330,0,20,600);
rect(430,0,20,600);
rect(530,0,20,600);

/* body */
fill(255);
arc(300, 500, 320, 400, PI, TWO_PI);
/*fill(255,255,255);
ellipse(300,450,300,350); */

fill(255);
arc(300, 500, 320, 400, -PI, TWO_PI);


/* ear left */
fill (0, 0, 0);
ellipse(130, 80, 120, 120);

/* ears right */
fill (0, 0, 0);
ellipse(470, 80, 120, 120);



/* head */
fill(255,255,255);
ellipse(300,250,400,400);
/*mouth */
fill(#3E3E3E);
ellipse(300, 390, 80, 80);

/* snack */
fill(#FAEFB6);
triangle(430,475, 358, 320, 286, 600);
triangle(330,375, 358, 320, 286, 600);

/* nose */
fill(0,0,0);
ellipse(300,300,80,60);
/* nose 2 */
fill(0,0,0);
ellipse(300,320,50,60);


/* main black eye*/
fill(0, 0, 0);
ellipse(210,230, 130,130);
ellipse(390,230, 130,130);

/* paws white */
fill(0, 0, 0);
ellipse(200,500,100,120);
ellipse(400,500,100,120);

/* white inner eye */
fill(255, 255, 255);
ellipse(220,250, 40,40);
ellipse(370,250, 40,40);

/* black small eye */
fill(0, 0, 0);
ellipse(235,250, 30,30);
ellipse(385, 250, 30,30);

/* white small eye */
fill(255, 255, 255);
ellipse(235,245, 5,5);
ellipse(385, 245, 5,5);



