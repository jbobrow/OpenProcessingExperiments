
int patternSeperationX = 100;
int patternSeperationY = 100;
  
  
void setup(){
size(400,800);

PImage b;
b = loadImage("Gradient.png");
b.resize(width, height);
background(b);
    
 
  smooth();
  for(int i = 0; i < width/patternSeperationX+1; i++){
      for(int j = 0; j < height/patternSeperationY+1; j++){
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



 
PFont font;   
font=loadFont ("FYD100.vlw");
textFont(font);
fill(0,random(120,130),random(180,190),random(0,256));
text("FYD", 0, 0);
   
    

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


