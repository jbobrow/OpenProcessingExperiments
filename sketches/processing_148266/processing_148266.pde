
void setup()
{
size(800,500); 
background(34,226,242); 

}
void draw()
{
background(34,226,242);
fill(90,84,84);
strokeWeight(5);
stroke(0);
ellipse(mouseX,mouseY, 200,100);  
fill(100,255,0);
ellipse(mouseX,mouseY-20,50,100);

} 
void mousePressed() 
{ 
  strokeWeight(10);
  stroke(0,255,0);
  line(random(600),700,mouseX,mouseY+55); 
} 






