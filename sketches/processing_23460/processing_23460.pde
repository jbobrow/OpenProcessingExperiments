
size(300, 300);

background(173, 219, 232);

int x=150;
int y=150;

// head and eyes
fill(82, 192, 28);
smooth();
ellipse(x-50, x-50, y-75, y+25);
fill(0, 0, 0);
ellipse(90, 140, 10, 10);
ellipse(x-20, x-10, x-140, x-140);

// mouth
fill(224, 243, 14);
ellipse(x-40, x+10, y-100, y-132);

line(95, 160, 125, 160);

// body
fill(82, 192, 28);
ellipse(x-50, x+63, y-100, y-100);

// arms
line(x-65, x+50, y-65, y+75);
line(x-29, x+50, y-10, y+70);

// shoes
fill(0, 0, 0);
ellipse(x-70, x+90, y-110, y-135);
ellipse(x-30, x+90, y-110, y-135);




