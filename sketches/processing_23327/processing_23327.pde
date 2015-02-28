
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
    smooth();
  background(0);
  size(500,500);
  
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
  
}


void draw()
{
  //This is here so the program keeps running and the screengrab will work
}


void yourFunction(){
  
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
  


fill(82, 2, 2);
triangle(0, 0, 0, 20, 20, 0);
fill(82, 2, 2);
triangle(10, 10, 30, 10, 10, 30);
fill(82, 2, 2);
triangle(20, 20, 40, 20, 20, 40);
fill(82, 2, 2);
triangle(30, 30, 50, 30, 30, 50);
fill(82, 2, 2);
triangle(40, 40, 60, 40, 40, 60);
fill(82, 2, 2);
triangle(50, 50, 70, 50, 50, 70);
fill(82, 2, 2);
triangle(60, 60, 80, 60, 60, 80);
fill(82, 2, 2);
triangle(70, 70, 90, 70, 70, 90);
fill(82, 2, 2);
triangle(80, 80, 100, 80, 80, 100);
fill(106, 28, 28);
triangle(40, 20, 20, 20, 40, 0);
fill(106, 28, 28);
triangle(50, 30, 30, 30, 50, 10);
fill(106, 28, 28);
triangle(60, 40, 40, 40, 60, 20);
fill(106, 28, 28);
triangle(70, 50, 50, 50, 70, 30);
fill(106, 28, 28);
triangle(80, 60, 60, 60, 80, 40);
fill(106, 28, 28);
triangle(90, 70, 70, 70, 90, 50);
fill(106, 28, 28);
triangle(100, 80, 80, 80, 100, 60);
fill(106, 28, 28);
triangle(20, 20, 20, 40, 0, 40);
fill(106, 28, 28);
triangle(30, 30, 30, 50, 10, 50);
fill(106, 28, 28);
triangle(40, 40, 40, 60, 20, 60);
fill(106, 28, 28);
triangle(50, 50, 50, 70, 30, 70);
fill(106, 28, 28);
triangle(60, 60, 60, 80, 40, 80);
fill(106, 28, 28);
triangle(70, 70, 70, 90, 50, 90);
fill(106, 28, 28);
triangle(80, 80, 80, 100, 60, 100);
fill(240, 150, 150);
triangle(0, 40, 20, 40, 0, 60);
fill(240, 150, 150);
triangle(10, 50, 30, 50, 10, 70);
fill(240, 150, 150);
triangle(20, 60, 40, 60, 20, 80);
fill(240, 150, 150);
triangle(30, 70, 50, 70, 30, 90);
fill(240, 150, 150);
triangle(40, 80, 60, 80, 40, 100);
fill(240, 150, 150);
triangle(40, 0, 60, 0, 40, 20);
fill(240, 150, 150);
triangle(50, 10, 70, 10, 50, 30);
fill(240, 150, 150);
triangle(60, 20, 80, 20, 60, 40);
fill(240, 150, 150);
triangle(70, 30, 90, 30, 70, 50);
fill(240, 150, 150);
triangle(80, 40, 100, 40, 80, 60);
fill(247, 210, 210);
triangle(20, 80, 0, 80, 20, 60);
fill(247, 210, 210);
triangle(30, 90, 10, 90, 30, 70);
fill(247, 210, 210);
triangle(40, 100, 20, 100, 40, 80);
fill(247, 210, 210);
triangle(60, 20, 80, 0, 80, 20);
fill(247, 210, 210);
triangle(70, 30, 90, 10, 90, 30);
fill(247, 210, 210);
triangle(80, 40, 100, 20, 100, 40);





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

