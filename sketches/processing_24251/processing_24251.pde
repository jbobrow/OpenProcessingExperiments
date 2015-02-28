
// Alex Polglase 20.03.11
 

int patternSeperationX = 7;
int patternSeperationY = 7;
float position = 1.001;
float trans = 255;
 
void setup(){
  size(800,400);
   background (0);
   

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
   
  noStroke();
  fill (19,177,237, random (trans, 255));
  rect (random (0,position),random (0,position),10,10);

  position = position * 1.00041;
  trans = trans - 0.1;
   
}
 
void keyPressed()

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


