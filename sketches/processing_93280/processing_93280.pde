
background(255);
int x=60;
int y=60;
smooth();
noStroke();
//hat
fill(0);
triangle(x-40, y-10, x+40, y-10, x+40, y-20);
quad (x-10,y-35,x+30,y-35,x+30,y-10,x-20,y-10);
//face
fill(251,192,166);
triangle(x-20,y-10,x-20,y+20,x-30,y+20);
quad(x-20,y-10,x-20,y+44,x+30,y+17,x+30,y-10);
//eye
fill(0);
ellipse(x-16,y+2, 5,5);

