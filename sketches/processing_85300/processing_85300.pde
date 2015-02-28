
void setup()
{
  size(700, 500);
  background(250);
  smooth();
}



void draw()
{

//background(mouseX,mouseY,mouseX,mouseY);
fill(255);

ellipse(100,250,60,mouseY);
ellipse(200,250,60,mouseY);
ellipse(300,250,60,mouseY);
ellipse(400,250,60,mouseY);
ellipse(500,250,60,mouseY);
ellipse(600,250,60,mouseY);
println(mouseX);


noFill();
    
    for(int posX=25;posX< width;posX=posX+50)
    {
      for(int posY=25;posY< height;posY=posY+50)
      {
      ellipse(posX,posY,random(30,50),50);
      }
    }
}


