
PImage bg;

void setup() 
{
  size(500,402);

  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of "earth.jpg"
  // is 450 x 450 pixels.
  bg = loadImage("qqwrty.jpg");
}

void draw() 
{
  background(bg);


fill(158,101,170,110);
ellipse(mouseX, mouseY,100,100);
fill(134,170,105,140);
triangle(mouseX,mouseY,100,110,200,170);
fill(119,207,211,55);
triangle(mouseX,mouseY,100,450,250,450);
fill(193,35,101,45);
triangle(mouseX,mouseY,450,100,450,250);
fill(95,209,158,55);
triangle(mouseX,mouseY,85,256,170,256);
fill(227,232,101,45);
triangle(mouseX,mouseY,280,300,475,450);
fill(247,127,127,55);
triangle(mouseX,mouseY,350,65,400,75);
fill(240,161,58,55);
triangle(mouseX,mouseY,45,45,75,75);

ellipse(mouseX, mouseY, 15,15);



fill(158,101,170,110);
ellipse(mouseY, mouseX,100,100);
fill(134,170,105,140);
triangle(mouseY,mouseX,100,110,200,170);
fill(119,207,211,55);
triangle(mouseY,mouseX,100,450,250,450);
fill(193,35,101,45);
triangle(mouseY,mouseX,450,100,450,250);
fill(95,209,158,55);
triangle(mouseY,mouseX,85,256,170,256);
fill(227,232,101,45);
triangle(mouseY,mouseX,280,300,475,450);
fill(247,127,127,55);
triangle(mouseY,mouseX,350,65,400,75);
fill(240,161,58,55);
triangle(mouseY,mouseX,45,45,75,75);

ellipse(mouseY, mouseX, 15,15);

fill(219,110,0,45);
triangle(mouseX,mouseY,13,17,18,31);
triangle(mouseY,mouseX,13,17,18,31);

fill(0,49,219,45);
triangle(mouseX,mouseY,250,35,275,50);
triangle(mouseY,mouseX,250,35,275,50);

}


