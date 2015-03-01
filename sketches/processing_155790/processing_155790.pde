

void setup () {

 size(500,500);
 smooth();
 background(255,255,255);
 
}

void draw()
{
  background(255,255,255);
  noCursor();
  stroke(255,0,0);
  strokeWeight(5);
  fill(255);
  ellipse(mouseX,mouseY,50,50);
  ellipse(mouseX,mouseY,30,30);
  ellipse(mouseX,mouseY,10,10);
  ellipse(mouseX,mouseY,5,5);

  if(frameCount > 300)
    {
    textSize(18);
    fill(0);
    text("hunt or be hunted", 50, 50); 
    
    }

  if(frameCount > 400) 
    {
      background(0);
      fill(0);
      noStroke();
      ellipse(mouseX,mouseY,100,100);
    }
  
    if(frameCount > 600)
    {
    noCursor();
    textSize(18);
    fill(255);
    text("use your flashlight", 50, 50); 
    
    }
  
  if(mousePressed)
    {
      noCursor();
      fill(255,255,0);
      noStroke();
      ellipse(mouseX,mouseY,100,100);
   
    }
   
  if(frameCount > 800)
  {
    fill(0);
    ellipse(450,450,10,5);
    ellipse(475,450,10,5);
 
    text("you are being watched",200,200);
  }
  

}
