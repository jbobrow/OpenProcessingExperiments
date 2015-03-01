
/*Homework 1: Draw an creature
by Leiah Fournier
*/

//Window Size
size(400,400);

//Background Color
background(255,255,255);

//Body
fill(255,182,193);
noStroke();
ellipse(200,200,250,250);

//Left Eye
fill(25,25,112);
stroke(0,0,0);
strokeWeight(5);
ellipse(170,170,30,80);

//Black part of LE
fill(0,0,0);
noStroke();
ellipse(170,160,30,50);

//White part of LE
fill(255,255,255);
strokeWeight(1);
ellipse(170,150,20,35);


//Right Eye
fill(25,25,112);
stroke(0,0,0);
strokeWeight(5);
ellipse(230,170,30,80);

//Black part of RE
fill(0,0,0);
noStroke();
ellipse(230,160,30,50);

//White part of RE
fill(255,255,255);
strokeWeight(1);
ellipse(230,150,20,35);

//Left Cheek
fill(219,112,147);
noStroke();
ellipse(130,200,40,25);

//Right Cheek
fill(219,112,147);
noStroke();
ellipse(270,200,40,25);

//Mouth 
/* CREDIT: William Tsang 
(http://www.openprocessing.org/sketch/69113) */
fill(176,23,31);
noStroke();
arc(200,215,40,40,0,PI);
fill(255,182,193,200);
ellipse(200,240,75,30);



