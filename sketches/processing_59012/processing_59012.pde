
 //Candice Ferreira. Problem set 3, Question 3
 //Remix
 
 float xoff = 0.0;
float xincrement = 0.01; 
// delayed framerate
void setup() {
  size(600,600);
  background(0);
  frameRate(5.0);
  smooth();
  noStroke();
}

void draw()
{
  // Create an alpha blended background
  fill(0, 10);
  rect(0,0,width,height);
  
  // Draw the ellipse. controlled by mouse instead of random
  fill(40, 135, 116);
  ellipse (mouseX+0,mouseY-0,(mouseX+mouseY)*0.1,(mouseX+mouseY)*0.1);

}



 


