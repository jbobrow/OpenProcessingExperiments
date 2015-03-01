
size(500,500);
float xo,yo;
xo=width/2;
yo=height/2;
background(20,95,220);
smooth();
//glava
fill(255,255,0);
ellipse(xo,yo,200,200);
//lijevo oko
fill(0,0,0);
ellipse(xo-30,yo-30,25,25);
//desno oko
fill(0,0,0);
ellipse(xo+30,yo-30,25,25);
// nos
triangle(xo,yo-25,xo-5,yo+15,xo+5,yo+15);
// usta
//nofill();
stroke(10,0,0);
arc(xo,yo+25,100,100,0,PI);
