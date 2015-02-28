


///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(300,600);
  
  smooth();
  noFill();
  background(#3D3D3D);
  
  
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
  
stroke(#FC6B6B);
noFill();

line(30,10,70,10);
rect(20,20,60,60);
line(30,90,70,90);
line(10,30,10,70);
line(90,30,90,70);
line(10,30,20,20);
line(10,70,20,80);
line(30,10,20,20);
line(70,10,80,20);
line(80,20,90,30);
line(70,90,90,70);
line(20,80,30,90);
line(0,0,10,10);
line(100,0,90,10);
line(0,100,10,90);
line(100,100,90,90);
line(90,90,90,80);
line(90,90,80,90);
line(10,10,20,10);
line(10,10,10,20);
line(10,90,10,70);
line(10,90,30,90);
line(90,10,70,10);
line(90,10,90,30);
line(100,10,100,90);
line(10,0,90,0);
stroke(#00CCCC);
triangle(20,20,70,50,20,80);
triangle(80,20,30,50,80,80);
stroke(#0A85FF);
line(20,25,66,52);
line(80,75,34,48);


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

