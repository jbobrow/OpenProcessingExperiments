
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
 smooth();
  size(500,500);
  background(100,200,200,255);
  //the white box simply shows you the space your pattern gets drawn in
 
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
  stroke(255,240,200,255);
  strokeWeight(5);
 line(0,59,500,59);
 stroke(140,200,200);
 line(0,63,500,63);
 stroke(180,200,200);
 line(0,68,500,68);
 stroke(220,200,200);
 line(0,72,500,72);
 stroke(255,200,200);
 line(0,76,500,76);
 
   
 
 
  stroke(255,200,200);
  strokeWeight(7);
  noFill();
  arc(50,50,50,50, PI/2, TWO_PI);
  stroke(220,200,200);
  arc(50,50,42,42,PI/2,TWO_PI);
  stroke(180,200,200);
  arc(50,50,34,34,PI/2,TWO_PI);
  stroke(140,200,200);
  arc(50,50,26,26,PI/2,TWO_PI);
  stroke(255,240,200,255);
  strokeWeight(4);
  arc(50,50,18,18,PI/2,TWO_PI);
  
  stroke(140,200,200);
 line(10,98,80,98);
 stroke(180,200,200);
 line(12,104,80,104);
 stroke(220,200,200);
 line(13,108,80,108);
  stroke(255,200,200);
  strokeWeight(4);
 line(14,111,80,111);
 
  stroke(255,240,200,255);
  strokeWeight(5);
 line(0,95,83,95);
 
 stroke(255,200,200);
 ellipse(86,120,20,20);
  stroke(220,200,200);
 ellipse(86,120,28,28);
 stroke(180,200,200);
 ellipse(86,120,36,36);
   strokeWeight(5);
 stroke(140,200,200);
 ellipse(86,120,42,42);
  stroke(255,240,200,255);
 ellipse(86,120,50,50);
 
 

 
 
  stroke(255,200,200);
  line(76,50,76,120);
  stroke(220,200,200);
  line(72,50,72,120);
  stroke(180,200,200);
  line(68,50,68,120);
  stroke(140,200,200);
  line(63,50,63,120);
  stroke(255,240,200,255);
  strokeWeight(4);
  line(60,50,60,120);
  
 



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
}

