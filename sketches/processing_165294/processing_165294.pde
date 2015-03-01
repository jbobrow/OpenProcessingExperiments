
void setup()
{
  size(800,800);
  background(0,255,255);
}

void draw()
{
  for(int y=0; y<=height*2; y+=120){
    for (int x= 0; x<=width*2; x+=120) {
      
triangle(x,y,x-30,y+30,x+30,y+30);
triangle(x+60,y,x+30,y+30,x+90,y+30);
triangle(x-30,y+30,x+30,y+90,x+90,y+30);
fill(255,0,0);
noStroke();
  

  }
}
}
