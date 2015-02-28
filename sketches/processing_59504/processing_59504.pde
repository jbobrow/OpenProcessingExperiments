
/* 
 landscape baby
 */

// first set the size of the sketch in pixels
size(400, 400);// size(width, height);

// smooth and nice
smooth();

// when drawing a landscape, it is easier to draw from the back forward- nbte from teacher matt richards sketch
// start with the background color
background(#DEF0FF);

// pretty sun, outer ring first then inner ring
noStroke();
fill(#FFF4E0);
ellipse(220, 180, 200, 200);// outer ring
fill(#F04A04);
ellipse(220, 180, 160, 160);// inner ring


//hills

fill(#6BB42F);// first green hill
stroke(#EEFFE0);
strokeWeight(6);
ellipse(100, 400, 700, 400);

fill(#6BB42F);// second green hill
stroke(#EEFFE0);
strokeWeight(6);
ellipse(500, 400, 900, 400);


//clouds
fill(#F2F8FA);
noStroke();
//cloud 1
ellipse(70,30, 110, 48);
ellipse(60,20, 90, 60);
ellipse(80,40, 60, 50);
ellipse(10,10, 60, 46);


//cloud 2;
ellipse(180,40, 60, 50);
ellipse(110,10, 60, 46);
ellipse(200,30, 110, 48);
ellipse(210,10, 60, 46);

//cloud 3
ellipse(300,30, 110, 48);
ellipse(360,20, 90, 60);
ellipse(380,40, 60, 50);
ellipse(310,10, 60, 46);


