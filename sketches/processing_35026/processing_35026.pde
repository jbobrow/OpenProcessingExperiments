
//Joseph Kotay. Practice Computational Methods. Professor Nick Senske
//Homework 1.3. Lower Right Section of Kandinsky Painting

//The actual paintings uses a blend of different color values in the background colors. This was
//hard to reproduce with the color commands I'm using in this code.

size(300,300);
background(234,215,178);
smooth();

//These are the shapes on the top left of my section.

noStroke();
fill(170,100,40);
quad(0,0,0,18,80,18,75,0);

fill(83,130,90);
quad(75,0,80,18,130,18,115,0);

fill(230,194,70);
quad(89,12,132,65,139,57,93,9);

//These arcs are coded next because they are one layer under the following
//series of lines and rectangles.

stroke(157,69,20);
strokeWeight(3);
fill(243,237,221);
arc(30,100,70,65,-PI,0);

stroke(138,135,93);
strokeWeight(1);
arc(102,100,70,65,-PI,0);

noFill();
stroke(75,72,55);
arc(0,144,56,80,-PI/2,0);

stroke(75,72,55);
arc(25,180,78,76,-PI,0);

stroke(75,72,55);
arc(25,180,78,76,0,PI/10);

stroke(157,154,114);
arc(65,230,75,80,-PI,0);

//These are the shapes located on the lower right quadrant of my section.

fill(130,107,148);
ellipse(123,160,50,50);

fill(148,156,114);
ellipse(225,200,90,90);

fill(220,172,72,99.99);
triangle(165,166,220,102,241,190);

stroke(0);
fill(125,37,28);
quad(263,223,264,253,296,254,295,223);

strokeWeight(2);
line(285,236,300,236);

strokeWeight(3);
line(283,242,300,242);

fill(255);
noStroke();
quad(81,0,89,11,92,9,87,0);

stroke(0);
strokeWeight(3);
line(89,11,92,9);

strokeWeight(4);
line(86,6,89,4);

strokeWeight(1);
line(82,2,87,0);

//This is the code for the gray, black, and red band that is in the top left of my section.

fill(190,40,5);
quad(64,40,66,46,126,-1,116,-1);

fill(0);
quad(35,62,42,65,66,46,64,40);

fill(148,147,118);
quad(0,87,0,95,42,65,35,62);

//These are the three thin triangular strips that are located top right.

fill(164,112,47);
beginShape();
vertex(187,0);
vertex(256,107);
vertex(195,0);
endShape();

beginShape();
vertex(205,0);
vertex(250,70);
vertex(210,0);
endShape();

beginShape();
vertex(232,0);
vertex(270,60);
vertex(236 ,0);
endShape();

//Finally, I saved all the lines for last because they overlap on top of all the other shapes.
//Plus, they were th easiest to code. :)

strokeWeight(6);
line(180,-1,300,37);

strokeWeight(3);
line(170,0,300,205);

strokeWeight(3);
line(77,0,154,257); 

strokeWeight(2);
line(0,100,220,102);

strokeWeight(2);
line(61,156,204,156);
line(104,226,212,224);

line(0,102,20,80);
line(0,107,37,69);
line(0,113,54,56);

line(0,170,62,103);
line(0,175,65,105);
line(0,180,68,106);





