
void setup()
{
size(400,200);
}

void draw()
{
background(mouseX,mouseY,random(255),100);
  
for( int x=0; x<400; x=x+3 ) {
  stroke(random(255),random(255),random(255));
  line(x,0,random(400),400);
  
}
 
}
                
