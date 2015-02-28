
//this is a comment...

/*this is
a multi-line
comment
and you close
it by writing
*/


//  parameters
size(300, 300);
smooth();

//  value between 0 - 255 (0 is black and 255 is white)
background(0);
stroke(255);
fill(77,110,237,100);

quad(135,100, 200,75, 200,200, 125,150);

point(150,150);

//line (x1,y1,  x2,y2);
line(0,0, 148,148);
line(0,20, 148,148);
line(0,40, 148,148);
line(0,60, 148,148);
line(0,80, 148,148);
line(0,100, 148,148);
line(0,120, 148,148);
line(0,148, 148,148);

triangle(10,200, 10,280, 120,280);

rect(220,190,  35, 20);

//  fill and stroke changes everything under it
fill(255);
stroke(0);

ellipse(75,75, 50, 50);

rect(180,150,  100, 80);

noFill();
rect(225,190,  45, 30);
rect(235,200,  25, 15);

