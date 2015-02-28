
size (300, 300);
background (207, 209,194);
smooth ();
noStroke();
  int x =0;
int y=0;

fill (0);
ellipse (100, 95,70, 70); // hair
//ellipse (70, 60, 30, 30); //pony tail left
ellipse (130, 60, 30, 30); //pony tail right
ellipse (150, 75, 25, 25); //pony tail right
ellipse (170, 85, 20, 20); //pony tail right
ellipse (100, 160, 60, 50); //body
rect (70,160, 60, 50); //body


fill (255);
ellipse (100, 100, 60, 60); //face
fill (0); 
ellipse (85, 100, 20,20); //eye
fill (0);
ellipse (115, 100, 20,20); //eye

noFill();
stroke (1);
ellipse (100, 120, 10,10); //mouth

fill (0,30);
noStroke();
ellipse (90, 250, 60,20); //shadow

PShape s;
s = loadShape("heart.svg");
smooth();
shape(s, 90, 130, 100, 70);

if (mousePressed) { 

  x = x + mouseX;
  y= y + mouseY;
println(x);
println(y);}




