
size(200,200);
background(139,105,105,225);

int x=20;
int y=50;

strokeWeight(5);
stroke(255);
fill(191,239,255,200);
rect(x,y,(2*y)+(3*x),2*y);

strokeWeight(2);
stroke(255);
fill(255,174,185,155);
rect((2*y)-(x),y-(x/2),2*x,(2*y)+(x));
