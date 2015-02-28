
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(600,600);

  
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
   
  
  ellipse(50,50,95,95);
  fill(255);
  ellipse(50,50,90,90);
  
  ellipse(50,50,85,85);
   fill(255);
  ellipse(50,50,80,80);
  
  ellipse(50,50,75,75);
   fill(255);
  ellipse(50,50,70,70);
  
  ellipse(50,50,65,65);
   fill(0);
  ellipse(50,50,60,60);
  
  ellipse(50,50,55,55);
   fill(255);
  ellipse(50,50,50,50);
  
  ellipse(50,50,45,45);
   fill(0);
  ellipse(50,50,40,40);
  
  ellipse(50,50,35,35);
   fill(255);
  ellipse(50,50,30,30);
  
  ellipse(50,50,25,25);
   fill(0);
  ellipse(50,50,20,20);
  
  ellipse(50,50,15,15);
   
  ellipse(50,50,10,10);
  
  ellipse(50,50,5,5);
 
  line(50,0,100,50);
   line(49,0,100,51);
  line(0,50,50,100);
  line(0,49,51,100);
  line(50,0,0,50);
  line(51,0,0,49);
  line(100,50,50,100);
  line(100,51,49,100);
  line(80,0,100,20);
  line(20,0,0,20);
  line(0,80,20,100);
  line(100,80,80,100);
  
  
 

  
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

