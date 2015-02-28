
// Marcos

size(200,200);
background(0,20,200);
noFill();
stroke(255,0,255);
int x;
int y;
for(x=0;x<201;x=x+25)
{
for(y=0;y<201;y=y+25)
{
rect(x,y,25,25);
}
}
float j;
fill(255);
noStroke();
for(j=12.5;j<200;j=j+25)
{
ellipse(j,j*j/180,10,10);
}
