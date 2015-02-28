
background(35,40,150);
size(450,250);
fill(245,250,8);
ellipse(120, 40, 55, 55);
line(400,120,0,180);

fill(30,50,50,50);
rect(340,75,50,60);
rect(400,25,25,100);
rect(300,25,35,150);
rect(280,80,35,95);
rect(0,140,40,100);

arc(50, 55, 50, 50, 0, HALF_PI);
arc(50, 55, 60, 60, HALF_PI, PI);
arc(50, 55, 70, 70, PI, PI+QUARTER_PI);
arc(50, 55, 80, 80, PI+QUARTER_PI, TWO_PI);

rect(350,170,200,100);
rect(200,100,20,100);

beginShape(QUADS);
vertex(30, 20);
vertex(30, 75);
vertex(50, 75);
vertex(50, 20);
vertex(65, 20);
vertex(65, 75);
vertex(85, 75);
vertex(85, 20);
endShape();

rect(15,70,80,400);


triangle(30, 75, 58, 20, 86, 75);

fill(245,250,8);
noSmooth();
point(30, 20);
point(85, 20);
point(85, 75);
point(30, 75);
