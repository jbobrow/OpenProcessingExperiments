
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 40;
int patternSeperationY = 60;
 
 
void setup(){
  size(500,500);
   background(0);
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
   
   float x = 20;
   int y = 5;
   float k = 90;
   while (x < 2000)
   {
  stroke(255,255,0,k/8);
  strokeWeight(y+2);
     line(0,0,x,x);
  line(x,x,40,x);
   line(40,x,k*5,40);
   line(x,40,k*2,40);
   x = x*31;
   k = k*0.5;
   }

   
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

