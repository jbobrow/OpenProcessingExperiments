
//Sarah Anderson, seanders
//HW4
//Copyright Sarah Anderson CMU 2012 All Rights Reserved
//when the mouse is moved, greyscale circles are drawn across the screen
//if the mouse button is held, the circles become color
//if the mouse button is released, the circles go back to greyscale
//if any printed keyboard key is pressed, the screen gets reset
float x, y, di;

void setup()
{
size(400,400);
smooth();
background(50);
x=0;
y=0;
di=50;
}

void draw()
{
strokeWeight(6);
fill(255);
ellipse(mouseX,mouseY,di, di);
if (mousePressed){
  fill(random(255),random(255),random(255));
  stroke(random(255),random(255),random(255));
  ellipse(mouseX,mouseY,di, di);
  }else{
  fill(random(255)); 
  stroke(random(255));
  ellipse(mouseX,mouseY, di, di);
  }
if (keyPressed){
   background(50);
  }
}


