
//Do What You Want, Assignment 3
//Copyright Information: Samantha Zucker, Pittsburgh PA 15287, September 2011

void setup()
{
  
  size(200,500);
  background(116,116,116);
  smooth();
   noStroke();
}

void draw(){

if(keyPressed)
{
    fill(random(30,256),random(30,256),random(220,256),20);
    ellipse(mouseX,mouseY,80,10);
}  
}  
void mouseDragged()
{
    fill(random(30,256),random(220,256),random(30,256),20);
    ellipse(mouseX,mouseY,80,10);
} 
void mouseMoved()
{
 
  fill(random(220,256),random(30,256),random(30,256),20);
  ellipse(mouseX,mouseY,80,10);
}
  
                                                
