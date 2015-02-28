
size(400, 700);
smooth ();

// right foot
//vertex (x,y)
beginShape();
fill (0);
vertex (60, 540);
vertex (60, 460);
vertex(80, 460);
vertex(80, 520);
vertex(100, 540);
endShape ();

// left foot
beginShape();
fill (0);
vertex (120, 540);
vertex (120, 460);
vertex(140, 460);
vertex(140, 520);
vertex(160, 540);
endShape ();

// lower body
// ellipse(x, y, width, height)
ellipse (70, 440, 50, 50);
ellipse (100, 440, 50, 50);
ellipse (130, 440, 50, 50);
ellipse (60, 410, 50, 50);
ellipse (80, 410, 50, 50);
ellipse (110, 410, 50, 50);
ellipse (140, 410, 50, 50);
ellipse (70, 380, 50, 50);
ellipse (100, 380, 50, 50);
ellipse (130, 380, 50, 50);

//triangle above body
//triangle(x1, y1, x2, y2, x3, y3);
fill (0);
noStroke();
triangle ( 40, 320, 100, 380, 160, 320);

//circle above triangle
fill (0);
ellipse (100, 290, 100, 100);

//rectangle aboce circle
//rect(x, y, width, height)

fill (0);

rect (50, 240, 100, 55); 

//antenas
//line(x1, y1, x2, y2)
stroke (20);
strokeCap(ROUND); 
line(50, 240, 10, 100); //left antena
line (149, 240, 200, 80);

//head
ellipse (100, 150, 110, 110);

//eyes
fill (255);
rect (70, 110, 20, 20);
rect (120, 160, 20, 20);
fill (66, 211, 98);
ellipse (80, 120, 5, 5);
ellipse (130, 170, 5, 5);

//mouth
fill (255, 0, 0);
ellipse (100, 150, 10, 10);





