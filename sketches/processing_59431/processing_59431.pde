
size(400, 400);
smooth();
background(#93DB70);

int x=200;
int y=300;

strokeWeight(5);
stroke(255);
line(x, y+80, y, x-100);
stroke(255);
line(x-30, y+50, y-30, x-130);
stroke(255);
line(x-60, y+20, y-60, x-160);

stroke(255, 255, 255);
fill(#3A6629, 100);
ellipse(x, 200, y, x);


