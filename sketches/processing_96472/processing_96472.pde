
size(200,200);
background(0);
noFill();
stroke(255);
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
fill(184,20,245);
noStroke();
float xbola;
for(xbola=12.5;xbola<200;xbola=xbola+25)
{
ellipse(xbola,100,10,10);
}
float ybola;
for(xbola=87.5;xbola<113.5;xbola=xbola+25)
{
for(ybola=12.5;ybola<200;ybola=ybola+25)
{
ellipse(xbola,ybola,10,10);
}
}
