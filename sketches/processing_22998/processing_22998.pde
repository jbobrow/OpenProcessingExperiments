
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
 
 
void setup(){
  background (0);
  size(500,500);
   
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
   
int x2 = 40;
int x4 = 60;
int x3 = 50;
int x1 = 10;
int x5 = 90;
int x6 = 15;
int x7 = 85;
stroke(50);
line (0,0,100,0);
line (10,0,100,10);
line (20,0,100,20);
line (30,0,100,30);
line (40,0,100,40);
line (50,0,100,50);
line (60,0,100,60);
line (70,0,100,70);
line (80,0,100,80);
line (90,0,100,90);
line (100,0,100,100);
stroke(0);
fill(9,192,227,random(100,160));
quad (x1,x2,x2,x1,x3,x6,x6,x3);
quad (-x1,-x2,-x2,-x1,-x3,-x6,-x6,-x3);
quad (x4,x1,x5,x2,x7,x3,x3,x6);
quad (-x4,-x1,-x5,-x2,-x7,-x3,-x3,-x6);
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

