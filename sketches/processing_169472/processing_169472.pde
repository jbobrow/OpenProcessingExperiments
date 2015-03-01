
void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{


  fill(255,30);
  rect(0,0,width, height);
  translate(mouseX,mouseY);
 
  noStroke();
  fill(0);
  rect(20, 20, 70, 120);

  fill(255);
  rect(50, 50, 70, 120);
  
  fill(0);
  rect(80, 80, 70, 120);
  
    fill(255);
  rect(110, 110, 70, 120);

  fill(0);
  rect(140, 140, 70, 120);
  
  fill(255);
  rect(170, 170, 70, 120);
}



