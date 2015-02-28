
size (400,400);
background(#03E8ff);
int low = -2;
int high = 1;
println(low);
println(high);
high = (high + 3);
println(high);
low = low * low;
println(low);
float shirt = 5;
float pants = 20;
println(shirt);
println(pants);
shirt = shirt + .5;
println(shirt);
pants = pants * .38;
println(pants);

//end of variables//
//start of shapes//


fill(#A730CC);
ellipse(width / 2, height / 4, 85, 85);

fill(#FF0000);
fill(255, 0, 0);

//magic line line triangle//
triangle(width / 2, height / 3, width / 2, height / 2, width / 2, height / 4);

//actual triangle//
fill(#962354);
triangle(height / 2, width / 4, height / 7, width / 5, height / 4, width / 2);

fill(#00FF00);
arc(height / 2, width / 2, height / 2, height / 2, QUARTER_PI, PI);


line(width /2 , height / 2, width / 3, height);
stroke(126);

fill(#0000FF);
quad(width / 2, height / 4, 86, 20, 69, 63, 30, 76);

fill(#0877F6);
rect((width / 3) + 10, height / 2, height / 5, width / 5, 25);





