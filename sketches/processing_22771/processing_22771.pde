
///////////////////////////////////////////////
/// Written by Levi Berge, 4th March 2011   ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,500);
  smooth ();
  background(55, 20, 255);
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  //rect(0,0,patternSeperationX,patternSeperationY);
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
 

  
fill(0, 0, 0);


  //line(0,0,50,50);
  //line(0,50,50,0);
    
 
 


triangle(0, 75, 25, 50, 0, 25);  
triangle(100, 75, 75, 50, 100, 25);

triangle(30, 0, 50, 30, 70, 0);
triangle(30, 100, 50, 70, 70, 100);

//triangle(30, 50, 50, 60, 50, 40);
//triangle(70, 50, 50, 60, 50, 40);

triangle(0, 10, 15, 35, 10, 0);
triangle(100, 90, 75, 55, 90, 100);

triangle(100, 10, 75, 25, 10, 100);
triangle(0, 90, 25, 75, 90, 0);
  
  fill (100, 0, 0, 175);
  noStroke();
  triangle(27, 42, 66, 76, 80, 19);
  
  triangle(0, 10, 0, 0, 10, 0);
  triangle(100, 90, 100, 100, 90, 100);
  
  triangle(0, 65, 25, 50, 0, 35);  
  triangle(100, 65, 75, 50, 100, 35);
  
  triangle(15, 0, 50, 15, 85, 0);
  triangle(15, 100, 50, 85, 85, 100);
  
    //triangle(30, 60, 50, 40, 50, 10);



  
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

