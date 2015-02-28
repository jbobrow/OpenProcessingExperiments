
void setup()
{
  size(400,600); 
  background(0,0,255);
  smooth();
  frameRate(60);
}
 
void draw()
{
  //background(0,255,0);
  fill(random (255),random(255),random(255));
  //ellipse(mouseX,mouseY,50,50);
  noStroke();
  rect(random(width),random(height),random(25),random(25));
  ellipse(random(width),random(height),random(25),random(25));
  fill(random(255),random(255),random(255));
  rect(random(width),random(height),random(30),random(30));
  ellipse(random(width),random(height),random(30),random(30));
  ellipse(mouseX,mouseY,random(75),random(75));
}

void mousePressed()
{ 
  background(random(255),random(255),random(255));
  noLoop();
}

void keyPressed()
{
  loop();
  
  
}


  
  
  
  


