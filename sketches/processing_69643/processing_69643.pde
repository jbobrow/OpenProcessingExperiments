

boolean mouseIsDown;

void setup()
{
  size(1500,800);
  frameRate(30);
  smooth();
  mouseIsDown = false;
}
void draw() 
{ 
  //background( 0, 0, 0);
  fill(0,0,0, 3);
  rect(0,0, 1500, 800);
  fill(mouseX, mouseY, 100); 
  //noStroke();
  float bingo = round(random(1,60));
 
  if(mouseIsDown == true)
  { 
    stroke(mouseX, mouseY, 100);
    strokeWeight(10);
    line(mouseX, mouseY, pmouseX, pmouseY);
    noStroke();
    //ellipse(100, random(800), random(50), random(50));
    //ellipse(175, random(800), random(25), random(25));
    ellipse(1400, random(800), random(50), random(50));
    ellipse(1325, random(800), random(25), random(25));
    if(bingo < 20)
    {
    ellipse(mouseX, mouseY, random(50), random(50));
    }

  }
    
}

void mousePressed()
{
  println("Mouse is pressed");
  mouseIsDown = true;
}

void mouseReleased()
{
 println("Mouse is released");
 mouseIsDown = false; 
}

