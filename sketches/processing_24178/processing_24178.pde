
// import processing.pdf.*;
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
  
  
//what happens if you change these both to 50? what are they doing to the pattern?
float patternSeperationX = 400;
float patternSeperationY = 800;
  
  
void setup(){

  size(400,800);
     // beginRecord(PDF, "bezier.pdf");
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
   // endRecord();
    
}
  
  
void draw()
{
  //This is here so the program keeps running and the screengrab will work
}
  
  
void yourFunction(){
    
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)
smooth();

float s = 0;
float w = 1;
float t = 100;

strokeWeight(0.5);
float d = 600;
float e = 100;
float f = 300;
{
for( d=550, e=100, f=300, t=100 ; d>-250; d=d-15, e=e-12, f=f+12, t=t-200)
{

  
  
strokeWeight(w);
color from= color(#070834);
color to = color(#90FFEA);
color fade = lerpColor(from,to,s);
s=s+0.018;
w=w-0.015;

stroke(fade,t);
bezier(0,600,e,d,f,d,400,600);
}
}


float x=45;
float y=15;
s = 0;
w = 0.3;
{
for( x=0; x<750; x=x+15)
{

strokeWeight(random(0,1.5));
color from= color(#070834);
color to = color(#90FFEA);
color fade = lerpColor(to,from,s);
s=s+0.021;
w=w+0.08;
stroke(fade);
ellipse(200,700, x, y);
y=x/3;
}
}
 w = 0.3;
 s = 0;
float a = 300;
float b = 100;
float a1 = 300;
float b1 = 600;

stroke(255);
 
{
for (a = 300, b = 100; a>-10; a=a-15, b=b-31)
{
strokeWeight(w);
color from= color(#070834);
color to = color(#90FFEA);
color fade = lerpColor(to,from,s);
s=s+0.051;
w=w+0.15;
stroke(fade);
bezier(0, 300, a, b, a, 600, 200, 700);
}


}
float xa = 100;
float xb = 100;
float xa1 = 100;
float xb1 = 600;
{
w=0.3;  
s=0;
for (xa = 100, xb = 100; xa<410; xa=xa+15, xb=xb-31)
{
strokeWeight(w);
color from= color(#070834);
color to = color(#90FFEA);
color fade = lerpColor(to,from,s);
s=s+0.051;
w=w+0.15;
stroke(fade);
bezier(400, 300, xa, xb, xa, 600, 200, 700); 

}
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

