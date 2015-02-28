
/* 

Haiku Coding:

5 statements - initialising the sketch and opening the loop
7 statements - setting the colors and variables used for drawing
5 statements - draw statements and closing the loop

17 statements in total

//*/

size(800,800); colorMode(HSB, height); background(height*0.96); float i = width; while (i-- > 0) {
stroke(i, height, height * .02, height / 1.14); fill(i, height, height * .10); float rW = random(-width / 2, width / 2); float rH = random(-height / 2, height / 2); float tX = width / 2 + rW; float tY = height / 2 + rH; float s = sin(i * (TWO_PI/(i+1))) * -7.5;
pushMatrix(); translate(tX, tY); scale(s); triangle(0, 0, 10, 10, -10, 10); popMatrix(); }
