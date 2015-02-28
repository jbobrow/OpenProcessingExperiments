
/*
 *  
 *  Creature by Ray Canapini 1/2012
 * 
 */

// canvas

size(500, 750);
smooth();
background(#D7F6FF);

// body

fill(#68ACBF);
noStroke();
ellipse(width/2, 480, 166, 240); // mid section

// arms

fill(#45727F);
noStroke();
bezier(180, 417, 180, 417, 80, 490, 174, 525); // right arm
bezier(320, 417, 320, 417, 420, 490, 326, 525); // left arm

// head 

fill(#8BE5FF);
noStroke();
ellipse(width/2, 256, 246, 246); // top of head
rect(127, 250, 246, 140); // middle of head
ellipse(width/2, 390, 246, 40); // top of head

// mouth

fill(#171D1F);
ellipse(250, 370, 40, 14);

// left eye

fill(255);
ellipse(200, 270, 60, 90);
fill(#B2AB59);
ellipse(200, 260, 60, 80); // pupil
fill(255); // white of eye
triangle(195, 300, 200, 258, 205, 300); //iris

// right eye

fill(255);
ellipse(300, 270, 60, 90);
fill(#B2AB59);
ellipse(300, 260, 60, 80); // pupil
fill(255); // white of eye
triangle(295, 300, 300, 258, 305, 300); //iris

// right hand

fill(#CCC35B);
// (x, y, width, height)
ellipse(172, 492, 28, 10); // top finger
ellipse(172, 504, 32, 10); // middle finger
ellipse(172, 516, 22, 10); // btm finger

// left hand

fill(#CCC35B);
// (x, y, width,height)
ellipse(328, 492, 28, 10); // top finger
ellipse(328, 504, 32, 10); // middle finger
ellipse(328, 516, 22, 10); // btm finger


// pants

// quad(x1, y1, x2, y2, x3, y3, x4, y4)
fill(#18282C);
quad(178, 540, 208, 631, 292, 631, 322, 540);
stroke(#D7F6FF);
strokeCap(ROUND);
strokeWeight(6);
line(250, 594, 250, 631); // bisect line

// right foot

noStroke();
fill(255);
ellipse(222, 634, 54, 22);

// left foot

ellipse(276, 634, 54, 22);



/* bisecting guides
 line(0, height/2, width, height /2); // horizontal line
 line(width/2, 0, width/2, height); // vertical line
*/

