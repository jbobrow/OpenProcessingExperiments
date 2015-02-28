
float xoff = 0.0;
float xincrement = 0.01;

// delayed framerate
void setup() {
  size(800,800);
  background(0);
  frameRate(7.0);
 
}
 
void draw()
{
  // Create an alpha blended background
  fill(0, 10);
  rect(0,0,width,height);
   
  // Draw the ellipse. controlled by mouse instead of random

   smooth();
  strokeWeight(30);
stroke(201,45,136);
  fill(193,45,201);
  ellipse (mouseX+10,(mouseX+mouseY)*0.1,mouseY-10,(mouseX+mouseY)*0.1);
  
    smooth();
  strokeWeight(20);
stroke(127,45,201);
  fill(65,45, 201);
  ellipse((mouseX+mouseY)*0.1,mouseX+50,mouseY-50,(mouseX+mouseY)*0.1);
  
   smooth();
  strokeWeight(10);
stroke(45,111,201);
  fill(45,171, 201);
  ellipse ((mouseX+mouseY)*0.1,mouseX+100,mouseY-100,(mouseX+mouseY)*0.1);
  
   
   smooth();
  strokeWeight(5);
stroke(45,201,155);
  fill(45,201,98);
  ellipse (mouseX+150,mouseY-150,(mouseX+mouseY)*0.1,(mouseX+mouseY)*0.1);
 
 
}


