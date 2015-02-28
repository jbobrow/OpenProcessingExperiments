
int myDiameter = 251;

void setup()
{
  background(0);
  size(400,400);
  frameRate(30);
  rectMode(CENTER);
  textSize(10);
  noCursor();
}

void draw()
{
  
}
void mouseMoved()
{
background(0);


if (myDiameter < 251)
{
  
  fill(255,20,30);
  textSize(26);
  strokeWeight(5);
  textAlign(CENTER);
  text("boom, headshot!!!",mouseX,mouseY-155);
  ellipse(mouseX,mouseY,myDiameter,myDiameter);
  fill(0);
  rect(mouseX,mouseY,myDiameter,10);
  rect(mouseX,mouseY,10,myDiameter);
  fill(255);
  text("Press a Key to Reload",200,350);
  
}
  
 else {
        fill(255);
        noStroke();
        ellipse(mouseX,mouseY,myDiameter,myDiameter);
        fill(0);
        noStroke();
        rect(mouseX,mouseY,myDiameter,10);
        rect(mouseX,mouseY,10,myDiameter);
       }
       
}
 
void keyPressed()
{
  if (keyPressed == true)
  {
      myDiameter = 251;
     
  }
}

void mousePressed()
{
  myDiameter = 250;
}


