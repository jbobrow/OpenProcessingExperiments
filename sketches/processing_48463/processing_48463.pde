

void setup()
{
  size(800,800);
  background(255,255,255);
  smooth();
  textAlign(CENTER);
  textSize(36);
}

void draw()
{
 strokeWeight(50);
 ellipse(random(width/2),random(height/2),random(width),random(height));
 
  
  fill(255,255,255,75);
 rect(0,0,width,height);
  
  textSize(mouseY/10);
  fill(random(255),0,random(255)); //blue
  text("Google Earth is dope.",mouseX,mouseY);
  
}

