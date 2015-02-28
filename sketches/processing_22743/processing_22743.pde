
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
 
 
void setup(){
  size(500,500);
  background(200);
  smooth();
   
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
}
 
 
void yourFunction(){
   
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  
  //big triangle
 
  stroke(0);
  
  //Top outer
  line(8,5,93,5);
   //Top middle
  line(3,10,82,10);
  //Top inner
  line(13,15,80,15);
  
  //Left outer
  line(3,10,34,63);
  line(47,85,39,72);
   //Left middle
  line(13,15,39,58);
  line(53,83,43,66);
    //Left inner
  line(20,15,42,53);
  line(52,71,46,60);
  
  //Right outer
  line(52,85,98,10);
  //Right middle
  line(53,72,93,5);
  //Right inner
  line(49,66,83,10);
  

  //Cornerleft
  line(3,10,8,5);
  //Corner right
  line(93,5,98,10);
  //Corner bottom
  line(52,85,47,85);
  
  //small triangle
  
  //outer left
  line(48,44,12,96);
  //outer right
  line(53,44,58,52);
  line(87,96,66,63);
  //outer bottom;
  line(15,100,84,100);
  
  //middle left
  line(48,51,15,100);
  //middle right
  line(48,44,55,55);
  line(80,92,63,66);
  //middle bottom
  line(23,96,85,96);
  
  //inner left
  line(50,55,23,95);
  //inner right
  line(48,51,53,59);
  line(75,92,61,71);
  //inner bottom
  line(25,92,79,92);
  
  //corner top
  line(53,44,48,44);
  //corner left
  line(15,100,12,96);
  //corner right
  line(84,100,86,96);
  
  
  //fill for big triangle
  noStroke();
  fill(200,0,0);
  //Top outer
  quad(4,10,8,6,93,6,85,10);
  //Right inner
  quad(84,10,93,6,53,72,50,66);
  
  fill(0);
  //Right outer
  quad(53,74,53,83,98,10,94,6);
  //Left inner lower
  quad(53,73,53,83,44,66,47,61);
  //left inner upper
  quad(14,16,39,58,42,53,21,16);
  
 fill(131,0,0);
  //left outer lower
  quad(48,85,40,72,43,66,54,85);
  //left outer upper
  quad(4,11,35,63,39,58,10,11);
  //top inner
  quad(10,11,83,11,80,15,12,15);
  
  //fill for small triangle
  
  fill(131,0,0);
  //left outer
  quad(13,96,49,45,49,50,16,100);
  fill(0);
  //left inner
  quad(16,100,48,52,50,56,20,100);
  //bottom outer
  quad(20,100,84,100,86,97,18,97);
  fill(200,0,0);
  //bottom inner
  quad(24,96,86,96,84,93,26,93);
  fill(131,0,0);
  //right inner upper
  quad(48,45,48,49,53,58,55,56);
  //right inner lower
  quad(75,92,79,92,63,67,62,71);
  fill(255,0,0);
  //right outer upper
  quad(49,45,54,45,58,55,56,56);
  //right outer lower
  quad(65,67,66,63,86,95,81,93);
  
  
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


