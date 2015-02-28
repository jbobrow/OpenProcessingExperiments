
                
                //homework 3
//copyright Emily So
float x, y;//variable declarations

void setup()
{
 size(500, 600);
 smooth();
 strokeWeight(1);
 stroke(100, 0, 50);
 fill(255, 0, 0);
 //noCursor();
 //frameRate(5);
}

void draw()
{
  fill(0, 200, 230);
triangle(mouseX + 12, mouseY + 20, mouseX + mouseX, mouseY + mouseY, mouseX - 10, mouseY);
fill(0, 10, 20);
triangle(mouseY - mouseY, mouseX - mouseX, mouseX - mouseY, mouseY - mouseY, mouseX - 14, mouseY - 14);
}



  //println(frameRate);
 
void mouseDragged()
{
  background(0, 20, 20);
  fill(random(255), 200, 200);
ellipse(mouseX + mouseX, mouseY - mouseX, random(500), random(300));
fill(random(50), random(100), random(80));
ellipse(mouseX + mouseX, mouseY - mouseX, 50, 50);
rect(mouseX, mouseY, 20, 20);
fill(random(255), 100, 0);

ellipse(mouseY + mouseX, mouseX, random(400), 14);
fill(random(255), random(255), random(255));
ellipse(mouseY + mouseY, mouseY - mouseX, 12, random(200));
}

void mouseClicked()
{
  background(200, 0, 200);
  line(mouseX, 20, pmouseX, 80);
}
void keyPressed()
{
  fill(255, random(300), random(255));
  ellipse(mouseX + mouseX, mouseX - mouseY, random(300), random(200));
  ellipse(mouseX + mouseX, mouseY - mouseX, random(300), random(250));
  ellipse(mouseX + mouseX, mouseY - mouseX, 50, 50);
}

void keyReleased()
{
  line(mouseX - 30, mouseY - 50, mouseX - 20, 20);
  ellipse(mouseY+mouseX, mouseY - mouseX, random(100), random(100));
}               
