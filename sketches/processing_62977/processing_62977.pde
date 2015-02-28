
//Quad/rects - pattern01

size(500,500);
background(0);
smooth();
 
fill(50);
stroke(250);
for(int x=2; x<width-70; x +=10)
{
for(int y=2; y<width-70; y +=10)
 {
 
quad(x,y,   width/2,height/2,  width, height,  x-80,y-80);
 }
}


