
/* 
Lots of Katamari Princes 
Created by Jasmine Rajavadee 
Feb. 16, 2015
*/ 


int a, b; 
float c; 

void setup()
{
  size(600, 600); 
  background(143, 196, 224); 
  smooth(); 
  rectMode(CENTER);
}

void draw()
{
  for (a = 0; a < 800; a = a + 200) 
  {
    for (b = 0; b < 800; b = b + 300) 
    {
      prince(a, b); //draws several princes 
    }
  }
}


//shapes that make up the prince
void prince(int x, int y) 
{
  noStroke();  
  fill(93, 139, 162); 
  ellipse(x, y + 150, 100, 50); 
  fill(154, 42, 180); 
  rect(x - 20, y + 125, 10, 70, 100); 
  rect(x + 20, y + 125, 10, 70, 100); 
  fill(146, 240, 80); 
  rect(x, y, 150, 70, 100); 
  rect(x, y + 50, 70, 100); 
  fill(12, 129, 44); 
  rect(x, y + 100, 90, 20, 100); 
  fill(230, 245, 32); 
  rect(x, y-5, 70, 60); 
  triangle(x, y - 75, x + 10, y - 25, x - 10, y - 25); 
  fill(234, 211, 168); 
  rect(x, y - 10, 50, 50); 
  fill(180, 56, 42); 
  ellipse(x, y - 75, 20, 20);
  rect(x, y, 10, 10); 
  fill(0); 
  ellipse(x - 15, y-10, 10, 5); 
  ellipse(x + 15, y-10, 10, 5);
}

/*void keyPressed()
{
  saveFrame("Prince.png"); 
}
*/ 
