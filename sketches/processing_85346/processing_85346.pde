
void setup()
{
  size(500, 500);
  background(250);
  smooth();
}



void draw()
{

//background(mouseX,mouseY,mouseX,mouseY);
fill(255);
translate (width/2, height/2);

for (int i=0; i<180; i+=10){
  rotate(radians(15));
noFill();
    
    for(int posX=25;posX< width;posX=posX+50)
    {
      for(int posY=25;posY< height;posY=posY+50)
      {
      ellipse(posX,posY,random(5,50),random(5,50));

println(mouseX);
}
    }
}}



