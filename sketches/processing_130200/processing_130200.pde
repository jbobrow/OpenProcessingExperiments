
size(400,400);
background(113,198,113);
stroke(255,255,255);
int x = 5;
strokeWeight(1);
line(0,x,400,x);
strokeWeight(3);
line(0,x*5,400,x*5);
strokeWeight(4);
line(0,x*12,400,x*12);
strokeWeight(x*2);
line(0,x*22,400,x*22);
strokeWeight(x*3);
line(0,x*35,400,x*35);
strokeWeight(x*4);
line(0,x*53,400,x*53);

//green lines
strokeWeight(1);
stroke(113,198,113);
line(x,0,x,400);
strokeWeight(3);
line(x*5,0,x*5,400);
strokeWeight(4);
line(x*12,0,x*12,400);
strokeWeight(x*2);
line(x*22,0,x*22,400);
strokeWeight(x*3);
line(x*35,0,x*35,400);
strokeWeight(x*4);
line(x*53,0,x*53,400);
