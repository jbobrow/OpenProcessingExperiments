
//Geometry 8.2.12

size(500,500);
background(255);
colorMode(RGB, 255, 255, 255); // range 1, range2, range
// Hue 0-360
// Saturation 0-100
// Brigtness 0-100

noStroke();

fill(0,100,100); //red
rect(10,10,100,100);

fill(180,100,100); //cyan
rectMode(CENTER);
rect(110,110,100,100);

fill(240,50,100); //purple
rectMode(RADIUS);
rect(210,210,100,100);

fill(120,100,100);//green
rectMode(CORNER); 
rect(220,220,150,150);



