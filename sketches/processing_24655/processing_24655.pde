
import processing.pdf.*;




///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
float c;


int x = 0;
int y = 100;

void setup(){
  size(400,800);
  smooth();
  //beginRecord(PDF, "rectangle final.pdf");
  //the white box simply shows you the space your pattern gets drawn in
  
  noStroke();
  for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    stroke(i, j, 0);
    point(i, j);
  }
}
 
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  background(247, 225, 15);
  
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
  noStroke();
  fill(255, 15);
  rect(50, 0, 200, 800);
  rect(150, 0, 200, 800);
  endRecord();
}

void yourFunction(){
  while (c < 50) {
    c=0;
    float amountofellipeses=4500.0;
    for(float counter=amountofellipeses; counter>=0; counter=counter-1.0){
      color from = color(4, 15, 106);
      color to = color(46, 68, 255);
      color inter = lerpColor(from,to,counter/amountofellipeses);
      noFill();
      strokeWeight(1);
      stroke(inter);   
      ellipse(200, 400, 0 + c, 0 + c);
      c=c+0.2;
    }
  }
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-
  
  noStroke();
  fill(1, 8, 80, 45);
  triangle(0, 55, 50, 0, 100, 55);
  rect(30, 25, 40, 75);
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

