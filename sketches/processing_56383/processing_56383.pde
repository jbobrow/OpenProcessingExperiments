
size (500, 500); 
background(209, 154, 7);
//Series of squares 01: (Squares descending in size:top left corner)
fill(0);
rect (-5, -5, 255, 255);  //Using variables 
fill(147, 3, 3);
int x= -20;
int y= -20;
rect (x, y, 250, 250);
fill(0);
rect (x+x, y+y, 250, 250); // x+(-20)
fill(147, 3, 3);
rect (x+2*x, y+2*y, 250, 250);
fill(0);
rect (x+3*x, y+3*y, 250, 250);
fill(147, 3, 3);
rect (x+4*x, y+4*y, 250, 250);
fill(0);
rect (x+5*x, y+5*y, 250, 250);
fill(147, 3, 3);
rect (x+6*x, y+6*y, 250, 250);
fill(0);
rect (x+7*x, y+7*y, 250, 250);
fill(147, 3, 3);
rect (x+8*x, y+8*y, 250, 250);
fill(255);
//Series of squares 02: (Squares descending in size:bottom right corner)
fill(0);
rect (250, 250, 250, 250);
x= 250-x;
y= 250-y;
fill(147, 3, 3);
rect (x, y, 250, 250);
fill(0);
rect (x+20, y+20, 250, 250);
fill(147, 3, 3);
rect (x+40, y+40, 250, 250);
fill(0);
rect (x+60, y+60, 250, 250);
fill(147, 3, 3);
rect (x+80, y+80, 250, 250);
fill(0);
rect (x+100, y+100, 250, 250);
fill(147, 3, 3);
rect (x+120, y+120, 250, 250);
fill(0);
rect (x+140, y+140, 250, 250);
fill(147, 3, 3);
rect (x+160, y+160, 250, 250);


//Series of lines 01: top right hand corner
strokeWeight(5);
stroke(147, 3, 3);
smooth();
for (int i=250; i < 500; i+=50) {
  line (i, 0, i + 50, 250); 
}  //Using for loop method 

//Series of lines 02: bottom left hand corner
/*line (50, 250, 50, 500);
line (100, 250, 100, 500);
line (150, 250, 150, 500);
line (200, 250, 200, 500);*/
for (int i=0; i < 250; i+=50) {
  line (i, 500, i + 50, 250);
}
//Inside middle square:
strokeWeight (7);
stroke(0);
strokeJoin(ROUND);
fill(200, 84, 49);
rect (100, 100, 300, 300);
strokeWeight (5);
stroke(147, 3, 3);
line (180, 200, 320, 200);
line (180, 300, 320, 300);  
line (200, 180, 200, 320);
line (300, 180, 300, 320);
strokeWeight (3);
strokeCap(SQUARE);
smooth();
noStroke();
fill(0);
ellipse (250, 250, 60, 60);
fill(253, 199, 104);
ellipse (250, 250, 90, 20);
ellipse (250, 250, 20, 90);
smooth();
stroke(0);
fill(253, 199, 104);
triangle (70, 150, 150, 150, 150, 220);
triangle (50, 250, 150, 250, 150, 350);
triangle (350, 150, 430, 150, 350, 220);
triangle (350, 250, 450, 250, 350, 350);














