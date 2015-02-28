
size (400, 600);
smooth();
int y = 100;
int x = 100;
fill (200, 100, 90);
noStroke ();
ellipse (x + 120,y + 55,50,50);
stroke (1);
line(210, 166, 230, 166);
fill(255, 155);
noStroke ();
beginShape ();  
vertex (270, 180);
vertex (270, 230);
vertex (250, 280);
vertex (180, 280);
vertex (160, 230);
vertex (160, 180);
endShape ();

fill (0, 0, 0);
beginShape();
vertex (250, 280);
vertex (258, 260);
vertex (171, 260);
vertex (181, 280);
endShape ();

beginShape ();
vertex (200, 180);
vertex (180, 280);
vertex (160, 230);
vertex (160, 180);
endShape ();

beginShape ();
vertex (270, 180);
vertex (270, 230);
vertex (250, 280);
vertex (240, 180);
endShape ();


rect(x + 81, y + 180, 20, 50);
rect(x + 130, y + 180, 20, 50);
rect(x + 10, y + 80, 50, 15);
rect(x + 170, y + 80, 50, 15);
rect(x + 130, y + 220, 30, 10);
rect(x + 70, y + 220, 30, 10);

triangle (x +120, y + 100,x + 115, y + 70,x + 125,y + 70);

fill (200, 100, 90);
triangle(x - 5,y + 80,x - 19,y + 100,x + 11,y + 85);
triangle(x + 235,y + 80,x + 219,y + 85,x + 246,y + 100);

fill (255, 255, 255);
ellipse (x + 122, y + 45, 20, 20);
fill (0, 0, 0);
ellipse (x + 122, y + 45, 7, 7);


