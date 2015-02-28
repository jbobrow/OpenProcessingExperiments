
void setup()
{size(250,250);
smooth();
colorMode(3,1);}
void draw()

{int t=width,j=height;for(int i=0;i<t*j;i++)


// vertical or horizontal movement, and speed
{float n=noise((i%t)*.01,i*.03/j,frameCount*.005);
set(i%t,i/j,
//colour
color(.6+n*.65,n,1,.05));}
//
filter(35,10);}


