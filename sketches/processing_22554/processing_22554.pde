
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 60;
int patternSeperationY = 60;
 
 
void setup(){
  size(500,500);
  smooth(); 
  //the white box simply shows you the space your pattern gets drawn in
//line(2,0,2,500);
//line(4,0,4,500);
//line(6,0,6,500);
//line(8,0,8,500);
//line(10,0,10,500);
//line(12,0,12,500);
//line(14,0,14,500);
//line(16,0,16,500);
//line(18,0,18,500);
//line(20,0,20,500);
//line(22,0,22,500);
//line(24,0,24,500);
//line(26,0,26,500);
//line(28,0,28,500);
//line(30,0,30,500);
//line(32,0,32,500);
//line(34,0,34,500);


//line(150,0,150,500);
//line(152,0,152,500);
//line(154,0,154,50 0);
//line(156,0,156,500);
//line(158,0,158,500);
//line(160,0,160,500);
   
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

//bigger set of ellipse
fill(0);
ellipse(50,55,45,100);
noFill();
fill(250);
ellipse(50,58,45,90);
noFill();
fill(0);
ellipse(50,68,40,70);
noFill();
fill(160);
ellipse(50,76,28,55);
noFill();
fill(250);
ellipse(50,80,25,45);
noFill();
fill(0);
ellipse(50,92,10,22);
noFill();
//right set of ellipses
//noFill();   

fill(250);
ellipse(20,69,45,78);
noFill();
fill(158);
ellipse(20,71,40,72);
noFill();
fill(0);
ellipse(20,74,40,70);
noFill(); 
//noFill();
fill(250);
ellipse(20,83,27,52);
noFill();
fill(160);
ellipse(20,88,25,45);
noFill();
fill(0);
ellipse(20,96,10,27);
noFill();
ellipse(20,100,10,20);
noFill();
  
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


