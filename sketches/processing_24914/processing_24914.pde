
//////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
 

 
void setup(){
smooth () ; 
  size(500,900);

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


  //This is here so the program keeps running and the screengrab will work
}
 void yourFunction(){
   
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)







 int i=25; 
  int g=0;
 int h=25; 
 float f=0.1;   
float t=60.1;
 float d=0.1;
 float e=100.1;
 float a=75.01;
 float b=25.01;
 
 float m=100.01;
 float n=0.01;
float p=75.01; 

float o=100.01;
float r=0.01;

 
 float x=75.01;
 float y=25.01;
 
 
noStroke();

while(t<254.99) {
 fill(r,t,r);



noStroke();
quad (d,f,25,25,75,25,e,f);

quad (y,i,x,i,75,75,25,75);

quad (n,g,25,h,25,75,0,100);
quad (m,g,75,h,75,75,100,100);

quad (b,a,p,a,100,100,0,100);


  i = i +1;
  g = g +2;
  h = h +1;
  f = f +0.5;
  d = d +0.5;
  e = e -0.5;
  a = a +0.5;
  b = b -0.25;
  y = y +0.5;
  x = x -0.5;
  m = m -0.5;
  n = n +0.5;
  p = p -0.25;
  
  //o = o +5;
 r = r +2.44;
 
  t = t +4.76;
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


                
                                
