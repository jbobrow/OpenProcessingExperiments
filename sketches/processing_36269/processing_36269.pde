
//homework 3
//copyright Erica Gatts August 2011 Pittsburgh, PA 15214

float x, y;
color col;


void setup ()
{
  col = color(random(256), random(256), random(256));
  size (400, 400);
  smooth();
  background(col);
}

//this is my first interactive program: colored "fish eyes" that follow your mouse!
void draw () 
{
  //fat low-opacity line that follows mouse location
  strokeWeight(50);
  stroke(col, 10);
  line(pmouseX, pmouseY, mouseX, mouseY);
  
  //background color changes when you press the mouse
  if (mousePressed == true) {
    background(random(256), random(256), random(256));
  } 
  else {
    //otherwise, you get your randomly colored "fish eyes"
    noStroke();
    fill(random(256), random(256), random(256), random(50));
    ellipse(mouseX, mouseY, 100, 100);
    frameRate(15);
  }
  
  //saveFrame("eg_hmwk_3.jpg");
}


