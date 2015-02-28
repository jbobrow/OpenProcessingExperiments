
//HW4 Computing for the Arts with Processing
//Copyright 2012 Tony Zhang
//keyboard input: Spacebar to speed up, shift and control to change the width and height of the "brush," respectively, and enter to start over with a new background color.
//mouse input: Click and drag to reveal framecounter and to change stroke opacity. Move mouse around to change stroke color and stroke weight.

float x,y,wd,ht,value;

void setup()
{
  size(960,480);
  smooth();
  frameRate(120);
  x=100;
  y=0;
  wd=70;
  ht=40;
  value=0;
  textSize(155);
  noCursor();
  background(random(255),random(255),random(255),random(255));
}

void draw()
{
//rectangle
fill(mouseY,mouseX,value,value);
stroke(200,mouseX,mouseY);
strokeWeight(mouseY*.015);
rect(x%width,frameCount%height,wd,ht);

//framecounter
textAlign(CENTER);
text(frameCount+":"+frameCount/60,width*.5,height*.62);

//mouse tracking
ellipse(mouseX, mouseY, wd, wd);
line(x%width, y%height, pmouseX, pmouseY); 
line((x+(wd))%width, (y+ht)%height, pmouseX, pmouseY);
line(x%width, (y+ht)%height, pmouseX, pmouseY);
line((x+(wd))%width, y%height, pmouseX, pmouseY);

//movement
y=y+1;
x=x+random(10);

//pen
stroke(random(0,255),random(0,255),random(0,255));
line(mouseX,mouseY,pmouseX,pmouseY);
}

void mousePressed() {
  if(value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}

void mouseReleased() {
  if(value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}

void mouseDragged() 
{
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    x=x+10;
  }
  if (keyCode == SHIFT)
  {
    wd = random(50,150);
  }
  if (keyCode == CONTROL)
  {
    ht = random(10,70);
  }
  if (key == ENTER)
  {
    background(random(255),random(255),random(255),random(255));
  }
}


