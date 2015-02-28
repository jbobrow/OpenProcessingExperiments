
size(300,300);
background(01,255,240);
float x=50;

float y=50;
float diameter=100;
ellipse(x,y,diameter,diameter);
x=x+100;
y=y+100;
diameter=diameter+100;
println(x+"and"+y);
ellipse(x,y,diameter,diameter);

x=x/2;
y=y/2;
diameter=diameter/2;

ellipse(x,y,diameter,diameter);
rectMode(CENTER);
int lCorner=0;
fill(255,158,0);
triangle(lCorner+30,height/2+10,width/2,height/4+20,width-30,height/2+10);
fill(128);
rect(width/2,height/2+20,100,40);
fill(0,0,255);
ellipse(width/2,height/2+30,width/2,height/2);
fill(128);
rect(width/2,height/2+20,100,40);

strokeWeight(5);
// height of line
int a=10;
line(0,a,width,a);
 a=a*2;
line(0,a,width,a);
 a=a*2;
line(0,a,width,a);
 a=a*2;
line(0,a,width,a);
 a=a*2;
line(0,a,width,a);



