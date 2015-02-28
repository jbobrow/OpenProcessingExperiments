
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup() {
  size(500,500);

  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  background(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);

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

  //**
  float k=25.5;
  int x=10;
  smooth();
  noFill();
  stroke(0,191,243,k);
  arc(0,100,5*x,5*x,-PI/2,0);

  //*
  noFill();
  stroke(0,191,243,2*k);
  arc(0,100,6*x,6*x,-PI/2,0);
  //*
  noFill();
  stroke(0,191,243,3*k);
  arc(0,100,7*x,7*x,-PI/2,0);
  //*
  noFill();
  stroke(0,191,243,4*k);
  arc(0,100,8*x,8*x,-PI/2,0);
  //*
  noFill();
  stroke(0,191,243,5*k);
  arc(0,100,9*x,9*x,-PI/2,0);
  //*
  noFill();
  stroke(0,191,243,6*k);
  arc(0,100,10*x,10*x,-PI/2,0);
  //*
  noFill();
  stroke(0,191,243,7*k);
  arc(0,100,11*x,11*x,-PI/2,0);
  //*
  noFill();
  stroke(0,191,243,8*k);
  arc(0,100,12*x,12*x,-PI/2,0);
  //*
  noFill();
  stroke(242,109,125,8*k);
  arc(100,0,8*x,8*x,PI/2,PI);
  //*
  noFill();
  stroke(242,109,125,7*k);
  arc(100,0,9*x,9*x,PI/2,PI);
  //*
  noFill();
  stroke(242,109,125,6*k);
  arc(100,0,10*x,10*x,PI/2,PI);
  //*
  noFill();
  stroke(242,109,125,5*k);
  arc(100,0,10*x,10*x,PI/2,PI);
  //*
  noFill();
  stroke(242,109,125,4*k);
  arc(100,0,11*x,11*x,PI/2,PI);
  //*
  noFill();
  stroke(242,109,125,3*k);
  arc(100,0,12*x,12*x,PI/2,PI);
  //*
  noFill();
  stroke(242,109,125,2*k);
  arc(100,0,13*x,13*x,PI/2,PI);
  //*
  noFill();
  stroke(242,109,125,k);
  arc(100,0,14*x,14*x,PI/2,PI);
  //*
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

