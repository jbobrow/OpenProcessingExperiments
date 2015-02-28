
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
 
 
void setup(){
  size(500,500);
   
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  background(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
   
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
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
 
 
void yourFunction(){
   
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  
  //**
  fill(255);
  noStroke();
  smooth();
  //*
  fill(188,89,90);
  ellipseMode(CENTER);
  ellipse(50,50,100,100);
  //*
  fill(255,198,40);
  ellipseMode(CENTER);
  arc(0,100,100,100,-PI/2,0);
  //*
  fill(11,179,214);
  ellipseMode(CENTER);
  arc(0,100,50,50,-PI/2,0);
  //*
  fill(227,74,91);
  ellipseMode(CENTER);
  arc(100,100,100,100,-PI,-PI/2);
  //*
  fill(255,164,60);
  ellipseMode(CENTER);
  arc(100,100,50,50,-PI,-PI/2);
  //*
  fill(131,198,72);
  ellipseMode(CENTER);
  arc(0,0,100,100,0,PI/2);
  //*
  fill(120,83,168);
  ellipseMode(CENTER);
  arc(0,0,50,50,0,PI/2);
  //*
  fill(213,114,73);
  ellipseMode(CENTER);
  arc(100,00,100,100,-PI/2,PI);
  //*
  fill(152,151,141);
  ellipseMode(CENTER);
  arc(100,0,50,50,-PI/2,PI);
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
