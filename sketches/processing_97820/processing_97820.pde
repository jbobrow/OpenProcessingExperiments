
// A simple game create using the skills learnt in 'Basic Variables' tutorial

void setup()
{
  size(500, 500);// canvas size
  smooth();// smooth lines
  println("void setup is running");
  //background(300,100,100);// background colour is light red
  ellipse(250,250,70,70);

  
}


void draw()
{
   background(300,100,100);// background colour is light red
   fill(300,100,100);//makes circles same colour as background
   stroke(0);//black outline
   ellipse(250,250,70,70);//3 ellipses which will create the targets for game
   ellipse(150,250,70,70);
   ellipse(350,250,70,70);

  int y = 100+mouseY;
  int s = 70;
  
  fill(255,0,0,191);//makes the moving circles 50% opacity
  noStroke();//no stroke on circles
  ellipse(150, y, s, s);//moves left circle horizontally
ellipse(mouseX, 250, s, s);//moves centre circle vertically
  ellipse(350, y, s, s);//moves right circle horizontally
  println("void draw is running");
  
  
  
  
}


