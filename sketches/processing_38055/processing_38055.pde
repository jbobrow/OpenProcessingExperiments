
//assignment 1
//piet modrian - Composition Y.R.B.

background(#ffffff);
size(500,500);

smooth();
strokeWeight(5);
line(250,0,0,250); //left top
line(250,0,500,250); //right top
line(0,250,250,500); //left bottom
line(250,500,500,250); //right bottom
line(175,75,175,425); //left middle vert.
line(0,250,500,250); //centerline
line(175,75,325,75); //top little
line(400,150,400,350); //right vert.
line(150,400,350,400); //bottom horiz.
line(100,250,100,350); //left next to mid.
fill(#192248);
triangle(400,250,500,250,400,350); //blue tri.
fill(#FCEC2E);
triangle(175,75,175,250,0,250); //yellow tri.
fill(#9B060B);
triangle(150,400,175,400,175,425); //red tri.
fill(#000000);
quad(100,250,175,250,175,335,100,335); //black quad


