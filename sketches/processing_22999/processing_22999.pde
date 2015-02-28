
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
 
 
void setup(){
  background (0);
  size(500,500);
   
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
   
int x2 = 40;
int x4 = 60;
int x3 = 50;
int x1 = 10;
int x5 = 90;
int x6 = 15;
int x7 = 85;
stroke(50);
//Right side
line (0,0,100,0);
line (10,0,100,10);
line (20,0,100,20);
line (30,0,100,30);
line (40,0,100,40);
line (50,0,100,50);
line (60,0,100,60);
line (70,0,100,70);
line (80,0,100,80);
line (90,0,100,90);
line (100,0,100,100);

// Left side
line (0,10,10,100);
line (0,20,20,100);
line (0,30,30,100);
line (0,40,40,100);
line (0,50,50,100);
line (0,60,60,100);
line (0,70,70,100);
line (0,80,80,100);
line (0,90,90,100);
line (0,100,100,100);
stroke(255);

strokeWeight(1);
fill(200);
ellipse(50,50,70,70);
fill(150);
ellipse(50,50,60,60);
fill(100);
ellipse(50,50,50,50);
fill(50);
ellipse(50,50,40,40);


fill(10,108,126,random(0,255));
ellipse(50,50,30,30);




//fill(9,192,227,random(100,160));
strokeWeight(0);
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

