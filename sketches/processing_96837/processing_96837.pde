
int d = 50;
int p1 = d;
int p2 = p1+d;
int p3 = p2+d;
int p4 = p3+d;

size (500, 300);
background (649);
translate (140,0);

stroke (153);
line(p3, p3, p2, p3);
line(p2, p3, p2, p2);
line(p2, p2, p3, p2); 
line(p3, p2, p3, p3);

stroke(255);
point(p1, p1);
point(p1, p3);
point(p2, p4);
point(p3, p1);
point(p4, p2);
point(p4, p4);



