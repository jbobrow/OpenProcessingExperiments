
void setup()
{
  size(300,300);
}

void draw()
{
  background(72,178,198);
  
  faceDraw(mouseX,mouseY);
  
  if (mousePressed)
  {
    faceDraw2(mouseX,mouseY);
  }
}

void faceDraw(int a , int b)
{
  strokeWeight(5);
  fill(240,196,152);
  ellipse(a, b, 100, 100); 
  
  line(a,b-5,a,b+5);
  
  fill(0);
  ellipse(a-20, b-25, 10, 10);
  ellipse(a+20, b-25, 10, 10);
  
  noFill();
  arc(a, b+15, 30, 30, 0, PI);
}

void faceDraw2(int a, int b)
{
  fill(232,82,152);
  ellipse(a, b, 100, 100);

  
  noFill();
  ellipse(a-20, b-25, 10, 10);
  ellipse(a+20, b-25, 10, 10);
  
  ellipse(a, b+15, 10, 30);
  
  line(a-15, b-35, a-25, b-45);
  line(a+15, b-35, a+25, b-45);
}
