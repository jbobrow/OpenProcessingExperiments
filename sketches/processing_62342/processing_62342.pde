
int counter;

void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(40);

}

void draw()
{  
fill( random(255), random(255),random(255));
  textSize(50); 
  textSize(mouseY/5);
  textAlign( CENTER );
  text( "☻", mouseX, mouseY);
if(key =='t')
{
  fill(0, 200, 56);  
}  
  
}
