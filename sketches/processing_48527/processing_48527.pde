
void setup()
{
 size(400,600);
 background(random(255),random(255),random(255));
 smooth(); 
 frameRate(15);
}


void draw()
{
  strokeWeight(1);
  fill(random(255),random(255),random(255),73);
  ellipse(mouseX,mouseY,mouseY,mouseY/2);
  line(mouseX,mouseY,width/2,height/2);
}




