
// © Julia Shen
// yuans @ andrew.cmu.edu

float x, y, wd, ht;

void setup()
{
  size (400, 400);
  
  x = width * .5;
  y = height * .5;
  wd = width * .5;
  ht = height * .5; 
  
  background(163, 214, 229);
  frameRate(60);
  noStroke();
  smooth();
  
}


void draw()
{
 // ears
 noStroke(); 
 
 fill (163, 214, 229, 30);
 rect (0, 0, width, height);
 
 fill (252, 219, 81);
 triangle(mouseX - 110, mouseY - 110, mouseX - 90, mouseY - 20, mouseX - 40, mouseY - 85);
 triangle(mouseX + 110, mouseY - 110, mouseX + 90, mouseY - 20, mouseX + 40, mouseY - 85);
 
 fill (255, 194, 194); 
 triangle(mouseX - 100, mouseY - 100, mouseX - 85, mouseY - 18, mouseX - 35, mouseY - 80); 
 triangle(mouseX + 100, mouseY - 100, mouseX + 85, mouseY - 18, mouseX + 35, mouseY - 80);
  
 fill (252, 219, 81);
 ellipse (mouseX, mouseY, wd, ht);
 fill (252, 219, 81);
 
 
 // eyes
 stroke(0);
 strokeWeight(2); 
 line(mouseX - 50, mouseY, mouseX - 43, mouseY);
 line(mouseX + 43, mouseY, mouseX + 50, mouseY);
 
 
 // nose
 fill(0);
 ellipse(mouseX, mouseY + 20, wd * .03, ht * .03);
 
 
 //whiskers
 stroke(0);
 strokeWeight(1.5);
 line (mouseX - 79, mouseY + 43, mouseX - 68, mouseY + 40);
 line (mouseX - 75, mouseY + 50, mouseX - 65, mouseY + 45);
 line (mouseX - 71, mouseY + 57, mouseX - 62, mouseY + 50);

 line (mouseX + 68, mouseY + 40, mouseX + 79, mouseY + 43);
 line (mouseX + 65, mouseY + 45, mouseX + 75, mouseY + 50);
 line (mouseX + 62, mouseY + 50, mouseX + 71, mouseY + 57); 
 
 if (mousePressed == true)
{
  fill(0);
  ellipse(mouseX - 46, mouseY, wd * .04, ht * .04); 
  ellipse(mouseX + 46, mouseY, wd * .04, ht * .04); 
}

}

void keyPressed()
{
  if (key == ' ')
  {
    background (random(255), random(255), random(255));   
  }
  }



