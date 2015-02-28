

//////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
 

 
void setup(){
smooth () ; 
  size(500,1000);

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
 int i=26; 
  int g=0;
 int h=25; 
 int f=0;
 int e=25;
 int d=74; 
 int c=0 ;
float t=110;
float r=0;
float x=50;
float y=0;
float w=50;
float z=50;


noStroke();

while(t<254.9) {
 fill(t,r,0);


quad (0,g,x,h,50,75,0,100);
quad (100,f,w,e,50,75,100,100);
//triangle (
 


triangle (50,d,y,100,100,100);
triangle (50,i,0,0,100,0);


  stroke (0);
  line (0,0,50,25);
  line (100,0,50,25);
  line (50,75,50,25);
  line (0,100,50,75);
  line (100,100,50,75);
  line(0,99,100,99); 
   
   noStroke ();
  i = i -1;
  g = g +4;
  h = h +2;
  f = f +4;
  e = e +2;
  d = d +1;
  t = t + 5.8;
  c = c + 10;
  r = r +6;
  x = x -0.6;
  y = y +0.8;
  w = w +0.6;
  z = z +0.8;

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


                
                
