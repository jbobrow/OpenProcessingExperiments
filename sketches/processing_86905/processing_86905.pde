
int myX;
int myY;
int mouthWidth;
int mouthColour;

void setup()
{
  size(800,600);
}
void draw()
{
  myX=mouseX;
  myY=mouseY;
  mouthWidth=120;
  mouthColour=255;
  frameRate(30);
  background(139,131,120);
  //top//
  noStroke();
  fill(216,0,0);
  arc(myX+150,myY,300,350,PI,TWO_PI);
  fill(255,180,165);
  ellipse(myX+150,myY,300,70);
  //spot//
  fill(255);
  ellipse(myX+160,myY-70,60,40);
  ellipse(myX+50,myY-55,50,40);
  ellipse(myX+240,myY-60,45,38);
  ellipse(myX+100,myY-115,50,40);
  ellipse(myX+200,myY-120,45,36);
  //bottom//
  fill(255,180,165);
  rectMode(CENTER);
  rect(myX+150,myY+50,150,150,40);
  //eyes//
  fill(255);
  stroke(0);
  strokeWeight(2);
  ellipse(myX+100,myY+25,60,60);
  ellipse(myX+180,myY+25,60,60);
  fill(0);
  ellipse(myX+80,myY+25,11,11);
  ellipse(myX+160,myY+25,11,11);
  //mouth//
  if (mousePressed) {
    mouthWidth=15;
    mouthColour=0;
  }
  fill(mouthColour);
  rect(myX+150,myY+90,mouthWidth,15,7);
}




