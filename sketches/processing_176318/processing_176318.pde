
//(x, y, width, height, set the start angle, set the stop angle).
//Angles are set in "Radians" which are angle measurements based on value PI(3.14)
//QUARTER_PI= 45 degrees
//HALF_PI= 90 degrees
//PI= 180 degrees
//TWO_PI= 360 degrees
size(480, 120);
arc(90, 60, 80, 80, 0, HALF_PI);
arc(190, 60, 80, 80, 0, PI+HALF_PI);
arc(290, 60, 80, 80, PI, TWO_PI+HALF_PI);
arc(390, 60, 80, 80, QUARTER_PI, PI+QUARTER_PI);
