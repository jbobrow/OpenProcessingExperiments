
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 200;
int patternSeperationY = 200;
 
 
void setup(){
  size(600,600);
   
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
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
   
 //top right segment-downwards  
   line(0,0,200,200);
   line(118,118,200,36);
   line(143,143,200,86);
   line(160,160,200,120);
   line(172,172,200,144);
   line(182,182,200,164);
   line(190,190,200,180);
   line(195,195,200,190);
   line(197.5,197.5,200,195);
   line(199,199,200,198);
   line(199.5,199.5,200,199);
  //top right segment-upwards
   line(82,82,164,0);
   line(57,57,114,0);
   line(40,40,80,0);
   line(28,28,56,0);
   line(18,18,36,0);
   line(10,10,20,0);
   line(5,5,10,0);
   line(2.5,2.5,5,0);
   line(1,1,2,0);
   line(0.5,0.5,1,0);
 //bottom segment
   line(0,200,0.5,0.5);
   line(0,200,1,1);
   line(0,200,2.5,2.50);
   line(0,200,5,5);
   line(0,200,10,10);
   line(0,200,18,18);
   line(0,200,28,28);
   line(0,200,40,40);
   line(0,200,57,57);
   line(0,200,82,82);
   line(0,200,118,118);
   line(0,200,143,143);
   line(0,200,160,160);
   line(0,200,172,172);
   line(0,200,182,182);
   line(0,200,190,190);
   line(0,200,195,195);
   line(0,200,197.5,197.5);
   line(0,200,199,199);
   line(0,200,199.5,199.5);
  
   
   
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


