
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
 int patternSeperationX = 50;
 int patternSeperationY = 50;
 int x1 = 0;
 int y1 = 0;
 int x2 = 50;
 int y2 = 50;
 


void setup(){
  size(500,500);
  background(0);
  
  //the white box simply shows you the space your pattern gets drawn in

  
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
  noStroke();
  fill(0);
  //Advance way
 int center=25; 
 int xcircle = center;
 int ycircle = center;
 int radius = 50;
  for( int i = radius; i>0; i=i-5){
   xcircle = center;
   ycircle = center;
   radius = i;
   fill(radius);
   ellipse(xcircle,ycircle,radius,radius);
       }
 /*int widthx=50;
 int heighty=50;      
 int x1=;
 int y1=;
 int x2=;
 int y2=;
  for( int  */ //still cannot figure out how to loop this one

  
  
  //Original way
  /*line(0,0,50,50);
  line(0,5,50,45);
   line(0,10,50,40);
   line(0,15,50,35);
   line(0,20,50,30);
   line(0,25,50,25);
   line(0,30,50,20);
   line(0,35,50,15);
   line(0,40,50,10);
   line(0,45,50,5);
   line(0,50,50,0);
   line(5,0,45,50);
   line(10,0,40,50);
   line(15,0,35,50);
   line(20,0,30,50);
   line(25,0,25,50);
   line(30,0,20,50);
   line(35,0,15,50);
   line(40,0,10,50);
   line(45,0,5,50);
   ellipse(25,25,50,50);
   ellipse(25,25,45,45);
   ellipse(25,25,40,40);
   ellipse(25,25,35,35);
   ellipse(25,25,30,30);
   ellipse(25,25,25,25);
   ellipse(25,25,20,20);
   ellipse(25,25,15,15);
   ellipse(25,25,10,10);
   ellipse(25,25,5,5);*/
  
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

