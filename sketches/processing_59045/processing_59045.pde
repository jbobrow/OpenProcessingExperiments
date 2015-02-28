
/*
Week One: Monster
by Andreina Carrillo
*/



size (300, 300);
smooth ();
background (#67676C);


///*
///////////////////////////////////////////////////////////////////////
/// graph paper
stroke(255, 20);
/// horizontal lines
line(0,30, 300, 30);
line(0,60, 300, 60);
line(0,90, 300, 90);
line(0,120, 300, 120);
line(0,150, 300, 150);
line(0,180, 300, 180);
line(0,210, 300, 210);
line(0,240, 300, 240);
line(0,270, 300, 270);
/// vertical lines
line(30, 0, 30, 300);
line(60, 0, 60, 300);
line(90, 0, 90, 300);
line(120, 0, 120, 300);
line(150, 0, 150, 300);
line(180, 0, 180, 300);
line(210, 0, 210, 300);
line(240, 0, 240, 300);
line(270, 0, 270, 300);
 
//*/


//face/arc
noStroke();
fill(#272729);
arc(150, 180, 290, 290, PI, TWO_PI);
rect(6, 185, 290, 150);
//
//////////////////////////////////////

//left eye /// CAN'T DO THE RIGHT EYE ARC!! 
noStroke();
fill(#19181A);
arc(100, 100, 80, 80, QUARTER_PI, PI+QUARTER_PI);


//right eye
noStroke();
fill(#19181A);
arc(200, 100, 80, 80, TWO_PI-QUARTER_PI, PI+QUARTER_PI);




/*/////////////////////////////////////
noStroke();
fill(#19181A);
triangle(0, 0, 150, 150, 300, 0);

noStroke();
fill(#19181A);
triangle(300, 300, 150, 150, 0, 300);



//righteye
noStroke();
fill(#19181A);
ellipse(60, 125, 80, 80);

fill(#353436);
ellipse(60, 125, 50, 50);

//left
fill(#19181A);
ellipse(120, 60, 80, 80);



///eyebrows//
fill(255);
line(30, 20, 85, 75);
stroke(126);
/*/

