
size(100,100);
smooth();
background (0);
noStroke();

//head
fill(225);
arc(25, 40, 50, 60, 0, PI/2);

//wings
arc(75, 40, 50, 60, PI/2, PI);
arc(50, 40, 50, 60, PI, TWO_PI);
noStroke();

//body
fill(225);
triangle(50, 90, 24, 40, 76, 40);

//face
 fill(150);
ellipse(50, 36, 40, 40);

//right eye
fill(100);
ellipse(60, 35, 15, 15);
fill(0);
ellipse(58, 34, 10, 10);
fill(255);
ellipse(58, 34, 3, 3);

//left eye
fill(100);
ellipse(40, 35, 15, 15);
fill(0);
ellipse(42, 34, 10, 10);
fill(255);
ellipse(42, 34, 3, 3);

//beak
fill(0);
arc(50, 40, 8, 8, PI, TWO_PI);
triangle(50, 48, 46, 40, 54, 40);
