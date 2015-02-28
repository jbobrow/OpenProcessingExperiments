
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
  
  //blue
  noStroke();
  fill (168,207,222, random(50,255));
  quad(0, 0, 0, 20, 80, 100, 100, 100);
  
  noStroke();
  fill (168,207,222, random(50,255));
  quad(100, 0, 100, 0, 80, 0, 100, 20);
  
  
  //green
  noStroke();
  fill (127,216,141, random(50,255));
  quad(0, 20, 0, 40, 60, 100, 80, 100);
  
  noStroke();
  fill (127,216,141, random(50,255));
  quad(100, 20, 80, 0, 60, 0, 100, 40);
  
  //yellow
  noStroke();
  fill (255,239,144, random(50,255));
  quad(0, 40, 0, 60, 40, 100, 60, 100);
  
  noStroke();
  fill (255,239,144, random(50,255));
  quad(100, 40, 60, 0, 40, 0, 100, 60);
  
  //orange
  noStroke();
  fill (252,158,64, random(50,255));
  quad(0, 60, 0, 80, 20, 100, 40, 100);
  
  noStroke();
  fill (252,158,64, random(50,255));
  quad(100, 60, 40, 0, 20, 0, 100, 80);
  
  //pink?
  noStroke();
  fill (252,64,89, random(50,255));
  quad(0, 80, 0, 100, 0, 100, 20, 100);
  
  noStroke();
  fill (252,64,89, random(50,255));
  quad(100, 80, 20, 0, 0, 0, 100, 100);
  
  //pinkpattern
  
  noStroke();
  fill (255,126,126, random(50,255));
  quad(0, 80, 0, 100, 0, 100, 20, 100);
  
  noStroke();
  fill (255,126,126, random(50,255));
  quad(20, 0, 20, 20, 20, 20, 40, 20);
  
  noStroke();
  fill (255,126,126, random(50,255));
  quad(40, 20, 40, 40, 40, 40, 60, 40);
  
  noStroke();
  fill (255,126,126, random(50,255));
  quad(60, 40, 60, 60, 60, 60, 80, 60);
  
  noStroke();
  fill (255,126,126, random(50,255));
  quad(80, 60, 80, 80, 80, 80, 100, 80);
  
  //orangepattern
  
  fill(255, 213, 167, random(50,255));
  ellipse(35, 5, 10, 10);
  
  fill(255, 213, 167, random(50,255));
  ellipse(45, 15, 10, 10);
  
  fill(255, 213, 167, random(50,255));
  ellipse(55, 25, 10, 10);
  
  fill(255, 213, 167, random(50,255));
  ellipse(65, 35, 10, 10);
  
  fill(255, 213, 167, random(50,255));
  ellipse(75, 45, 10, 10);
  
  fill(255, 213, 167, random(50,255));
  ellipse(85, 55, 10, 10);
  
  fill(255, 213, 167, random(50,255));
  ellipse(95, 65, 10, 10);
  
  fill(255, 213, 167, random(50,255));
  ellipse(5, 75, 10, 10);
  
  fill(255, 213, 167, random(50,255));
  ellipse(15, 85, 10, 10);
  
  fill(255, 213, 167, random(50,255));
  ellipse(25, 95, 10, 10);
  
  //bluepattern
  
  fill(98 ,201, 255, random(50,255));
  rect(2, 12, 5, 5);
  
  fill(98 ,201, 255, random(50,255));
  rect(10, 20, 10, 10);
  
  fill(98 ,201, 255, random(50,255));
  rect(22, 32, 5, 5);
  
  fill(98 ,201, 255, random(50,255));
  rect(30, 40, 10, 10);
  
  fill(98 ,201, 255, random(50,255));
  rect(42, 52, 5, 5);
  
  fill(98 ,201, 255, random(50,255));
  rect(50, 60, 10, 10);
  
  fill(98 ,201, 255, random(50,255));
  rect(62, 72, 5, 5);
  
  fill(98 ,201, 255, random(50,255));
  rect(70, 80, 10, 10);
  
  fill(98 ,201, 255, random(50,255));
  rect(82, 92, 5, 5);
  
  fill(98 ,201, 255, random(50,255));
  rect(90, 0, 10, 10);
  
  //greenpattern
  
 
  
  //heart
  noStroke();
  fill (216,39,39);
  triangle(30, 35, 58, 90, 85, 35);
  ellipse(44, 31, 29, 29);
  ellipse(71, 31, 29, 29);
  
  


}

//  55 27.5 18.75
  
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

