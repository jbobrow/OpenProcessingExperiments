
//setup
size (150,300);
smooth();
int x=20;
int y=20;

//body
fill (246, 255, 0);
rect (27, 130, 92, 100, 40, 20);

//head
fill (245, 255, 0);
rect (x, 65, 105, 85, 60, 10); 

//ears
fill (245, 255, 0);
triangle (20, 20, 65,75, 20,77);
triangle (125, 20, 85, 77, 125, 75);

//eyes
fill (0); //blackparts
ellipse (52, 105, 30, 30);
ellipse (92, 105, 30, 30);
fill (255); //whiteparts
ellipse (55, 97, 6, 6);
ellipse (60, 103, 6, 6);
ellipse (53, 103, 4, 4);

ellipse (95, 97, 6, 6);
ellipse (100, 103, 6, 6);
ellipse (93, 103, 4, 4);

//dots
fill (255, 0, 0);
ellipse (30, 130, 15, 15);
ellipse (115, 130, 15, 15);

//arms
line (27, 160, 17, 175);
line (120, 160, 130, 175);

//legs
line (50, 230, 50, 290);
line (95, 230, 95, 290);

//feet
line (50, 290, 35, 290);
line (95, 290, 80, 290);

//nose
point (72, 125);

//mouth
fill (142, 47, 0);
arc (72, 132.5, 15, 10, 0, PI);

//eardetail
fill (0);
triangle (20, 20, 45, 50, 20, 50);
triangle (125, 20, 105, 50, 125, 50);

