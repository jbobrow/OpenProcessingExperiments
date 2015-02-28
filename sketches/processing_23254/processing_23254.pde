
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 25;
int patternSeperationY = 25;

int patternSeperationx = 50;
int patternSeperationy = 50;

float a = 2.5;
int c = 5;
int b = 10;
 
 
void setup(){
  size(500,500);
   
  //the white box simply shows you the space your pattern gets drawn in
  background(#000000);
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
  
    for(int i = 0; i < width/patternSeperationx; i++){
      for(int j = 0; j < height/patternSeperationy; j++){
        pushMatrix();
        translate(i*patternSeperationx, j*patternSeperationy);
        yourFunctiona();
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
  
  smooth();
  stroke(#F660AB,random(100));
  fill(0);
  strokeWeight(1);
  beginShape();
  curveVertex(0, 5*a); // the first control point
  curveVertex(0, 5*a); // is also the start point of curve
  curveVertex(2.5*a, 7.5*a);
  curveVertex(5*a, 5*a);
  curveVertex(7.5*a, 2.5*a);
  curveVertex(10*a, 5*a); // the last point of curve
  curveVertex(10*a, 5*a); // is also the last control point
  endShape();
    beginShape();
  curveVertex(5*a, 0); // the first control point
  curveVertex(5*a, 0); // is also the start point of curve
  curveVertex(7.5*a, 2.5*a);
  curveVertex(5*a, 5*a);
  curveVertex(2.5*a, 7.5*a);
  curveVertex(5*a, 10*a); // the last point of curve
  curveVertex(10*a, 10*a); // is also the last control point
  endShape();
    beginShape();
  curveVertex(0, 5*a); // the first control point
  curveVertex(0, 5*a); // is also the start point of curve
  curveVertex(2.5*a, 2.5*a);
  curveVertex(5*a, 5*a);
  curveVertex(7.5*a, 7.5*a);
  curveVertex(10*a, 5*a); // the last point of curve
  curveVertex(10*a, 5*a); // is also the last control point
  endShape();
    beginShape();
  curveVertex(5*a, 0); // the first control point
  curveVertex(5*a, 0); // is also the start point of curve
  curveVertex(2.5*a, 2.5*a);
  curveVertex(5*a, 5*a);
  curveVertex(7.5*a, 7.5*a);
  curveVertex(5*a, 10*a); // the last point of curve
  curveVertex(5*a, 10*a); // is also the last control point
  endShape();
  stroke(#1589FF,random(100));
  strokeWeight(1);
  fill(255,random(100));
  ellipse(5*a, 5*a, 5*a, 5*a);
  fill(255,random(50));
  ellipse(5*a, 5*a, 15*a, 15*a);
  fill(255,random(25));
  ellipse(0, 0, 10*a, 10*a); 
  
}

void yourFunctiona(){
smooth();
  stroke(255,random(0,50));
  strokeWeight(random(5));
  fill(255,random(0,10));
  ellipse(1*c,1*c,1*b,1*b);
  ellipse(2*c,1*c,1*b,1*b);
  rect(2.5*c,0.5*c,2*b,1*b);
  ellipse(5*c,1*c,1*b,1*b);
  ellipse(6*c,1*c,1*b,1*b);
  ellipse(7*c,1*c,1*b,1*b);
  ellipse(8*c,1*c,1*b,1*b);
  rect(8.5*c,0.5*c,2*b,1*b);
  
  ellipse(2*c,2*c,1*b,1*b);
  rect(2.5*c,1.5*c,2*b,1*b);
  ellipse(5*c,2*c,1*b,1*b);
  ellipse(6*c,2*c,1*b,1*b);
  ellipse(7*c,2*c,1*b,1*b);
  ellipse(8*c,2*c,1*b,1*b);
  rect(8.5*c,1.5*c,2*b,1*b);
  
  ellipse(1*c,3*c,1*b,1*b);
  rect(2.5*c,2.5*c,2*b,1*b);
  ellipse(5*c,3*c,1*b,1*b);
  ellipse(6*c,3*c,1*b,1*b);
  ellipse(7*c,3*c,1*b,1*b);
  ellipse(8*c,3*c,1*b,1*b);
  rect(8.5*c,2.5*c,2*b,1*b);
  
  ellipse(1*c,4*c,1*b,1*b);
  ellipse(2*c,4*c,1*b,1*b);
  ellipse(5*c,4*c,1*b,1*b);
  ellipse(6*c,4*c,1*b,1*b);
  ellipse(7*c,4*c,1*b,1*b);
  ellipse(8*c,4*c,1*b,1*b);
  rect(8.5*c,3.5*c,2*b,1*b);
  
  ellipse(1*c,5*c,1*b,1*b);
  ellipse(2*c,5*c,1*b,1*b);
  rect(2.5*c,4.5*c,2*b,1*b);
  ellipse(6*c,5*c,1*b,1*b);
  ellipse(7*c,5*c,1*b,1*b);
  ellipse(8*c,5*c,1*b,1*b);
  rect(8.5*c,4.5*c,2*b,1*b);
  
  ellipse(1*c,6*c,1*b,1*b);
  ellipse(2*c,6*c,1*b,1*b);
  rect(2.5*c,5.5*c,2*b,1*b);
  ellipse(5*c,6*c,1*b,1*b);
  ellipse(7*c,6*c,1*b,1*b);
  ellipse(8*c,6*c,1*b,1*b);
  rect(8.5*c,5.5*c,2*b,1*b);
  
  ellipse(1*c,7*c,1*b,1*b);
  ellipse(2*c,7*c,1*b,1*b);
  rect(2.5*c,6.5*c,2*b,1*b);
  ellipse(5*c,7*c,1*b,1*b);
  ellipse(6*c,7*c,1*b,1*b);
  ellipse(8*c,7*c,1*b,1*b);
  rect(8.5*c,6.5*c,2*b,1*b);

  ellipse(1*c,8*c,1*b,1*b);
  ellipse(2*c,8*c,1*b,1*b);
  rect(2.5*c,7.5*c,2*b,1*b);
  ellipse(5*c,8*c,1*b,1*b);
  ellipse(6*c,8*c,1*b,1*b);
  ellipse(7*c,8*c,1*b,1*b);
  rect(8.5*c,7.5*c,2*b,1*b);
  
    ellipse(1*c,9*c,1*b,1*b);
  ellipse(2*c,9*c,1*b,1*b);
  rect(2.5*c,8.5*c,2*b,1*b);
  ellipse(5*c,9*c,1*b,1*b);
  ellipse(6*c,9*c,1*b,1*b);
  ellipse(7*c,9*c,1*b,1*b);
  ellipse(8*c,9*c,1*b,1*b);

    ellipse(1*c,10*c,1*b,1*b);
  ellipse(2*c,10*c,1*b,1*b);
  rect(2.5*c,9.5*c,2*b,1*b);
  ellipse(5*c,10*c,1*b,1*b);
  ellipse(6*c,10*c,1*b,1*b);
  ellipse(7*c,10*c,1*b,1*b);
  ellipse(8*c,10*c,1*b,1*b);
  rect(8.5*c,9.5*c,2*b,1*b);


   
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


