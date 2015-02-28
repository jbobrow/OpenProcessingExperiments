
void setup()
{
size (600,600);  
background(0);
 smooth();
 
}
void draw ()
{
 if(keyPressed){
   if(key == ' ')
  {
    saveFrame("line-####.jpg");
    background(255);
  }
 }   
  fill(116,193,55,40);
  ellipse(mouseX,mouseY,mouseX,mouseY);
  } 

  



