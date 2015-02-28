

// Birthday October 4th = 4

//Red Circle
size(300, 300);
float a = 4;
ellipseMode(RADIUS);
a = a * 3;
fill(255, 0, 0);
ellipse(150, 150, a, a);

//Yellow Circle
ellipseMode(CENTER);
fill(250, 255, 3);
ellipse(250, 150, 60, 60);

//Green Cube
rectMode(CENTER);
fill(60, 255, 3);
a = 80 / a;
rect(a, 150, 80, 80);

//Orange Vertical Line
stroke(245, 120, 2);
strokeWeight(2);  
line(200, height/2 +3*a, 200, height/2-3*a);


//Blue Triangle
fill(2, 12, 245);
stroke(0);
strokeWeight(1);
triangle(width/3, height/2 -a*2, width/3 +a*2, height/2 +a*2, width/3 -a*2, height/2 +2*a); 


