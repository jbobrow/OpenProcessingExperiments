
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = patternSeperationX;


void setup(){
  size(500,500);
  
  //the white box simply shows you the space your pattern gets drawn in
  
  for(int i = 0; i < width/patternSeperationX+1; i++){
      for(int j = 0; j < height/patternSeperationY+1; j++){
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

float amountofsquares=10.0;

for(float counter=amountofsquares; counter>=0; counter=counter-1.0){
  float squaresize = (patternSeperationX/amountofsquares)*counter;
  color from = color(230,180,50);
  color to = color(210,80,30);
  color inter = lerpColor(from,to,counter/amountofsquares);

  fill(inter); 
  rectMode(CENTER);
  rect(patternSeperationX/2,patternSeperationX/2,squaresize,squaresize);
} 
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

