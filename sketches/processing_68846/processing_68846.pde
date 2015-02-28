
size(400,400);
background(0);

fill(255, 255, 255);
rect(0, 0, 400, 400);


line(0, 0, 0, 400); //x1. y1,  x2, y2
line(80, 0, 80, 400);
line(160, 0, 160, 400);
line(188, 188, 188, 400); //Shortened line
line(300, 0, 300, 400);
line(340, 0, 340, 400);
line(356, 0, 356, 400); //VERTICALS
line(360, 100, 400, 100); //Shortened Line

line(0, 372, 400, 372);
line(0, 80, 400, 80); //HORIZONTALS
line(0, 160, 400, 160);
line(0, 188, 400, 188);
line(0, 236, 400, 236);
line(0, 304, 400, 304);

fill(255,255,0);         //COLOR FILLS,    USE fill() and **Rect()
rect(0, 0, 80, 80);  //Yellow

fill(255, 0 ,0);  //RED
rect(304, 304, 40, 100); //x, y, Width (horizontal), height (VERTICAL)

fill(0, 0 ,255);
rect(160, 160, 150, 28);

fill(0, 0 ,255);
rect(160, 0, 150, 80);

noStroke();
triangle(40, 0, 0, 40, 80, 40); //x1, y1, x2, y2, x3, y3
fill(255, 0, 0);

fill(255, 0, 0);
ellipse(120, 120, 80, 80);

color p = color(255, 255, 0);
fill(p);
noStroke();
arc(80, 320, 120, 120, 0, PI+HALF_PI);

fill(0);
ellipse(120, 272, 20, 20);

fill(0);
ellipse(160, 220, 20, 20);


//PRIMITIVE 2D TYPES used: ARC, RECT, TRIANGLE, ELLIPSE, LINE


