
size(800,800);
smooth();

for(int x=10; x<width-10; x +=10)
{
for(int y=10; y<width-10; y +=10)
 {

quad(x,y,   width/2,height/2,  width, height,  x-10,y-10);
 }
}

