




///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 int x=0;
 int y=120;

//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 130;
int patternSeperationY = 160;



void setup(){
  
  size(400,800);

    background(250,100,100);
    
    
  //the white box simply shows you the space your pattern gets drawn in
  fill(555);
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

 x=+8;
 y=-2;
 
  fill(0);
  ellipse (10,50,10,10);
  triangle(10,55,10,45,30,50);
  ellipse(35,25,10,10);
  triangle(30,25,40,25,35,45);
  ellipse(35,70,10,10);
  triangle(30,70,40,70,35,50);
  

noStroke();  
fill(100,250,50,180);
rect(0,120,10,50);
rect(x,118,10,50);
rect(2*x,116,10,50);
rect(3*x,114,10,50);
rect(4*x,110,10,50);
rect(5*x,106,10,50);
rect(6*x,98,10,55);
rect(7*x,90,10,60);
rect(8*x,84,10,60);
rect(9*x,55,10,85);
rect(10*x,24,10,110);
rect(11*x,8,10,115);
rect(12*x,8,10,95);
rect(13*x,8,10,75);
rect(14*x,8,10,60);

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

