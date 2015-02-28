
float swapped = 0;

void setup()
{
  background(0);
  size(640,480);
}

void draw()
{

  background(0);
  
  if(mousePressed)
  {
    if(swapped < 1)
    {
      swapped = swapped + 0.01;
    }
  }else{
    if(swapped > 0)
    {
      swapped = swapped - 0.01;
    }
  }
  
  textAlign(CENTER);

  textSize(48);

  text("S",lerp(width/2 - 45,width/2 + 45, swapped), height/2);
  text("w", lerp(width/2 - 15,width/2 + 15, swapped), height/2);
  text("a", lerp(width/2 + 15,width/2 - 15, swapped), height/2);
  text("p",lerp(width/2 + 45,width/2 - 45, swapped), height/2);
  
  if(swapped >= 1)
  {
    ellipseMode(CENTER);
    ellipse(480,360,30,30);
    ellipse(480,330,15,15);
    ellipse(500,340,15,15);
    ellipse(460,340,15,15);
    
    ellipse(410,360,30,30);
    ellipse(410,330,15,15);
    ellipse(430,340,15,15);
    ellipse(390,340,15,15);
  }
  
}




