
size(720, 480);
smooth();

//head

fill(100, 0, 0);
triangle(20, 175, 158, 120, 186, 175); //upperjaw
triangle(186, 175, 20, 300, 200, 300); //lowerjaw
fill(0);
ellipse(150, 150, 8, 8);

//neck
fill(0, 95, 05);
quad(200, 220, 220, 100, 179, 120, 200, 160);

fill(0, 100, 0);
stroke(10);
line(190, 200, 300, 300 );
line(190, 230, 300, 300);

//body

fill(0, 0, 100);
rect(230, 150, 250, 160);

//wheel

fill(0, 85, 0);
ellipse(360, 300, 150, 150);

fill(200, 200, 0);
ellipse(360, 300, 80, 80);

