
void setup()
{
size(640, 680);
background(50, 10, 100);
}

void mouseDragged()
{
  
float red = map(mouseX, 0, width, 0, 50);
 
//stroke(255, 255, 0, 100);
//rect(60, 40, 50, 30);

//point(50, 50);

   
ellipse(pmouseX, pmouseY, mouseX, mouseY);
ellipse(width/2+((width/2)-pmouseX),pmouseY,width/2+((width/2)-mouseX),mouseY);
 stroke(red, green, blue, 5);
  strokeWeight(2);

}
