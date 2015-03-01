
void setup()
{
  size(600,600);
  background(0);
}
void draw()
{
if(mousePressed) {
  translate(mouseX,mouseY);
  rotate(random(2*PI));
  stroke(random(0,255),random(0,255),random(0));
  strokeWeight(random(0,7));
  line(10,10,50,70);
  point(65,90);

}
}

void keyReleased() 
{  if (key=='s' || key=='S') 
{    background(255,255,0); 

}
}

