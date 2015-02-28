
// import processing.pdf.*;
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
 
 
void setup(){

  size(400,800);
 // beginRecord(PDF, "globes.pdf");
   background(0);
   
  //the white box simply shows you the space your pattern gets drawn in
  noFill();
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
//   endRecord(); 
}
 
 
void draw()
{
  //This is here so the program keeps running and the screengrab will work
}
 
 
void yourFunction(){
   
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
smooth();


 translate(random(0,50),random(0,50));

//ellipse(50,50,100,100);
strokeWeight(random(0.2,1.5));
int x;
float a = 0;
float b = 0;
float c = 255;
float w = random(0,1);
 for( x=0; x<100; x=x+9)
{


color from= color(#070834);
color to = color(#90FFEA);
color fade = lerpColor(from,to,a); 
  a=a+0.03;
  c=c-15;
 stroke(fade);
ellipse(50,50,100,x);
}
 
{ 
 translate(random(0,50),random(0,50));

//ellipse(50,50,100,100);

int y;
for( y=0; y<100; y=y+9)
{

  color from= color(#070834);
color to = color(#90FFEA);
color fade = lerpColor(from,to,b); 
  b=b+0.09;
    stroke(fade);
ellipse(50,50,y,100);
}
}
//for (int i = 0; i < 80; i = i+5) {
 // line(30, i, 80, i);
//}

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

