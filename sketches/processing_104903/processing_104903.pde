
//basics of the stage
size(800,800);

//distance from the center of the stage
int x=100;
int y=100;

//colors and transparency
int R=0;
int G=10;
int B=150;
int T=100;

//diameter of the circle
int d=300;

//stroke width of the lines
int s=int(d/2);

//background
background(255-R,255-G,255-B);

//bigger circles
fill(R,G,B,T);
noStroke();
ellipse(width/2+x,height/2+y,d,d);
ellipse(width/2+x,height/2-y,d,d);
ellipse(width/2-x,height/2-y,d,d);
ellipse(width/2-x,height/2+y,d,d);

//smaller circles
fill(R/2,G/2,B/2,T);
noStroke();
ellipse(width/2+x,height/2+y,d/2,d/2);
ellipse(width/2+x,height/2-y,d/2,d/2);
ellipse(width/2-x,height/2-y,d/2,d/2);
ellipse(width/2-x,height/2+y,d/2,d/2);

//lines
stroke(R,G,B,T/2);
strokeWeight(s);
strokeCap(SQUARE);
line(width/2+x,0,width/2+x,height);
line(width/2-x,0,width/2-x,height);
line(0,height/2+y,width,height/2+y);
line(0,height/2-y,width,height/2-y);
