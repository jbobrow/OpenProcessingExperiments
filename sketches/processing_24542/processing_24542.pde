
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;



void setup(){
  size(500,500);
  


  background(0,0,0);
  
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
  
  smooth();
  stroke(0,0,255);
  
  line(0,0,50,50);
  line(0,0,45,35);
  line(0,0,40,20);
  line(0,0,35,10);
  line(0,0,25,2);
  
  line(0,0,35,45);
  line(0,0,20,40);
  line(0,0,10,35);
  line(0,0,2,25);
  
  
  line(255,255,50,50);
  line(65,55,100,100);
  line(80,60,100,100);
  line(90,65,100,100);
  line(98,70,100,100);
  
  line(55,65,100,100);
  line(60,80,100,100);
  line(65,90,100,100);
  line(70,98,100,100);
   stroke(0,255,0);
  
 line(100,0,50,50);
 line(100,0,80,35);
 line(100,0,90,30);
 line(100,0,98,25);
 
 line(100,0,60,40);
 line(100,0,65,25);
 line(100,0,75,10);
 line(100,0,80,2);
 
 line(0,100,50,50);
 line(0,100,25,65);
 line(0,100,15,70);
 line(0,100,5,75);
 
 line(0,100,40,70);
 line(0,100,35,85);
 line(0,100,30,95);
 
 

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

