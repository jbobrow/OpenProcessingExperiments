
size(400, 400);
background (#BC0630);

int diameter = 8;
 //comment
 //2
 int d = diameter;
 println ("d is now " + d);
 println ("The answer to life is " + d);
 
 diameter = diameter * diameter * diameter;
 println (diameter);
 
 float kevin =3.14;
 ellipseMode (CORNER);
 stroke (#9311A5);
 fill (#00B23C);
 ellipse (width / 2, height / 2, diameter, diameter);
 
 fill (0, 0, 0);
 stroke (#BCA706);
 rectMode (CENTER);
 rect (height / 2, width/ 2, 100, 100);


