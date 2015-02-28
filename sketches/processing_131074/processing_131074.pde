


size(300,300);
stroke(155,50,155,50);
line(150,120,130,150);

stroke(50,50,255);
line(130,150,150,140);

stroke(35,100,35);
line(150,140,150,120);

stroke(0,0,0);
arc(50,55,80,80,0,PI+QUARTER_PI, OPEN);

noFill();
//left top
arc(200, 55, 70, 70, HALF_PI, PI+PI);
//right top
arc(200, 55,70,70,PI+HALF_PI, PI+TWO_PI);
//right bottom
arc(200,125,70,70,PI+HALF_PI, PI+TWO_PI);
//left bottom
arc(200, 125, 70, 70, HALF_PI, PI+PI);

arc(50,200,70,70,radians(0),radians(120));


