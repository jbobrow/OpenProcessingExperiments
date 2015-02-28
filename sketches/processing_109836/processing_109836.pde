
size(300, 300);
background(#ADCBCB);
Float xvalue = 100.0;
Float yvalue = 250.0;
Float diameter = 80.0;
ellipse( diameter, yvalue, diameter, xvalue); 
xvalue = xvalue + 100;
yvalue = yvalue + 100;
diameter = diameter + 100; 
ellipse( diameter, yvalue, diameter, xvalue);
xvalue = xvalue - 100;
yvalue = yvalue - 100;
diameter = diameter - 100; 
xvalue = xvalue * 0.5;
yvalue = yvalue * 0.5;
diameter = diameter * 0.5; 
println( diameter); 
ellipse( diameter, yvalue, diameter, xvalue);
fill( 210, 145, 190);
rect( 100, 100, width / 4, height / 3);
fill( 33, 106, 178);
rect( 40, 90, height / 6, height / 8);
fill( 160, 65, 188);
rect( 80, 75, height / 3, width / 9);
float dist = 10;
line(0, 0, dist, dist);
line(dist * 1.6, dist * 1.5, dist * 3, dist * 2);
line(dist * 3.5, dist * 3.5, dist * 5, dist * 4);
line(dist * 7, dist * 8, dist * 9, dist * 10);
line(dist * 20, dist * 19, dist * 30, dist * 30);



