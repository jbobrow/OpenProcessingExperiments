
void setup()
{size(640,480);
smooth();
colorMode(3,1);}
void draw()


 
{int t=width,j=height;for(int i=0;i<t*j;i++)
 
 
// vertical or horizontal movement, and speed
{float n=noise((i%t)*.02,i*.03/j,frameCount*.06);
set(i%t,i/j,
//colour
color(.02+n*.05,n,1,.15));}
//
filter(95,10);}



