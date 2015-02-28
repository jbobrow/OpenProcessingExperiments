
void a ()
{ 
  rectMode(CENTER);
}
void b ()
{ 
  ellipseMode(CENTER);
}

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
  drawEyebrow();
  drawSocket();
  drawEye();
  frameRate(30);
}

void mousePressed() //raises the eybrow
{
  frameRate(10);
  raiseEyebrow();
} 

void keyPressed() //closes the eyelids
{ 
  closeEye();
  frameRate(7);
}




void drawEyebrow() {
  fill(255);
  a();
  rect(100,35,170,15);
}

//Eyesocket
void drawSocket() {
  fill(255);
  b();
  ellipse(width/2,height/2,190,70);
}

//Eyeball
void drawEye() {
  int x = constrain (mouseX, 70, 130);
  fill(mouseX,0,mouseY);
  strokeWeight(6);
  b();
  ellipse(x,100,70,70);

  //Pupil
  int m = constrain (mouseX, 53, 148);
  int n = constrain (mouseY, 80, 120);
  fill(0);
  stroke(0);
  b();
  ellipse(m,n,20,20);
}

void raiseEyebrow()
{
  fill(0);
  int a;
  rect(100,35,170,15);

  fill(255);
  a();
  rect(100,10,170,15);
}

void closeEye()
{
  fill(0);
  stroke(0);
  int a;
  rect(width/2,70,200,55);

  fill(0);
  stroke(0);
  a();
  rect(width/2,130,200,45);
}

//copyright 2010 by Nick Byerly
//take it easy mofagel


