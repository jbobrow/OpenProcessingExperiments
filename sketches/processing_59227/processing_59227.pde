
size(400, 400);
background(#0A1B38);
fill(#000000);
triangle(0, 400, 200, 0, 400, 400);
strokeWeight(5);
stroke(#FCFCFC);
line (0, 400, 200, 0);
line (400, 400, 200, 0);

int x=200;
int y=100;
strokeWeight(10);
stroke(#FFF824);
line(x, .25*y, x, .2*y);//200, 25, 200, 20
line(x, .4*y, x, .5*y);//200, 40, 200, 50
line(x, .8*y, x, y);//200, 80, 200, 100
line(x, 1.5*y, x, 2.25*y);//200, 125, 200, 200
line(x, 3*y, x, 4*y);//200, 300, 200,400

