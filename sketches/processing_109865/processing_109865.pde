
size(500, 500);



triangle(0, 0, width*.5, 0, 0, height*.5);
triangle(0, 0, width*.5, 0, width*.25, height*.25);
triangle(0, 0, 0, height*.5, width*.25, height*.25);

triangle(width*.5, 0, width, 0, width, height*.5);

triangle(width, height*.5, width, height, width*.5, height);

triangle(0, height*.5, 0, height, width*.5, height);

ellipse(width*.5, height*.5, width*.7, height*.7);


