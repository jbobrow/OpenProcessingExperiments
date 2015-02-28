
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 50;
int patternSeperationY = 50;


void setup(){
  smooth();
  size(500,500);
  background(100,140,230);
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
  stroke(230,200,180,220);
  strokeWeight(2);
  line(0,0,50,50);
  line(50,0,0,50);
  line(0,12.5,50,12.5);
  line(0,37.5,50,37.5);
  line(25,0,50,25);
  line(0,25,50,25);
  line(0,50,50,50);
  noStroke();
  fill(200,190,180,200);
rect(25,25,25,25);
  fill(0,51,50);
ellipse(25,25,40,40);
fill(0, 51, 150); 
ellipse(25,25,35,35);
fill(0, 51, 170);
ellipse(25,25,30,30);
fill(0, 51, 200);
ellipse(25,25,25,25);
fill(0,51,230);
ellipse(25,25,20,20);
fill(0, 51, 250);
ellipse(25,25,15,15);
fill(0,51,300);
ellipse(25,25,10,10);

fill(230,100,150,230);
rect(25,50,25,25);
fill(200,150,200,255);
rect(0,50,25,25);
fill(180,200,180,255);
rect(50,25,25,25);





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

