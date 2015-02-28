
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 125;
int patternSeperationY = 125;


void setup(){
  size(500,500);
  smooth();
  //the white box simply shows you the space your pattern gets drawn in
  fill(240, 229, 194);
  background(240, 229, 194);
  
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);

  for(int i = 0; i < 500/patternSeperationX; i++){
      for(int j = 0; j < 500/patternSeperationY; j++){
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
 

  
  fill(181, 216, 219);        //hood
  noStroke();
  ellipse(55, 34, 60, 57);
  
  fill(152, 190, 193);       //body
  ellipse(55, 85, 60, 80);
  
  fill(181, 216, 219);       //arms
  ellipse(55, 75, 70, 50);
  
  fill(255, 236, 224);       //head
  noStroke();
  ellipse(55, 40, 40, 38);
 
  stroke(0);                 //eyes
  strokeWeight(2);
  line(40, 38, 48, 38);
  line(62, 38, 70, 38);
  
  strokeWeight(1);           //eyelashes
  line(40, 38, 40, 40); 
  line(42, 38, 42, 40);
  line(44, 38, 44, 40);
  line(46, 38, 46, 40);
  line(48, 38, 48, 40);
  line(62, 38, 62, 40);
  line(64, 38, 64, 40);
  line(66, 38, 66, 40);
  line(68, 38, 68, 40);
  line(70, 38, 70, 40);
  
  fill(255, 188, 185);       //cheeks
  noStroke();
  ellipse(42, 46, 10, 10);
  ellipse(68, 46, 10, 10);
  
  fill(255, 0, 0, 20);        //mouth
  triangle(52, 50, 58, 50, 55, 54);
  ellipse(53, 48, 4, 5);
  ellipse(56, 48, 4, 5);
  
  fill(255, 236, 224);        //hands
  ellipse(55, 90, 15, 15);
  
  fill(240, 229, 194);       //coat
  ellipse(33, 107, 11, 11);
  ellipse(54, 108, 11, 11);
  ellipse(76, 107, 11, 11);
  
  fill(152, 190, 193);   
  ellipse(33, 107, 5, 5);
  ellipse(54, 108, 5, 5);
  ellipse(76, 107, 5, 5);
  
  fill(255, 226, 131);
  ellipse(43, 113, 10, 10);
  ellipse(65, 113, 10, 10);
  
  stroke(255);              //snowflakes
  noFill();
  ellipse(10, 20, 10, 10);
  line(10, 12, 10, 28);
  line(2, 20, 18, 20);
  line(3, 15, 18, 25);
  line(3, 25, 18, 15);
  
  ellipse(20, 53, 10, 10);
  ellipse(20, 53, 5, 5);
  line(20, 45, 20, 61);
  line(12, 53, 27, 53);
  
  ellipse(100, 30, 7, 7);
  rect(95, 25, 10, 10);
  line(92, 22, 108, 38);
  line(108, 22, 92, 38);
  
  ellipse(109, 76, 10, 10);
  ellipse(109, 76, 15, 15);
  line(109, 70, 109, 83);
  line(103, 76, 116, 76);
  line(103, 71, 116, 81);
  line(116, 71, 103, 81);

  
 
 
  
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

