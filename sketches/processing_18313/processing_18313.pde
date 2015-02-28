
size (640, 480);
smooth();

background(16,99,151);
noStroke(); 

/* head*/

fill(77,127,56);
ellipse(293,55,90,90);
fill(0);
rect(293,55,97,27);//hat
ellipse(390,68,26,26); //hat
fill(43,57,32);
ellipse(310,125,156,140);
fill(0);
arc(250,114,120,120, radians(90),radians(270)); //L black
arc(292,129,150,150, radians(270),radians(450)); //R black
rect(250,54,50,150);
fill(255);
arc(292,114,120,120, radians(270),radians(450)); //R white
fill(244,202,30);
arc(293,134,80,80, radians(90),radians(270)); //L yellow

/* body*/

fill(0);
rect(256, 193,148, 174);
fill(206,59,39);
rect(393, 193,80, 174);
rect(166,332,84, 148); // red LB
ellipse(166,359,56,56); // red LB 
fill(245,201,30);
ellipse(415,215,17,17); // yellow button
ellipse(449,215,17,17); // yellow button
ellipse(449,250,17,17); // yellow button
ellipse(449,285,17,17); // yellow button
ellipse(449,320,17,17); // yellow button
ellipse(449,350,17,17); // yellow button

fill(0);
rect(393,367,120,120);
fill(245,201,30);
quad(393,367,473,367,553,487,473,488); //shear
fill(77,127,56);
quad(225,410,393,410,393,480,181,480); //shear
fill(255);
ellipse(247, 222,100, 100); //center white
fill(180);
arc(247, 247,150,150, radians(90),radians(270)); //gray circle
bezier( 247,171,247,238,288,273,350,273);

fill(27,151,97);
rect(225, 273,120,100); //green
fill(255);
ellipse(347,311,78,78); //center white
rect(230, 367,162,54); //white hand
ellipse(230, 371,100, 100); //center white
ellipse(392, 394,54, 54); //center white
fill(245,201,30);
rect(340, 367,27,54); //yellow bracelet
fill(0);
ellipse(230, 297,49,49); //center black

/*white margin*/
fill(255);
rect(520,0,120,480);
rect(0,0,120,480);
strokeWeight(15);
stroke(130);
line(120,0,120,480);
line(520,0,520,480);

/*eye*/
stroke(100);
strokeWeight(4);
strokeCap(SQUARE);
bezier(305,95,305,105,335,105,335,95); //eye
line(309,100,303,105);
line(320,103,319,110);
line(330,100,335,107); //eyelashes

