
//Fooling around with positions, relative to the mouseX

void setup()
{
  size(400, 400);
  smooth();
}

void draw()
{
  background(100);

  ellipse(mouseX, mouseY, 50, 50);
  ellipse(mouseX*2, mouseY+50, 50, 50);
  ellipse(mouseX/2, mouseY+100, 50, 50);

  //A little bit zanier...
  //normalize the mouse position (get it between 0 and 1
  float n = mouseX/400.0;
  //float n = norm(mouseX, 0,width); //or try this!
  float nx = (n*n) * 400.0; //a factor of n squared, scaled up to the canvas
  //float nx = pow(n,2) * 400.0; //or try this!
  ellipse(nx, mouseY+150, 50, 50);
}


