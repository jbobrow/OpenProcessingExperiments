
/*
Konkuk University
SOS iDesign

Name: Your Name <<------- Write your full name here!
Id: Your ID <<--------- Write your ID here!

*/
PImage img;
void setup(){
size (600,600);
// noLoop();
smooth();
colorMode (RGB,600);
//img = loadImage ("wassily_kandinsky.jpg"); //put the image in the same folder as the processing file  
}

void draw(){
println(mouseX + " : " + mouseY);
//image (img, 0, 0);
// here you add your code with all shapes and colors, ------

background(545.2,531.1,408.9);
point(546,204);

strokeWeight(6);
stroke(255,0,0);
noFill();
bezier(0,170,31,132,113,160,107,223);

strokeWeight(2);
stroke(0,0,0);
line(0,200,243,0);
stroke(0,0,0);
line(0,212,264,0);


strokeWeight(2);
noFill();
stroke(0,0,0);
fill(68, 515, 52);
quad(0,0,0,65,224,65,185,0);
noStroke();
fill(599.25, 220.9, 0);
triangle(118,0,231,159,242,143);
strokeWeight (2);


stroke(0,0,0);
fill(444.15, 444.15, 444.15);
ellipse(396,420,156,156);
fill(0, 305.5, 359.55);
triangle(385,229,288,351,422,396);


stroke(0,0,0);
strokeWeight(1) ;

fill(599.25, 535.8, 0);
ellipse(212,336,94,94) ;
stroke(0,0,0);
line(103,334,354,334) ;

noFill();
stroke(0,0,0);
bezier(113,222,113,146,245,120,248,224);
stroke(0,0,0);
strokeWeight(3) ;
line(108,81,391,409) ;
stroke(0,0,0);
strokeWeight(3) ;
stroke(0,0,0);
line(385,229,0,222) ;
stroke(0,0,0);
strokeWeight(2) ;
line(180,467,370,467) ;
stroke(0,0,0);
line(129,19,268,527);
stroke(0,0,0);
strokeWeight(2) ;
line(125,15,167,525) ;



fill(599.25,439.45,0);
triangle(308,0,448,237,322,0);
triangle(336,0,436,163,348,0);
triangle(386,0,471,150,400,0);









stroke(0,0,0);
strokeWeight(8) ;
line(231,0,543,109);

stroke(0,0,0);
strokeWeight(5) ;
line(128,0,544,111) ;

noFill();
stroke(0,0,0);
bezier(38,476,38,375,173,375,173,481);
stroke(0,0,0);
bezier(0,323,49,270,127,342,107,400);
stroke(0,0,0);
bezier(0,231,24,228,62,290,43,305);

strokeWeight(1);
stroke(0,0,0);
line(0,351,106,228) ;
stroke(0,0,0);
line(0,362,111,234) ;
stroke(0,0,0);
line(0,373,116,237) ;
stroke(0,0,0);
line(0,223,32,186) ;
stroke(0,0,0);
line(0,235,62,163) ;
stroke(0,0,0);
line(0,244,88,142) ;
stroke(0,0,0);
line(509,0,503,33) ;
stroke(0,0,0);
line(544,0,543,34) ;
stroke(0,0,0);
strokeWeight(2) ;
line(583,0,583,34) ;
stroke(0,0,0);

fill(600,0,0);
rectMode(CENTER);
rect(488,491,55,55);
stroke(0,0,0);
strokeWeight(1) ;
line(490,490,533,488) ;
stroke(0,0,0);
line(490,497,534,497) ;


fill(mouseX,mouseX, 88 );
bezier(46,1,50,40,119,40,119,0);
fill(mouseX,mouseY,600);
bezier (54,0, 57,26, 105,29, 105,0);


stroke(0,0,0);
strokeWeight(2) ;
line(156,53,160,50);
stroke(0,0,0);
line(150,44,153,41);




}


