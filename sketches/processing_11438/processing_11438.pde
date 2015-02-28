


void setup()
{
  size (600, 600);
background (255, 238, 241);



}

void draw()
{
  if(mousePressed){
  fill(244, 241, 149);
} else {
   fill(82, 176, 184);
 }
  point(pmouseX, pmouseY);
  point(pmouseY, pmouseX);
  
}

