
float x=60;//x
float y=440;//y
int radius=45;
int b=160;
int n=70;
float easing =0.02;
void setup(){size(360,300);
smooth();
strokeWeight(2);
ellipseMode(RADIUS);}

void draw(){int targetX=mouseX;
x+=(targetX-x)*easing;
if(mousePressed){n=16;b=90;}
else{n=70;b=160;}
float ny=y-b-n-radius;
background(204);

//A
stroke(102);
line(x+12,y-b,x+52,ny);
line(x+52,y-b-160,x+72,ny+100);
line(x+27,y-b-70,x+77,ny+50);


noStroke();

//head
fill(0);
rect(x+105,y-b-100,100,b-133);
rect(y-b-100,x+135,b-200,100);
//T
fill(255);
ellipse(x+252,ny+50,radius/3,radius+10);
fill(255);
ellipse(x+254,ny-6,60,14);}
