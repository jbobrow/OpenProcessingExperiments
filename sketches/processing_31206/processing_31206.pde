
int patternSeperationX = 100;
int patternSeperationY = 100;
 
 
void setup(){
  size(500,500);
   
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  rect(0,10,patternSeperationX,patternSeperationY);
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

  triangle(60, 75, 58, 20, 86, 75);
noFill();
stroke(255); 
noFill();
stroke(0, 0, 0);
bezier(45, 20, 10, 10, 70, 90, 15, 80);
stroke(196); 
curveTightness(6.5); 
noFill();
stroke(255); 
beginShape();
curveVertex(10, 26);
curveVertex(10, 26);
curveVertex(83, 24);
curveVertex(83, 61);
curveVertex(25, 65); 
curveVertex(25, 65);
endShape();
stroke(80); 
curveTightness(-2.5); 
beginShape();
curveVertex(10, 26);
curveVertex(10, 26);
curveVertex(83, 24);
curveVertex(83, 61);
curveVertex(25, 65); 
curveVertex(25, 65);
endShape();
strokeWeight(2); 
line(10, 40, 80, 40);
stroke(604, 502, 60);

   
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

