

/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
 
 
void setup(){
smooth () ; 
 background(0);
  size(500,1000);


  //the white box simply shows you the space your pattern gets drawn in
  fill(0);
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
   noFill();
}
 

void draw()
{
  
stroke(255);
strokeWeight(1);
fill(0);

ellipse(250,500,400,400);
ellipse(250,500,395,395);
ellipse(250,500,390,390);
ellipse(250,500,385,385);
ellipse(250,500,380,380);
ellipse(250,500,375,375);
ellipse(250,500,370,370);
ellipse(250,500,363,363);
ellipse(250,500,355,355);
ellipse(250,500,346,346);
ellipse(250,500,336,336);
ellipse(250,500,327,327);
ellipse(250,500,314,314);
ellipse(250,500,298,298);
ellipse(250,500,280,280);
ellipse(250,500,260,260);
ellipse(250,500,238,238);
ellipse(250,500,215,215);
ellipse(250,500,193,193);
ellipse(250,500,173,173);
ellipse(250,500,156,156);
ellipse(250,500,140,140);
ellipse(250,500,128,128);
ellipse(250,500,119,119);
ellipse(250,500,109,109);
ellipse(250,500,100,100);
ellipse(250,500,93,93);
ellipse(250,500,88,88);
ellipse(250,500,84,84);
ellipse(250,500,81,81);


  


  
  //This is here so the program keeps running and the screengrab will work
}
 
 
void yourFunction(){
   
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  fill(0);
  noStroke();
  rect(0,0,100,100);
  
   float wide= 50;
   float high= 50;
   
stroke(255);
strokeWeight(1);
noFill();
ellipse(25,25,50,50);
ellipse(75,25,50,50);
ellipse(75,75,50,50);
ellipse(25,75,50,50);
fill(0);
ellipse(50,50,50,50);


wide= wide-10;
high=high-10;

noFill();
ellipse(25,25,wide,high);
ellipse(75,25,wide,high);
ellipse(75,75,wide,high);
ellipse(25,75,wide,high);
fill(0);
ellipse(50,50,wide,high);

wide= wide-10;
high=high-10;

noFill();
ellipse(25,25,wide,high);
ellipse(75,25,wide,high);
ellipse(75,75,wide,high);
ellipse(25,75,wide,high);
fill(0);
ellipse(50,50,wide,high);

wide= wide-7.5;
high=high-7.5;

noFill();
ellipse(25,25,wide,high);
ellipse(75,25,wide,high);
ellipse(75,75,wide,high);
ellipse(25,75,wide,high);
fill(0);
ellipse(50,50,wide,high);

wide= wide-5;
high=high-5;

noFill();
ellipse(25,25,wide,high);
ellipse(75,25,wide,high);
ellipse(75,75,wide,high);
ellipse(25,75,wide,high);
fill(0);
ellipse(50,50,wide,high);

wide= wide-4;
high=high-4;

noFill();
ellipse(25,25,wide,high);
ellipse(75,25,wide,high);
ellipse(75,75,wide,high);
ellipse(25,75,wide,high);
fill(0);
ellipse(50,50,wide,high);

wide= wide-3;
high=high-3;

noFill();
ellipse(25,25,wide,high);
ellipse(75,25,wide,high);
ellipse(75,75,wide,high);
ellipse(25,75,wide,high);
fill(0);
ellipse(50,50,wide,high);

wide= wide-2;
high=high-2;

noFill();
ellipse(25,25,wide,high);
ellipse(75,25,wide,high);
ellipse(75,75,wide,high);
ellipse(25,75,wide,high);
fill(0);
ellipse(50,50,wide,high);


wide= wide-1;
high=high-1;

noFill();
ellipse(25,25,wide,high);
ellipse(75,25,wide,high);
ellipse(75,75,wide,high);
ellipse(25,75,wide,high);
fill(0);
ellipse(50,50,wide,high);




 
 
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

                
                                
