


///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(250,500);

  smooth();
  
  
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
        noStroke();
        
      }
      scale(.5);
  }
  
}


void draw()
{
  
  //This is here so the program keeps running and the screengrab will work
}


void yourFunction(){
  
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)

 float circle = 950;
 float circleY = 910;
 color from = color(162,87,245, 80);
 color to = color (37,158,191,2);
 color intA = lerpColor (from,to,.2);
 color intB = lerpColor (from,to,.4);
 
 noStroke();
    fill (intA);
    while (circle<500)
    {
      ellipse (20,20,circle, circle);
      circle = circle +20;
    }
    fill(to);
    stroke(127,191,242);
    strokeWeight(4);
    while (circle<200){
      ellipse (0,0,circle,circleY);
      circle = circle +20;
    }
    fill(from);
    while (circle<100);{
      ellipse (0,0,circle,circle);
      circle = circle +.5;
      
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

