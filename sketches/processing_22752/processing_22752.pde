
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  smooth();
  size(500,500);
  background(100,140,230);
  //the white box simply shows you the space your pattern gets drawn in
fill(255);
  noStroke();
  //rect(0,0,patternSeperationX,patternSeperationY);
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
  
  stroke(250,200,200);
  strokeWeight(10);
  line(0,10,500,10);
  stroke(200,250,200);
  line(0,20,500,20);
  stroke(200,200,255);
  line(0,30,500,30);
  stroke(250,200,200);
  line(0,40,500,40);
  stroke(200,250,200);
  line(0,50,500,50);
   stroke(200,200,255);
  line(0,60,500,60);
  stroke(250,200,200);
  line(0,70,500,70);
  stroke(200,250,200);
  line(0,80,500,80);
  stroke(200,200,255);
  //line(0,90,500,90);
  
 noFill();
 stroke(0);
 strokeWeight(2);
line(0,0,500,500);
fill(100,100,230);
triangle(0,0,50,0,60,60);
fill(80,50,200);
triangle(0,0,0,50,60,60);
fill(120,120,250);
triangle(50,0,100,100,60,60);
fill(60,40,180);
triangle(0,50,60,60,100,100);
line(0,0,55,30);
line(0,0,30,55);
line(100,100,55,30);
line(100,100,30,55);
//line(55,0,105,100);
line(0,55,100,105);
line(55,0,105,100);

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

