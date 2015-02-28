
//Name: Diana Willits
//Project: Workshop 2
//due Wed, January 16, 2013
//Class: Digital Media 1
//Summary:  Crop and make a mock of Kandinsky's Composition VIII

// Clone this sketch for Workshop 2,
// then write your program below...

size(600, 600);
background(234, 229, 217);

//triangle
fill(161, 183, 202,155);
strokeWeight(2);
triangle(50, 600, 202, 430, 410, 600);

//lines
line(200, 600, 200, 100);   //main,left straight line
line(100, 120, 450, 280);   //top diagonal line
line(130, 280, 300, 278);   //top of two tiny parallel lines

//bottom curve line
noFill();
beginShape();
curveVertex(460,  520);
curveVertex(460,  520);
curveVertex(520,  380);
curveVertex(600,  300);
curveVertex(600,  300);
endShape();

//top curve line
noFill();
strokeWeight(4);
beginShape();
curveVertex(450,  490);
curveVertex(450,  490);
curveVertex(500,  350);
curveVertex(600,  180);
curveVertex(600,  180);
endShape();

line(145, 310, 320, 305);   //bottom of two tiny parallel lines

//bold black figure
fill(0);
beginShape();
curveVertex(180, 620);
curveVertex(180, 620);
curveVertex(290, 520);
curveVertex(317, 360);    //top point of curve
curveVertex(305, 430);
curveVertex(285, 500);
curveVertex(220, 560);
curveVertex(50, 620);
curveVertex(50, 620);
endShape();


