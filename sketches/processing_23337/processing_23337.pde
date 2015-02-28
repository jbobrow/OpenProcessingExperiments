
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////

//what happens if you change these both to 50? what are they doing to the pattern?

int patternSeperationX = 50;
int patternSeperationY = 50;


void setup() {
  size(250,500);
  smooth();
  //the white box simply shows you the space your pattern gets drawn in
  fill(255,0,2);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  background(0,50,150);
  stroke(3);
fill(0,200,50);
  ellipse(125,75,100,100);
  fill(255);
  ellipse(100,55,25,35);
  ellipse(150,55,25,35);
  fill(0);
  ellipse(150,60,10,10);
  ellipse(100,60,10,10);
  ellipse(125,80,5,5);
  fill(50);
  stroke(50);
  rect(50,275,250,310);
  stroke(0);
  strokeWeight(3);
  noFill();
  arc(125, 75, 80, 80,PI/6, PI/2);
  strokeWeight(1);
  line(125,25,125,10);
  line(123,25,123,10);
  line(121,25,121,10);
  line(127,25,127,10);
  line(129,25,129,10);
  strokeWeight(5);
  line(125,125,125,225);
  strokeWeight(3);
  line(125,175,80,140);
  line(80,140,70,100);

  line(125,175,145,200);
  line(145,200,145,220);
  line(125,225,115,300);
  line(125,225,135,300);
  line(135,300,140,300);

  strokeWeight(1);
  fill(0);
  ellipse(70,100,5,5);
  line(70,100,75,93);
  line(70,100,70,91);
  line(70,100,65,91);
  line(68,100,68,91);

  strokeWeight(1);
  fill(50);
  strokeWeight(3);
  line(115,300,112,304);
  strokeWeight(1);
  noStroke();
  triangle(0,311,50,275,100,311);
  fill(80);
  rect(0,310,250,500);
  stroke(1);
  strokeWeight(4);
  rect(0,310,50,500);
  rect(50,310,50,500);
  rect(100,310,50,500);
  rect(150,310,50,500);
  rect(200,310,50,500);

 
  




  for(int i = 0; i < width/patternSeperationX; i++) {
    for(int j = 0; j < height/patternSeperationY; j++) {
      pushMatrix();
      translate(i*patternSeperationX, j*patternSeperationY);
      yourFunction();
      popMatrix();
    }
  }
}


void draw()
{
  //This is here so the program keeps running and the screengrab will work
}


void yourFunction() {

  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
}

void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}


