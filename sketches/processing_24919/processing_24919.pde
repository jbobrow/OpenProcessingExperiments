

//////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
 

 
void setup(){
smooth () ; 
  size(500,900);

   background(0,0,255);
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
 int i=51; 
  int g=49;
 int h=49; 
 int f=51;   
float t=254.5;
int v=150;
int u=0;

noStroke();

while(t>1) {
 fill(t,v,u);

triangle (50,i,0,0,100,0);

triangle (50,g,0,100,100,100);

triangle (h,50,100,0,100,100);

triangle (f,50,0,100,0,0);
  i = i -1;
  g = g +1;
  h = h +1;
  f = f -1;
  
  v = v - 5;
  t = t - 5;
  u = u + 4;
}
//noStroke();
//stroke (0);
 
 //strokeWeight (0.5);
//noStroke();


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
                
                
