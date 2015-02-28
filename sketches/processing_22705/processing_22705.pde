
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;



void setup(){
  size(500,500);
  smooth();
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  background(245, 194, 40);
  noStroke();
 // rect(0,0,patternSeperationX,patternSeperationY);
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



 noStroke();
color c1 = color(365, 365, 365);
fill(c1); triangle(15, 90, 50, 20, 85, 90);



color c2 = color(0, 0, 0);
fill(c2); triangle(0, 100, 0, 0, 50, 0);
 triangle(50, 0, 100, 0, 100, 100);
 triangle(30, 80, 50, 40, 70, 80);
 
color c3 = color(365, 365, 365);
fill(c3); triangle(65, 10, 100, 10, 100, 80);
fill(c3); triangle(0, 10, 35, 10, 0, 80);

color c4 = color(245, 194, 40);

color c5 = color(0, 0, 0);
fill(c5);triangle(83, 45, 100, 10, 100, 45);
fill(c5);triangle(0, 10, 0, 45, 17, 45);
fill(c5); triangle(80, 20, 100, 20, 100, 60);
fill(c5); triangle(0, 20, 20, 20, 0, 60);

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

