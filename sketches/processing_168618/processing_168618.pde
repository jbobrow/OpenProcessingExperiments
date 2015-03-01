
 void setup()
{
  size(500,500);
 
}
void draw()
{
  if(key == 's'){
    println("saved");
    saveFrame("bild-###.png");
  }
  
  if(mousePressed)
  {
    //saveFrame("bild-###.png");
    
    
    
    fill(0);
    rect(mouseX, mouseY, 80,80);
  } 
  else
  {
    fill(250);
    ellipse(mouseX,mouseY,40,40);
  }
}
