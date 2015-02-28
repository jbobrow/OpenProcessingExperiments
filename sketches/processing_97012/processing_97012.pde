
size(125,140);
background(255,218,185);
int x=10;
int y=75;

strokeWeight(y/7);
line(x,y,y,x);
strokeWeight(x);
ellipse(y,y,7*x,10*x);

noStroke();
fill(99,184,255);
ellipse(y+x,y+x,3*x,3*x);

noStroke();
fill(0);
ellipse(y+(1.5*x),y+(1.5*x),x,x);


