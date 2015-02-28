
PImage bg;

void setup() 
{
  size(500,333);

  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of "earth.jpg"
  // is 450 x 450 pixels.
  bg = loadImage("nature-3-500x333.jpg");
}

void draw() 
{
  background(bg);
  noStroke();
  fill(0,120);
 rect(0,0,500,333);
 fill(52,104,206,120);
 ellipse(100,50,50,50);
 fill(182,120,216,120);
 ellipse(150,150,75,75);
 ellipse(300,300,60,60);
 ellipse(480,200,75,75);
 ellipse(50,90,20,20);
 fill(112,232,141,120);
 ellipse(50,250,75,75);
 ellipse(450,50,50,50);
 ellipse(320,100,30,30);
fill(240,70,90,120);
ellipse(240,140,60,60);
ellipse(400,260,40,40);
ellipse(140,315,30,30);
 
 fill(52,104,206,120);
 ellipse(mouseX,mouseY,50,50);
fill(182,120,216,120);
 ellipse(mouseY,mouseX,75,75);
 fill(112,232,141,120);
 ellipse(mouseX,mouseY,75,75);
 fill(240,70,90,120);
ellipse(mouseY,mouseX,60,60);
}


