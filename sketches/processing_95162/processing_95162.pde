
//Patricia 
void setup(){
  size(200,200);
 
}
 
void draw(){
 
 size(200,200);
background(0);
fill (185, 241,169);
stroke(0);
 
int x;
int y;
 
for(x=0;x<201;x=x+35)
{
for(y=0;y<201;y=y+35)
{
rect(x,y,25,25);
}
}

  }
