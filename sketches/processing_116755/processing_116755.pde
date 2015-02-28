
int ellipX = 164;
int ellipX2 = 60;
int X = 164;
int line190 = 190;
int line140 = 140;
int line144 = 144;
int line185 = 185;

void setup()
{
  size(700,700);
}


void draw()
{
background(255,255,255);
//et mand

ellipX = ellipX+1;
X = X+1;
line190 = line190+1;
line140 = line140+1;
line144 = line144+1;
line185 = line185+1;

fill(240,22,10);
stroke(252,195,69);
 
ellipse(ellipX,215,ellipX2,60);
 
stroke(0,0,0);
 
line(X,245,X,280);
line(X,245,line190,300);
line(X,245,line140,300);
//Ben
line(X,280,line144,330);
line(X,280,line185,330);
}
