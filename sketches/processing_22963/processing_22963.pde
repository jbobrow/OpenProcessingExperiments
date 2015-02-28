
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100 ;
int patternSeperationY = 100;


void setup(){
  size(500,500);
  
  //the white box simply shows you the space your pattern gets drawn in
  noFill();
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
 
  
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
 


strokeWeight(0);
 stroke(255);
  ellipse(50,50,100,100);
 
  
  stroke(0);
  
  arc(50, 50, 50, 50, 0, PI);

  stroke(0);
  ellipse(50,50,30,30);
  stroke(0);
  ellipse(50,50,90,90);
 
   stroke(0);
  ellipse(100,100,100,100);
   
  stroke(0);
  ellipse(50,50,50,50);
  
  arc(50,50,100,100,0,PI);
    arc(50,50,100,100,PI, TWO_PI);
  
  line(50,0,50,25);
  line(50,75,50,100);
    line(75,50,100,50);
  line(50,75,50,100);
    line(0,50,25,50);



 

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

