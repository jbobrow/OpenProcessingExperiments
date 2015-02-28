
//canvas parameters
size (500,500);
background(255);
smooth();
//style parameters
noStroke();
//lines parameters
int x=width-10;
int y=height-10;
int x2=width-x;
int y2=height-y;

//set ellipse by edges in position. the amount of pixels between corners is the equivalent of its diameter
ellipseMode(CORNERS);

fill(0,random(0,225),50,150);
ellipse(12,12,380,380);
fill(0,50,random(0,225),150);
ellipse(150,150,285,285);
fill(random(0,225),0,50,150);
ellipse(280,280,350,350);
fill(random(0,125),0,50,150);
ellipse(450,450,480,480);
fill(0,50,random(0,125),150);
ellipse(360,360,485,485);
fill(0,random(0,155),50,150);
ellipse(300,300,385,385);
fill(random(0,225),0,50,150);
ellipse(10,10,250,250);
//three lines
strokeWeight(random(0,5));
stroke(random(0,225),0,50,150);
line(x2,y2,x,y);
rotate(PI/100);
line(x2,y2,x,y);
rotate(2*-PI/100);
line(x2,y2,x,y);
//top circle
strokeWeight(155);
point(10,10);
saveFrame("line-####.png");                
