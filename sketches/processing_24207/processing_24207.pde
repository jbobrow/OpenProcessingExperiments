
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 200;
 

void setup(){
  size(600,600);
   background(255);
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

//main design
noStroke();
fill(0,68 ,100,255);
//top left
arc(0,0,80,80,0,PI);
arc(0,34,40,60,0,PI);
//top right
arc(100,0,80,80,0,PI);
arc(100,34,40,60,0,PI);
//center   
ellipse(50,100,80,80);
arc(50,66,40,60,PI,2*PI);
arc(50,134,40,60,0,PI);
//bottom right
ellipse(100,200,80,80);
arc(100,166,40,60,PI,2*PI);
//bottom left
ellipse(0,200,80,80);
arc(0,166,40,60,PI,2*PI);

stroke(33,99,155);
noFill();
//triangles
//top
line(40,0,50,35);
line(60,0,50,35);
//right
line(100,65,90,100);
line(90,100,100,136);
//left
line(0,65,10,100);
line(10,100,0,136);
//bottom
//line(40,200,60,200);
line(60,200,50,165);
line(50,165,40,200);

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


