
//Hannah Schmitt (hschmitt@andrew.cmu.edu
//Copyright Hannah Schmitt, Carnegie Mellon University, 2012
//Homework 4

//move the mouse around to read words
//press the space bar to change the background color
//click the mouse to change the text color

float wd, ht, x, y;
color c;
void setup()
{
    size(400,400);
    smooth();
    background(246, 72, 152);
    wd =100;
    ht =75;
    frameRate(70);
}

void draw()
{ 
   fill(129, 167, 232, 20);
  stroke(210, 211, 209, random(10));
  rect(mouseX, mouseY, 300, 250);
 
 

 //fill(234, 200, 150);
 textAlign(CENTER);
 textSize(150);
 strokeWeight(2);
 stroke(255);
 fill(c);
 text("Live.",200,frameCount%height*0.5);
 text("Love.", 200, frameCount%height*1);
 text("Laugh.",200, frameCount%height*1.5);

  
}

void keyPressed ()
{
  if (key == ' ')
  {
    background(random(255),random(255),random(255));
  }
//  if (key=='c')
//  { fill(random(255), random(255), random(255));
//    noStroke();
//    rect(mouseX, mouseY, 300, 250);
//  }
}
 
void mousePressed()
{
 c = color(random(255),random(255),random(255));
 
 }



