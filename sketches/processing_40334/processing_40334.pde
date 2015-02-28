
//click the screen to make the circles appear and to change color
float circsize;
void setup()
{
 size(500,500);
 circsize = 10;
smooth(); 
}

void draw()
{
  if(mousePressed)
  {
  for(int y=0; y<height; y+=circsize){
     for(int x=0; x<width; x+=circsize) {
       fill(random(255), random(255), random(255));
       ellipse(x,y, circsize, circsize);
       fill(0);
       rect(x,y, circsize, circsize);
     }    
  }
}
}
void mouseMoved()
{
  noStroke();
  fill(255, 155, 55);
 ellipse(mouseX, mouseY, circsize, circsize);
 
}

