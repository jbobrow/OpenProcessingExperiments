
//import processing.pdf.*;

///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to rectangles0? what are they doing to the pattern?
int patternSeperationX = 200;
int patternSeperationY = 200;
int rectangles = 50;

void setup(){
  size(400,800);
  //  beginRecord(PDF, "rect.pdf");
  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
 //rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        
        topLeft();
        topRight();
        bottomLeft();
        bottomRight();
        popMatrix();
      }
  }
  //endRecord();
}


void draw()
{
  //This is here so the program keeps running and the screengrab will work
}

void style(){
  noStroke();
 fill(random(0,255)); 
}
void topLeft(){
  float x1 = 0;
  float x2 = ((patternSeperationX/2)/rectangles);
  float y1 = 0;
  float y2 = (patternSeperationY/2);
  for(float i=0; i<(patternSeperationX/2); i+=((patternSeperationX/2)/rectangles)){
    style();
    rect(x1,y1,((patternSeperationX/2)/rectangles),patternSeperationY/2);
    x1+=((patternSeperationX/2)/rectangles);
  }
}

void bottomRight(){
  float x1 = patternSeperationX/2;
  float x2 = patternSeperationX;
  float y1 = patternSeperationY/2;
  float y2 = patternSeperationY;
  for(float i=patternSeperationX/2; i<(patternSeperationX); i+=((patternSeperationX/2)/rectangles)){
    style();
    rect(x1,y1,((patternSeperationX/2)/rectangles),patternSeperationY/2);
    x1+=((patternSeperationX/2)/rectangles);
  }
}


void topRight(){
  float x1 = patternSeperationX/2;
  float x2 = ((patternSeperationX/2)/rectangles);
  float y1 = 0;
  float y2 = (patternSeperationY/2);
  for(float i=0; i<(patternSeperationX/2); i+=((patternSeperationX/2)/rectangles)){
    style();
    rect(x1,y1,(patternSeperationX/2),((patternSeperationY/2)/rectangles));
    y1+=((patternSeperationY/2)/rectangles);
    y2+=((patternSeperationY/2)/rectangles);
  }
}

void bottomLeft(){
  float x1 = 0;
  float x2 = patternSeperationX/2;
  float y1 = patternSeperationY/2;
  float y2 = patternSeperationY;
  for(float i=0; i<(patternSeperationX/2); i+=((patternSeperationX/2)/rectangles)){
    style();
    rect(x1,y1,(patternSeperationX/2),((patternSeperationY/2)/rectangles));
    y1+=((patternSeperationY/2)/rectangles);
    y2+=((patternSeperationY/2)/rectangles);
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

