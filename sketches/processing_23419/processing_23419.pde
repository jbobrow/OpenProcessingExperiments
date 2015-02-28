
size(200,200);

int x = 50;
int y = 50;

fill(148,215,253);
rect(x-50,y-50,200,80);
noFill();

fill(94,186,27);
rect(x-50,y+30,200,120);
noFill();

fill(255);
rect(x,y,80,40);
triangle(x-13,y-30,x-21,y-10,x-5,y-15);
triangle(x+5,y-25,x,y+0,x+20,y-10);
noFill();

fill(255);
beginShape();
vertex(x-21,y-20);
vertex(x-20,y+20);
vertex(x-5,y+25);
vertex(x+20,y-10);
endShape(CLOSE);
noFill();

fill(51);
ellipse(x-14,y-6,3,3);
ellipse(x+4,y-1,3,3);
noFill();

fill(255);
rect(x,y+40,5,30);
rect(x+10,y+40,5,20);
rect(x+55,y+40,5,30);
rect(x+65,y+40,5,20);
noFill();

fill(51);
line(x+80,y,x+110,y+20);
triangle(x+100,y+20,x+105,y+10,x+110,y+20);
noFill();

fill(51);
smooth();
ellipse(x+20,y+25,18,18);
ellipse(x+43,y+12,18,18);
ellipse(x+62,y+27,18,18);
noSmooth();
noFill();

