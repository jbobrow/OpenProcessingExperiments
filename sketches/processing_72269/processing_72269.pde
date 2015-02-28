
size(1000,500); // Set the size of the window
background(0); // Drawing in the background as aquamarine
smooth();

//Draw triangle
stroke(0);
fill(200,30,120);
triangle(300,370,500,100,700,370);

//Draw upper triangle in triangle
stroke(0);
fill(250,60,70);
triangle(426,200,500,100,574,200);

//Draw lower left triangle
stroke(0);
fill(40,230,250);
triangle(300,370,426,200,500,370);

//Draw lower right triangle
stroke(0);
fill(127,67,200);
triangle(500,370,574,200,700,370);

//Draw upper triangle of lower left triangle
stroke(0);
fill(145,20,75);
triangle(375,270,426,200,456,270);

//Draw lower left triangle of lower left triangle
stroke(0);
fill(0,175,89);
triangle(300,370,375,270,409,370);

//Draw lower right triangle of lower left triangle
stroke(0);
fill(136,0,129);
triangle(409,370,456,270,500,370);

//Draw upper triangle of lower right triangle
stroke(0);
fill(230,200,30);
triangle(543,270,574,200,626,270);

//Draw lower left triangle of lower right triangle
stroke(0);
fill(230,200,220);
triangle(500,370,543,270,595,370);

//Draw lower right triangle of lower right triangle
stroke(0);
fill(230,70,130);
triangle(595,370,626,270,700,370);

//Draw lower triangle of center triangle
stroke(0);
fill(250,60,70);
triangle(500,370,456,270,543,270);

//Draw very left triangle of center shape (also known as second from left)
stroke(0);
fill(70,20,75);
triangle(456,270,426,200,500,200);

//Draw very right triangle of center shape (also know as second from right)
stroke(0);
fill(44,30,135);
triangle(543,270,500,200,574,200);




