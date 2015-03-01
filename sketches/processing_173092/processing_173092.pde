
void setup()
{
  size (600, 600); 
  background (88, 88, 88);
  noStroke();
}

void draw ()
{
    noStroke();
  fill (88, 88, 88);
  rect(0, 0, width, 450); 

  if (mouseX >=280 && mouseX <=320){

    if (mousePressed == true) {
      {
        fill(255, 116, 116);
        triangle (300, 100, 500, 450, 100, 450);
        fill (255, 232, 157);
        triangle (300, 250, 400, 450, 200, 450);
        fill (255, 250, 157);
        triangle (300, 350, 250, 450, 350, 450);
      }
    } else
  {
    fill (88, 88, 88);  
  rect(0, 0, width, 450);
}
} else
{ 
  stroke (170);
  ellipse (300, 500, 10, 10);
}

}
