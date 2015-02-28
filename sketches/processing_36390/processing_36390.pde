
//Homework 3
//Copyright Kinnari Thakker August 2011, Pittsburgh 15224

color col; //declaring variables

void setup()
{
  size(400,400);
  smooth();
  background(168, 156, 90,1);
}

void draw() //crazy randomized rects. creating blue-green texture
{
  fill(100, 120, 120,20); 
  col=color(random(20), random(255), random(255),20);
  fill(col);
  rect(mouseX,mouseY,random(60),random(100));  
}

void mouseDragged() //draws strong horizontals
{
  fill(0);
  ellipse(mouseX,mouseY,4,4); 
}


//press any key to save the artwork
void keyPressed() 
{
  //saveFrame("screenshot-####.jpg");
} 

