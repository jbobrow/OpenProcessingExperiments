
import processing.pdf.*;
//////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
 
 
 
void setup(){
smooth () ; 
  size(500,1000);
   beginRecord(PDF,"loops_final_6_revised_2");
   background(255);
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
  endRecord();
  //This is here so the program keeps running and the screengrab will work
}
 
 
void yourFunction(){
   
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
 int i=125; 
  int g=120;
 int h=100; 
  int f=95;   
float t=0.05;

  int a=25;
  int b=75;
  int c=80;
  int d=20;
  
   int ab=25;
  int bb=75;
  int cc=80;
  int dd=20;

noStroke();
//stroke (0);
strokeWeight (0.25);
while(i>2) {
 fill(0,t,t);
  quad(0,g,0,i,25,h,25,f );
  
  quad(100,g,100,i,75,h,75,f );
 
 quad(50,g,50,i,75,h,75,f );
 
  quad(50,g,50,i,25,h,25,f );
 

  //quad(a,b,d,c,c,c,b,b);
  
   t = t + 6;
  
  i = i - 3;
  g = g - 3;
  f = f - 3;
  h = h - 3;
  
  a = a - 5;
  b = b + 5;
  c = c + 5;
  d = d - 5;
  
 // a = a - 5;
 // b = b - 5;
 // c = c + 5;
  //d = d + 5;
}
//stroke (0);
 //strokeWeight (0.5);
line (0,100,100,100); 
 //line (0,0,100,100);
//line (0,100,100,0);
//line (99,0,99,100);
//line (0,99,100,99);
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


