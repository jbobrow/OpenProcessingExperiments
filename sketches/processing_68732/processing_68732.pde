
//HW3 Computing for the Arts with Processing
//Copyright 2012 Tony Zhang

float x,y,wd,ht;

void setup()
{
  size(960,480);
  smooth();
  frameRate(120);
  x=100;
  y=0;
  wd=70;
  ht=40;
  textSize(155);
  noCursor();
}

int value=0;

void draw()
{
//background  
background(mouseX,mouseY,200);

//rectangle
fill(mouseY,mouseX,value,value);
stroke(200,mouseX,mouseY);
strokeWeight(mouseY*.015);
rect(x%width,frameCount%height,frameCount/wd,ht);

//framecounter
textAlign(CENTER);
text(frameCount,width*.5,height*.62);

//mouse tracking
ellipse(mouseX, mouseY, wd, wd);
line(x%width, y%height, pmouseX, pmouseY); 
line((x+(frameCount/wd))%width, (y+ht)%height, pmouseX, pmouseY);
line(x%width, (y+ht)%height, pmouseX, pmouseY);
line((x+(frameCount/wd))%width, y%height, pmouseX, pmouseY);

//movement
y=y+1;
x=x+random(-1,3);

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

