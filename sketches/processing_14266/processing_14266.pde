
void setup() 
{  
  size(200,200);
  background(0);
  stroke(12,12,12);
  smooth();
  frameRate(30);

  stroke(0);
  ellipseMode(CENTER);
  ellipse(width/2,height/2,190,70);
}

void draw() 
{
  background(0);
  smooth();

  frameRate(30);
  
  //:Augenbraue
  fill(255);
  rectMode(CENTER);
  rect(100,35,170,15);
  
  //:Augenhöhle
  fill(255);
  ellipseMode(CENTER);
  ellipse(width/2,height/2,190,70);
  
  //:Augapfel
  int x = constrain (mouseX, 70, 130);
  fill(mouseX,0,mouseY);
  strokeWeight(6);
  ellipseMode(CENTER);
  ellipse(x,100,70,70);
  
  //:Pupille
  int m = constrain (mouseX, 53, 148);
  int n = constrain (mouseY, 80, 120);
  fill(0);
  stroke(0);
  ellipseMode(CENTER);
  ellipse(m,n,20,20);
}  

void mousePressed() //raises the eybrow
{
  frameRate(10);

  fill(0);
  rectMode(CENTER);
  rect(100,35,170,15);

  fill(255);
  rectMode(CENTER);
  rect(100,10,170,15);

  //:gives the coordinates in the comment box
  println (""+mouseX+"+"+mouseY+"");
}


void keyPressed() //closes the eyelids
{ 
  frameRate(7);

  fill(0);
  stroke(0);
  rectMode(CENTER);
  rect(width/2,70,200,55);

  fill(0);
  stroke(0);
  rectMode(CENTER);
  rect(width/2,130,200,45);
}

//copyright 2010 by Nick Byerly
//take it easy mofagel

