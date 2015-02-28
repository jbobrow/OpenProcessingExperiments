
//A SIMPLE MOUSE PROGRAM
//THE CORSEHEAD SPAGHETTI COMPANY
//6.10.11

void setup()
{
  size(500, 500); 
  background(25);
}

int r, g, b;
void draw()
  {
    r = int(mouseX * mouseY);
    g = int(mouseX - mouseY);
    b = int(mouseX + mouseY); 
    stroke (r, g, b);
    fill (r, g, b);
    ellipse(mouseX, mouseY, 50, 50);
  }
  
void mousePressed()
{
stroke (random(255), 0, random(255));
fill (random(255), 0, random(255));
ellipse (mouseX + 100, mouseY + 100, 50, 50);

stroke (random(255), 0, random(255));
fill (random(255), 0, 0);
ellipse (mouseX - 100, mouseY - 100, 50, 50);
}

//this nobulates the EMRs

void mouseReleased()
{ 
  stroke(0, 255, 0);
  fill(0, 255, 0);
  ellipse (mouseX + 100, mouseY + 100, 50, 50);
}

void mouseDragged()
{ 
stroke (random(255), 0, 0);
fill (0, 0, random(255));
ellipse (mouseX + 100, mouseY + 100, 50, 50);

stroke (random(255), 0, random(255));
fill (random(255), 0, 0);
ellipse (mouseX - 100, mouseY - 100, 50, 50);
}

