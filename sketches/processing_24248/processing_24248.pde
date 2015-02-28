
//////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
 
 
 
void setup(){
smooth () ; 
  size(500,1000);
   background(255);
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
 int i=0; 
  int g=100;
 int h=0; 
  int f=0;   
float t=0.05;

noStroke();

while(i<50) {
 fill(0,t,100);
  quad(i,i,i,g,g,g,g,i);
  i = i + 1;
  g = g - 1;
  t = t + 6;
  f = f + 10;
  
}
noStroke();
stroke (0);
 
 strokeWeight (0.5);
//noStroke();
line (0,100,100,100); 
 line (0,0,100,100);
line (0,100,100,0);
line (99,0,99,100);
line (0,99,100,99);

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


