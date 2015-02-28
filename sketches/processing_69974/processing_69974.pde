
//HW5 Computing for the Arts with Processing
//Copyright 2012 Tony Zhang

//mouse input: left-click and drag to draw initials. right-click and drag to erase.
//keyboard input: space to change color scheme, hold shift to spawn colorful circles.

float wd,ht;
color col,col2,col3;

void setup()
{
  size(800,300);
  smooth();
  wd=40;
  ht=40;
  frameRate=200;
  col=color(random(255), random(255), random(255));
  col2=color(random(255), random(255), random(255),8);
  col3=color(random(255), random(255), random(255));
  noCursor();
  background(col3);
}

void draw()
{
  //background
  noStroke();
  fill(col2);
  rect(0,0,width,height);
  
  //pen
  strokeWeight(2);
  stroke(random(0,255),random(0,255),random(0,255));
  line(mouseX,mouseY,pmouseX,pmouseY);
  
  wd=random(40);
}

void mouseDragged()
{
  if (mouseButton == LEFT)
  {
    drawInitials(pmouseX,pmouseY,wd,wd,color(255,255,188));
  } 
  
  else if (mouseButton == RIGHT)
  {
    eraser(pmouseX,pmouseY,150,150,col3);
  }
}

void eraser( float ex,float ey,float ewd,float eht,color ecol)
{
  fill(ecol);
  noStroke();
  ellipse(ex,ey,ewd,eht);
}

void keyPressed()
{
  if (key == ' ')
  {
    col=color(random(255), random(255), random(255));
    col2=color(random(255), random(255), random(255),10);
    col3=color(random(255), random(255), random(255));
  }
  if (keyCode == UP)
  {
    wd=wd+10;
    ht=ht+10;
  }
  if (keyCode == DOWN)
  {
    wd=wd-10;
    ht=ht-10;
  }
  if (keyCode == SHIFT)
  {
    randomEllipse(random(width),random(height),random(100),random(100),col);
    
  }
}

void randomEllipse(float cx, float cy, float cwd, float cht, color ccol)
{
  fill(random(255), random(255), random(255));
  noStroke();
  ellipse(cx, cy, cwd, cwd);
}

void drawInitials(float x, float y, float wd, float ht, color tcol)
{
//bright blue circle
ellipseMode(CENTER);
fill(82,170,227);
noStroke();
strokeWeight(.5);
ellipse(x,y,wd*1.5,ht*1.5);

//yellow with red stroke
ellipseMode(CENTER);
fill(tcol);
stroke(200,0,0);
strokeWeight(1);
ellipse(x,y,wd,ht);

//thin red
ellipseMode(CENTER);
noFill();
stroke(200,0,0);
strokeWeight(1);
ellipse(x,y,wd*1.05,ht*1.05);

//thin white
ellipseMode(CENTER);
noFill();
stroke(255,255,255);
strokeWeight(1);
ellipse(x,y,wd*1.55,ht*1.55);
ellipse(x,y,wd*1.58,ht*1.58);
ellipse(x,y,wd*1.61,ht*1.61);
ellipse(x,y,wd*1.65,ht*1.65);
ellipse(x,y,wd*1.70,ht*1.70);
ellipse(x,y,wd*1.78,ht*1.78);
ellipse(x,y,wd*1.88,ht*1.88);
ellipse(x,y,wd*2,ht*2);

//thin dark blue
ellipseMode(CENTER);
noFill();
stroke(29,50,167);
strokeWeight(1);
ellipse(x,y,wd*1.48,ht*1.48);
ellipse(x,y,wd*1.44,ht*1.44);

//begin initials
beginShape();
  //t cap
    stroke(250,132,35);
    strokeWeight(1);
    //strokeCap(SQUARE);
    curveVertex(x,y+ht/10);
    curveVertex(x-wd/10,y);
    curveVertex(x-wd/4,y-ht/20);
    curveVertex(x-wd/2.4,y);
    curveVertex(x-wd/2.2,y+ht/10);
endShape();

beginShape();
  //t stem
    stroke(26,69,160);
    strokeWeight(1);
    //strokeCap(SQUARE);
    curveVertex(x-wd/4,y-ht/10);
    curveVertex(x-wd/4,y);
    curveVertex(x-wd/4,y+ht/3.1);
    curveVertex(x-wd/4,y+ht/3);
endShape();

beginShape();
  //t stem pt.2
    stroke(200,0,0);
    strokeWeight(1);
    //strokeCap(SQUARE);
    curveVertex(x-wd/5,y-ht/10);
    curveVertex(x-wd/5,y+ht/10);
    curveVertex(x-wd/5,y+ht/3.6);
    curveVertex(x-wd/5,y+ht/2);
endShape();

beginShape();
  //y top
    stroke(200,0,0);
    strokeWeight(1);
    //strokeCap(SQUARE);
    curveVertex(x-wd/10,y-ht/2);
    curveVertex(x-wd/10,y-ht/3);
    curveVertex(x-wd/12,y-ht/7);
    curveVertex(x,y-ht/10);
    curveVertex(x+wd/12,y-ht/7);
    curveVertex(x+wd/10,y-ht/3);
    curveVertex(x+wd/10,y-ht/2);
endShape();

beginShape();
  //y stem
    stroke(26,69,160);
    strokeWeight(1);
    //strokeCap(SQUARE);
    curveVertex(x,y-ht/1.5);
    curveVertex(x,y-ht/5);
    curveVertex(x,y+ht/2.5);
    curveVertex(x,y+ht/1.5);
endShape();

beginShape();
  //z middle
    stroke(200,0,0);
    strokeWeight(1);
    //strokeCap(SQUARE);
    curveVertex(x+wd/2,y-ht/5);
    curveVertex(x+wd/2.7,y);
    curveVertex(x+wd/6.5,y+ht/6);
    curveVertex(x+wd/8,y+ht/3);
    curveVertex(x+wd/9,y+ht/2);
endShape();

beginShape();
  //z top
    stroke(250,132,35);
    strokeWeight(1);
    //strokeCap(PROJECT);
    curveVertex(x,y+ht/10);
    curveVertex(x+wd/8,y);
    curveVertex(x+wd/2.7,y);
    curveVertex(x+wd/2,y+ht/10);
endShape();

beginShape();
  //z bottom
    stroke(26,69,160);
    strokeWeight(1);
    //strokeCap(SQUARE);
    curveVertex(x,y+ht/3.3);
    curveVertex(x+wd/6,y+ht/3.3);
    curveVertex(x+wd/3.2,y+ht/3.3);
    curveVertex(x+wd/2,y+ht/3.3);
endShape();
}

