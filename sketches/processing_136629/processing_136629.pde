
//ICE
//Property of Miranda Jacoby 2014 All Rights Reserved
float elX, elY, reX, reY;

void setup()
{
  size (800, 400);
  smooth();
  //noStroke();
  fill(0);
  rect(0, 0, width/2, height);
  fill(255);
  rect(width/2, 0, width/2, height);
  elX = width/2 + height/20;
  elY = 0;
}

void draw ()
{

  while (reX < width/2)
  {
    fill(255, 0, 0);
    rect(reX, reY, width/40, height/20); 
    rect(reX, height - height/20, width/40, height/20); 
    reX = reX + width/40;
    
  }
  
  while (reY >= 0 && reY < height)
  {
    fill(255, 0, 0);
    rect(reX, reY, width/40, height/20); 
    rect(0, reY, width/40, height/20); 
    reY = reY + height/20;
  }

  
  for ( elX = width/2 + width/40; elX <= width; elX = elX + width/40)
  {
    fill(0, 0, 255);
    ellipseMode(CENTER);
    ellipse(elX, elY, width/40, height/20);
    //ellipse(width - elX + width/2, elY, height/20, height/20);
    ellipse(width * 1.5 - elX, elY, width/40, height/20);
    println(elX);
    elY = elY + height/20;
    //ellipse(width, 0, height/20, height/20);
  }
}



