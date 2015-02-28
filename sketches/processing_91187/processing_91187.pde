
float [] shapes = {25,50,75,100,0};

void setup()
{
 size (500,400); 
}

void draw()
{
  fill(0);
  background(255);
  rect(0,0,20,height);
  rect(width - 20,0,20,height);
  rect(0,height - 20,width,20);
  fill(shapes[4]);
  for (int i = 0; i < shapes.length; i++)
   { rect(shapes[i],shapes[i],shapes[i],20);
  
  if (mouseX <= 20 || mouseX >= width - 20 || mouseX > 0 && mouseY >= height - 20)
  shapes[i] = shapes[i] + 1; }
}
