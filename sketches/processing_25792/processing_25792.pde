
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 50;
int patternSeperationY = 50;


void setup(){
  
  size(200,400);
  
  //the white box simply shows you the space your pattern gets drawn in
  noFill();
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
  smooth();
  strokeWeight(10);
  stroke(255);
  noFill();
  ellipse(100,0,200,200);
  ellipse(0,100,200,200);
  ellipse(200,100,200,200);
  ellipse(100,200,200,200);
  ellipse(100,400,200,200);
  ellipse(0,300,200,200);
  ellipse(200,300,200,200);
  
  
}



void yourFunction(){
  
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  
  smooth();
  noStroke();
  //line(0,25,50,25);
  //line(25,0,25,50);
  //line(0,0,50,50);
  //line(0,50,50,0);
  //fill(random(80,150),random(50,70),190,150);//random(0,255));
  //ellipse(25,25,50,50);
  //ellipse(25,25,25,25);
  fill(25,40,150,150);
  ellipse(25,0,50,50);
  ellipse(25,50,50,50);
  fill(71,255,51,150);
  ellipse(0,25,50,50);
  ellipse(50,25,50,50);
    
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

