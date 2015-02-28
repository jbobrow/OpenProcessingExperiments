
void setup () 
{
size(200,200);
background(120);
smooth();
}

void draw ()
{
  fill(120,40,35);
  ellipse(mouseX,mouseY,30,30);
  ellipse(180,120,20,20);
  ellipse(50,30,10,10);
  ellipse(70,150,40,40);
  println(mouseX); 
}


