
void setup()
{
  size(500, 750);
  background(250);
  smooth();
}



void draw()
{

fill(255);


println(mouseX);

ellipse(100,200,60,mouseY);
ellipse(200,200,60,mouseY);
ellipse(300,200,60,mouseY);
ellipse(400,200,60,mouseY);

ellipse(100,500,60,mouseY);
ellipse(200,500,60,mouseY);
ellipse(300,500,60,mouseY);
ellipse(400,500,60,mouseY);


noFill();
    
    for(int posX=50;posX< width;posX=posX+50)
    {
      for(int posY=50;posY< height;posY=posY+50)
      {
      ellipse(posX,posY,random(5,50),random(5,50));
      }
    }
}

void keyPressed () {
  
  background (255);

  fill (175);
  stroke (0);
}
  

//ALTERATION COMMME FINALITÉ


