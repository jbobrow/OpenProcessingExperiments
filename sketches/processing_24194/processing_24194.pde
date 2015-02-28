


///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(1000,2000);

  //the white box simply shows you the space your pattern gets drawn in
  fill(255);
  noStroke();
  rect(0,0,width,height);
  stroke(0);
  
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
        
      }
  }
  gradient();
  
}


void draw()
{
  //This is here so the program keeps running and the screengrab will work
}


float multiplier = 300/72;
float units = 2.779*multiplier;
void yourFunction(){
  
  //MAZE

  noFill();
  smooth();
  stroke(0);
  //strokeWeight(random(1,9));
  strokeWeight(1);
  strokeJoin(ROUND);
  strokeCap(ROUND);

  //  / lines from left
  line((0*units),(1*units),(0.5*units),(0.5*units));
  line((0.5*units),(2.5*units),(0*units),(3*units));
  line((1*units),(2*units),(2*units),(1*units));
  line((1*units),(3*units),(0*units),(4*units));
  line((1*units),(4*units),(0*units),(5*units));
  line((1*units),(5*units),(0*units),(6*units));
  line((2.5*units),(3.5*units),(3*units),(3*units));
  line((1.5*units),(5.5*units),(0*units),(7*units));
  line((2*units),(5*units),(2.5*units),(4.5*units));
  line((1.5*units),(6.5*units),(0.5*units),(7.5*units));
  line((2*units),(6*units),(3.5*units),(4.5*units));
  line((7.5*units),(0.5*units),(8*units),(0*units));
  line((2*units),(7*units),(0*units),(9*units));
  line((2.5*units),(6.5*units),(4.5*units),(4.5*units));
  line((5*units),(4*units),(9*units),(0*units));
  line((1*units),(9*units),(5*units),(5*units));
  line((5.5*units),(4.5*units),(6.5*units),(3.5*units));
  line((7.5*units),(2.5*units),(9*units),(1*units));
  line((2*units),(9*units),(5*units),(6*units));
  line((6.5*units),(4.5*units),(7*units),(4*units));
  line((7.5*units),(3.5*units),(9*units),(2*units));
  line((3*units),(9*units),(6*units),(6*units));
  line((8*units),(4*units),(9*units),(3*units));
  line((4*units),(9*units),(6*units),(7*units));
  line((8.5*units),(4.5*units),(9*units),(4*units));
  line((5*units),(9*units),(6*units),(8*units));
  line((8.5*units),(8.5*units),(9*units),(8*units));
  
  
  
  //    \ lines from left
  line((0*units),(1*units),(1*units),(2*units));
  line((0*units),(2*units),(0.5*units),(2.5*units));
  line((0.5*units),(0.5*units),(2.5*units),(2.5*units));
  line((1*units),(0*units),(1.5*units),(0.5*units));
  line((1*units),(3*units),(2.5*units),(4.5*units));
  line((1*units),(4*units),(2*units),(5*units));
  line((1*units),(5*units),(1.5*units),(5.5*units));
  line((1.5*units),(6.5*units),(2*units),(7*units));
  line((1.5*units),(2.5*units),(2.5*units),(3.5*units));
  line((2*units),(6*units),(2.5*units),(6.5*units));
  line((2*units),(1*units),(5*units),(4*units));
  line((2*units),(0*units),(5*units),(3*units));
  line((3*units),(3*units),(4.5*units),(4.5*units));
  line((3*units),(4*units),(3.5*units),(4.5*units));
  line((3.5*units),(0.5*units),(6*units),(3*units));
  line((4*units),(0*units),(6*units),(2*units));
  line((5*units),(0*units),(7*units),(2*units));
  line((6*units),(0*units),(7.5*units),(1.5*units));
  line((7*units),(0*units),(7.5*units),(0.5*units));
  line((5*units),(5*units),(5.5*units),(5.5*units));
  line((5.5*units),(4.5*units),(9*units),(8*units));
  line((6.5*units),(4.5*units),(9*units),(7*units));
  line((7*units),(3*units),(7.5*units),(3.5*units));
  line((8.5*units),(4.5*units),(9*units),(5*units));
  line((7*units),(4*units),(9*units),(6*units));
  line((6*units),(6*units),(8.5*units),(8.5*units));
  line((6*units),(7*units),(8*units),(9*units));
  line((6*units),(8*units),(7*units),(9*units));
  
}
void gradient(){
  int x1=0;
    for (int i = 0; i<=(width/2); i++){
    stroke(255,(x1*.48));
    line(i,0,i,height);
    //stroke(0);
    x1++;
}
int x2=width/2;
    for (int i=(width/2); i<=width; i++){
    stroke(255,(x2*.48));
    line(i,0,i,height);
    //stroke(0);
    x2--;
}

float x3=width*.4;
    for (int i=(0); i<=width*.4; i++){
    stroke(255,(x3*.73));
    line(i,0,i,height);
    //stroke(0);
    x3--;
}


  float x4=0;
    for (float i = width*.6; i<=width; i++){
    stroke(255,(x4*.73));
    line(i,0,i,height);
    //stroke(0);
    x4++;
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

