
void setup()
{
 background(255);
 size(500,500);
 noFill();
 stroke(0,0,0,50);
 strokeWeight(3);
 smooth();
 rectMode(CENTER);
}

void draw()
{
 
  translate(mouseX,mouseY);
rotate(radians(millis())*10);
  ellipse(0,200,100,100);
  line(0,30,150,150);
  ellipse(0,100,150,150);
  line(30,0,100,100);
  
}
