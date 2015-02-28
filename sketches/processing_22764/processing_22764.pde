
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = (100);
int patternSeperationY = (100);
 
 
void setup(){
  size(500,500);
  background(50);

  smooth();
  //the white box simply shows you the space your pattern gets drawn in
  fill(50);
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



fill(200,100,30,10);
ellipse(5,5,5,5);
fill(200,100,30,20);
ellipse(10,10,10,10);
fill(200,100,30,30);
ellipse(20,20,20,20);
fill(200,100,30,40);
ellipse(30,30,30,30);
fill(200,100,30,50);
ellipse(40,40,40,40);
fill(200,100,30,60);
ellipse(50,50,50,50);

ellipse(60,60,60,60);
ellipse(200,100,30,80);
ellipse(70,70,70,70);
ellipse(200,100,30,90);
ellipse(80,80,80,80);
ellipse(200,100,30,100);
 ellipse(90,90,90,90);

 ellipse(100,100,100,100);

 ellipse(110,110,110,110);

 ellipse(120,120,120,120);

 ellipse(130,130,130,130);


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





