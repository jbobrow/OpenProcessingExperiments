
//import processing.pdf.*;




///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 50;
int patternSeperationY = 50;
float r = 0;
float c;
int x = 0;
int y = 100;

void setup(){
  size(400,800);
  smooth();
  //beginRecord(PDF, "ellipse Wallpaper Final.pdf");
  
  //the white box simply shows you the space your pattern gets drawn in
  
  noStroke();
  for (int j = 0; j < 100; j++) {
  for (int i = 0; i < 100; i++) {
    stroke(j, i, 0);
    point(j, i);
  }
}
 
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  background(247, 225, 15);
  
  for(int j = 0; j < height/patternSeperationX; j++){
      for(int i = 0; i < width/patternSeperationY; i++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
  endRecord();
}

void yourFunction(){
  while (c < 50) {
    c=0;
    float amountofellipses=4500.0;
    for(float counter=amountofellipses; counter>=0; counter=counter-1.0){
      color from = color(4, 15, 106);
      color to = color(46, 68, 255);
      color inter = lerpColor(from,to,counter/amountofellipses);
      noFill();
      strokeWeight(1);
      stroke(inter); 
      ellipse(200, 400, 0 + c, 0 + c);
      c=c+0.2;
    }
  }
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-
  
  //while (x < 5000) {
  noStroke();
  fill(1, 8, 80);
  ellipse(20, 20, 15.5 + r, 15.5 + r);  
  ellipse(20, 800, 60, 60);  
  r=r+0.35;
} 

void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 'p' || key == 'p')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}


