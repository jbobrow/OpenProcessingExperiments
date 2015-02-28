
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,500);
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(255,255,255);
  
  
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
  
  int pants;
  int shoes;
  
  for( pants = 0, shoes = 0; pants < 100; pants=pants+30, shoes=shoes+88)
  {
    if(pants <50)
    {
      fill(pants, shoes, 5);
    }
  stroke(0);
 ellipse( pants, shoes, 10, 10); 
  

  
  noFill();
  
stroke(pants, shoes, 90);
  strokeWeight(5);
  ellipse (50,50,pants,shoes);

  ellipse (50,50,shoes, pants); 
  


  

  
  noFill();

 stroke(pants, shoes, 90);
  strokeWeight(5);
  ellipse (50,50,pants,shoes);

  ellipse (50,50,shoes, pants); 
   
 
 stroke(255);
 line(0,0,100,pants);
 
  stroke(255);
 line(shoes,100,0,pants);
 
 
  stroke(pants, shoes, 90);
  strokeWeight(shoes);
  ellipse (50,50,pants,shoes);

  ellipse (50,50,shoes, pants); 
   
 
 stroke(255);
 line(100,0,100,shoes);
 
  stroke(255);
 line(shoes,0,100,shoes);
  }
 
 
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

