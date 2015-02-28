
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 70;
int patternSeperationY = 70;

 
 
void setup(){
  size(700,700);
  smooth();

   
  //the white box simply shows you the space your pattern gets drawn in
    fill(255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  background(#e786bd);
   
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
  
  strokeWeight(20); 
stroke(#8d5173);
line(0,0,70,70);
strokeWeight(20); 
stroke(#8d5173);
line(0,70,70,0);

fill(#6b455c);
noStroke();
quad(20, 35, 35, 20, 50, 35, 35, 50);

fill(#6b455c);
noStroke();
quad(0, 15, -15, 0, 0, -15, 15, 0);

fill(#6b455c);
noStroke();
quad(70, 15, 85, 0, 70, -15, 55, 0);


fill(#6b455c);
noStroke();
quad(-15, 70, 0, 55, 15, 70, 0, 85);

stroke(#d6abc6);
strokeWeight(1); 
line(0,0,70,70);
stroke(#d6abc6);
strokeWeight(1); 
line(0,70,70,0);

noFill();
stroke(#582c45);
strokeWeight(1); 
quad(0, 35, 35, 0, 70, 35, 35, 70);

noFill();
stroke(#d6abc6);
strokeWeight(1); 
quad(0, 0, 35, -35, 70, 0, 35, 35);

noFill();
stroke(#d6abc6);
strokeWeight(1); 
quad(0, 70, 35, 35, 70, 70, 35, 105);


   
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


