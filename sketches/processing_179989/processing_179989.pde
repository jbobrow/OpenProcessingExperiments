
/*
Basic Drawing Stuff
*/

//window size
size(100, 100);

//skull
quad(23, 72, 79, 68, 68, 19, 20, 24);

//eye
ellipse(60, 40, 12, 8);

//nose
triangle(73, 42, 86, 60, 78, 60);

//chin
quad(23, 72, 79, 78, 80, 90, 20, 80);

//hair
fill(0, 0, 0);
triangle(35, 22, 70, 14, 68, 19);
triangle(60, 19, 40, 40, 35, 20);
triangle(20, 24, 23, 60, 30, 22);
quad(28, 22, 35, 20, 38, 32, 25, 36);

//ear
fill(255,255,255);
arc(35, 40, 15, 15, radians(50), radians(290), PIE);

//
//background(0, 42, 56);    //background color RGB alpha channel is available
//fill(250, 179, 55);       //fill color
//stroke(20, 27, 105);      //stroke color
//strokeWeight(20);         //stroke weight
//rect(50, 50, 500, 500);   //the shape (originX, originY, width, height)






