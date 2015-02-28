
void setup()
{
  size (900,650, P3D);
  background(38,32,42);
}

void draw()
{

  fill(random(255),random(255),random(255));
  triangle(mouseX,mouseY, 300,300,200,200);


 fill(18,213,222,50);
 
 if(mouseY>300)
 {
   fill(255,255,255,50);
 }
ellipse(mouseX,mouseY, 50,50); 
}


