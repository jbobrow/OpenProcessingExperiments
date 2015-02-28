
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  
  smooth();
  frameRate(15);

}

 

void draw()//funtion loops;
{
 
background(random(255),random(255),random(255));
  
fill(random(255),random(255),random(255));

textSize(21);
textSize(mouseX/3);
textAlign(CENTER);
text("I♥U\nMerry!",mouseX,mouseY);

//noloop

}
