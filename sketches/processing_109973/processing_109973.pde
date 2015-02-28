
size(500, 500);
 
triangle(0, 0, width*.5, 0, 0, height*.5);
triangle(width*.5, 0, width, 0, width, height*.5);
triangle(width, height*.5, width, height, width*.5, height);
triangle(0, height*.5, 0, height, width*.5, height);
quad(0, height*.5, width*.5, 0, width, height*.5, width*.5, height);

fill(255, 106, 98, 100);
triangle(0, height*.5, width*.25, height*.25, width*.5, height*.5);
triangle(0, 0, width*.5, 0, width*.25, height*.25);
fill(118, 17, 12, 100);
triangle(width*.5, 0, width*.5, height*.5, width*.25, height*.25);
triangle(0, 0, 0, height*.5, width*.25, height*.25);

fill(78, 73, 250, 100);
triangle(width, height*.5, width*.5, height*.5, width*.75, height*.25);
triangle(width*.5, 0, width, 0, width*.75, height*.25);
fill(29, 26, 124, 100);
triangle(width*.5, 0, width*.5, height*.5, width*.75, height*.25);
triangle(width, 0, width, height*.5, width*.75, height*.25);

fill(52, 234, 50, 100);
triangle(width*.5, height, width*.5, height*.5, width*.75, height*.75);
triangle(width, height*.5, width, height, width*.75, height*.75);
fill(18, 103, 17, 100);
triangle(width, height*.5, width*.5, height*.5, width*.75, height*.75);
triangle(width, height, width*.75, height*.75, width*.5, height);

fill(233, 66, 242, 100);
triangle(width*.5, height, width*.5, height*.5, width*.25, height*.75);
triangle(0, height*.5, 0, height, width*.25, height*.75);
fill(99, 19, 103, 100);
triangle(0, height*.5, width*.5, height*.5, width*.25, height*.75);
triangle(0, height, width*.25, height*.75, width*.5, height);

fill(200); 
ellipse(width*.5, height*.5, width*.7, height*.7);
fill(255);
ellipse(width*.5, height*.5, width*.6, height*.6);
fill(0);
ellipse(width*.5, height*.5, width*.5, height*.5);

line(width*.5, height*.2, width*.5, height*.8);
line(width*.2, height*.5, width*.8, height*.5);

stroke(255);
line(width*.5, height*.25, width*.5, height*.75);
line(width*.25, height*.5, width*.75, height*.5);

noFill();
bezier(width*.3, height*.35, width, 0, 0, height, width*.7, height*.65);
bezier(width*.3, height*.65, width, height, 0, 0, width*.7, height*.35);

fill(211, 11, 11);
rect(width*.4, height*.4, width*.1, height*.1);
fill(11, 18, 211);
rect(width*.5, height*.4, width*.1, height*.1);
fill(167, 11, 211);
rect(width*.4, height*.5, width*.1, height*.1);
fill(41, 173, 5);
rect(width*.5, height*.5, width*.1, height*.1);







