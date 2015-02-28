
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
  
  
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 50;
int patternSeperationY = 50;

int a = 5;
int b = 30;
  
void setup(){
  size(500,500);
    
  //the white box simply shows you the space your pattern gets drawn in
  fill(0);
  background(0);
  noStroke();
  //rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  smooth();
    
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
    
   int number = 20;
   fill(255,random(10));
   noStroke();
   for(int i = 0; i < number; i++){
     rect(random(100), random(100), random(200), random(200));
   }
      noFill();
   stroke(255,random(10));
   strokeWeight(10);
   for(int i = 0; i < number; i++){
     ellipse(random(100), random(100), random(200), random(200));
   }
 
 smooth();
  fill(0,100,100,random(10));
  stroke(0,100,100,10);
  strokeWeight(1);
  ellipse(1*a,1*a,1*b,1*b);
  ellipse(2*a,1*a,1*b,1*b);
  rect(2.5*a,0.5*a,2*b,1*b);
  ellipse(5*a,1*a,1*b,1*b);
  ellipse(6*a,1*a,1*b,1*b);
  ellipse(7*a,1*a,1*b,1*b);
  ellipse(8*a,1*a,1*b,1*b);
  rect(8.5*a,0.5*a,2*b,1*b);
  
  ellipse(2*a,2*a,1*b,1*b);
  rect(2.5*a,1.5*a,2*b,1*b);
  ellipse(5*a,2*a,1*b,1*b);
  ellipse(6*a,2*a,1*b,1*b);
  ellipse(7*a,2*a,1*b,1*b);
  ellipse(8*a,2*a,1*b,1*b);
  rect(8.5*a,1.5*a,2*b,1*b);
  
  ellipse(1*a,3*a,1*b,1*b);
  rect(2.5*a,2.5*a,2*b,1*b);
  ellipse(5*a,3*a,1*b,1*b);
  ellipse(6*a,3*a,1*b,1*b);
  ellipse(7*a,3*a,1*b,1*b);
  ellipse(8*a,3*a,1*b,1*b);
  rect(8.5*a,2.5*a,2*b,1*b);
  
  ellipse(1*a,4*a,1*b,1*b);
  ellipse(2*a,4*a,1*b,1*b);
  ellipse(5*a,4*a,1*b,1*b);
  ellipse(6*a,4*a,1*b,1*b);
  ellipse(7*a,4*a,1*b,1*b);
  ellipse(8*a,4*a,1*b,1*b);
  rect(8.5*a,3.5*a,2*b,1*b);
  
  ellipse(1*a,5*a,1*b,1*b);
  ellipse(2*a,5*a,1*b,1*b);
  rect(2.5*a,4.5*a,2*b,1*b);
  ellipse(6*a,5*a,1*b,1*b);
  ellipse(7*a,5*a,1*b,1*b);
  ellipse(8*a,5*a,1*b,1*b);
  rect(8.5*a,4.5*a,2*b,1*b);
  
  ellipse(1*a,6*a,1*b,1*b);
  ellipse(2*a,6*a,1*b,1*b);
  rect(2.5*a,5.5*a,2*b,1*b);
  ellipse(5*a,6*a,1*b,1*b);
  ellipse(7*a,6*a,1*b,1*b);
  ellipse(8*a,6*a,1*b,1*b);
  rect(8.5*a,5.5*a,2*b,1*b);
  
  ellipse(1*a,7*a,1*b,1*b);
  ellipse(2*a,7*a,1*b,1*b);
  rect(2.5*a,6.5*a,2*b,1*b);
  ellipse(5*a,7*a,1*b,1*b);
  ellipse(6*a,7*a,1*b,1*b);
  ellipse(8*a,7*a,1*b,1*b);
  rect(8.5*a,6.5*a,2*b,1*b);

  ellipse(1*a,8*a,1*b,1*b);
  ellipse(2*a,8*a,1*b,1*b);
  rect(2.5*a,7.5*a,2*b,1*b);
  ellipse(5*a,8*a,1*b,1*b);
  ellipse(6*a,8*a,1*b,1*b);
  ellipse(7*a,8*a,1*b,1*b);
  rect(8.5*a,7.5*a,2*b,1*b);
  
    ellipse(1*a,9*a,1*b,1*b);
  ellipse(2*a,9*a,1*b,1*b);
  rect(2.5*a,8.5*a,2*b,1*b);
  ellipse(5*a,9*a,1*b,1*b);
  ellipse(6*a,9*a,1*b,1*b);
  ellipse(7*a,9*a,1*b,1*b);
  ellipse(8*a,9*a,1*b,1*b);

    ellipse(1*a,10*a,1*b,1*b);
  ellipse(2*a,10*a,1*b,1*b);
  rect(2.5*a,9.5*a,2*b,1*b);
  ellipse(5*a,10*a,1*b,1*b);
  ellipse(6*a,10*a,1*b,1*b);
  ellipse(7*a,10*a,1*b,1*b);
  ellipse(8*a,10*a,1*b,1*b);
  rect(8.5*a,9.5*a,2*b,1*b);
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


