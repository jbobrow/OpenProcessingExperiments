
//hw3
//copyright jingjing chen jingjin1@andrew.cmu.edu

void setup()
{   
  background(0);
  size(400,400);
  smooth();
}

void draw()
{ 
  fill(random(200,255),random(0,10));
  noStroke();
  
  if (mousePressed == false) 
{
ellipse(mouseX,mouseY,abs(0.5*width-pmouseX),abs(0.5*height-pmouseX));
}

else {
background(0);
fill(0);
}
}




