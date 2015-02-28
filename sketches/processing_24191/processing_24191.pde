


///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 200;
int patternSeperationY = 100;


void setup(){
  size(600,1200);
 
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
  //strokeWeight(random(1,9));
  stroke(random(30,180));
  strokeWeight(9);
  strokeJoin(ROUND);
  strokeCap(PROJECT);

  //vert lines from left  0
  line(0,0,0,(2*units));              stroke(random(0,255));
  line(0,(3*units),0,(6*units));              stroke(random(0,255));
  line(0,(7*units),0,(9*units));              stroke(random(0,255));
  //vert lines from left  1
  line((1*units),(1*units),(1*units),(3*units));              stroke(random(0,255));
  line((1*units),(5*units),(1*units),(6*units));              stroke(random(0,255));
  line((1*units),(7*units),(1*units),(8*units));              stroke(random(0,255));
  //vert lines from left  2
  line((2*units),(6*units),(2*units),(8*units));              stroke(random(0,255));
  //vert lines from left  3
  line((3*units),(0*units),(3*units),(2*units));              stroke(random(0,255));
  line((3*units),(3*units),(3*units),(4*units));              stroke(random(0,255));
  line((3*units),(6*units),(3*units),(9*units));              stroke(random(0,255));
  //vert lines from left  4
  line((4*units),(1*units),(4*units),(3*units));              stroke(random(0,255));
  line((4*units),(4*units),(4*units),(5*units));              stroke(random(0,255));
  line((4*units),(7*units),(4*units),(8*units));              stroke(random(0,255));
  //vert lines from left  5
  line((5*units),(0*units),(5*units),(2*units));              stroke(random(0,255));
  //vert lines from left  6
  line((6*units),(4*units),(6*units),(7*units));              stroke(random(0,255));
  //vert lines from left  7
  line((7*units),(3*units),(7*units),(4*units));              stroke(random(0,255));
  line((7*units),(5*units),(7*units),(6*units));              stroke(random(0,255));
  //vert lines from left  8
  line((8*units),(1*units),(8*units),(3*units));              stroke(random(0,255));
  line((8*units),(4*units),(8*units),(8*units));              stroke(random(0,255));
  //vert lines from left  9
  line((9*units),(0*units),(9*units),(2*units));              stroke(random(0,255));
  line((9*units),(3*units),(9*units),(6*units));              stroke(random(0,255));
  line((9*units),(7*units),(9*units),(9*units));              stroke(random(0,255));
  //vert lines from left  10
  line((10*units),(1*units),(10*units),(3*units));              stroke(random(0,255));
  line((10*units),(4*units),(10*units),(8*units));              stroke(random(0,255));
  //vert lines from left  11
  line((11*units),(3*units),(11*units),(4*units));              stroke(random(0,255));
  line((11*units),(5*units),(11*units),(6*units));              stroke(random(0,255));
  //vert lines from left  12
  line((12*units),(4*units),(12*units),(7*units));              stroke(random(0,255));
  line((12*units),(8*units),(12*units),(9*units));              stroke(random(0,255));
  //vert lines from left  13
  line((13*units),(0*units),(13*units),(2*units));              stroke(random(0,255));
  //vert lines from left  14
  line((14*units),(1*units),(14*units),(3*units));              stroke(random(0,255));
  line((14*units),(4*units),(14*units),(5*units));              stroke(random(0,255));
  line((14*units),(7*units),(14*units),(8*units));              stroke(random(0,255));
  //vert lines from left  15
  line((15*units),(0*units),(15*units),(2*units));              stroke(random(0,255));
  line((15*units),(3*units),(15*units),(4*units));              stroke(random(0,255));
  line((15*units),(6*units),(15*units),(9*units));              stroke(random(0,255));
  //vert lines from left  16
  line((16*units),(6*units),(16*units),(8*units));              stroke(random(0,255));
  //vert lines from left  17
  line((17*units),(1*units),(17*units),(3*units));              stroke(random(0,255));
  line((17*units),(5*units),(17*units),(6*units));              stroke(random(0,255));
  line((17*units),(7*units),(17*units),(8*units));              stroke(random(0,255));
  //vert lines from left  18
  line((18*units),(0*units),(18*units),(2*units));              stroke(random(0,255));
  line((18*units),(3*units),(18*units),(6*units));              stroke(random(0,255));
  line((18*units),(7*units),(18*units),(9*units));              stroke(random(0,255));
  
  //horz lines from top 0
  line((0*units),(0*units),(5*units),(0*units));              stroke(random(0,255));
  line((6*units),(0*units),(12*units),(0*units));              stroke(random(0,255));
  line((13*units),(0*units),(18*units),(0*units));              stroke(random(0,255));
  //horz lines from top 1
  line((1*units),(1*units),(2*units),(1*units));              stroke(random(0,255));
  line((6*units),(1*units),(8*units),(1*units));              stroke(random(0,255));
  line((10*units),(1*units),(12*units),(1*units));              stroke(random(0,255));
  line((16*units),(1*units),(17*units),(1*units));              stroke(random(0,255));
  //horz lines from top 2
  line((2*units),(2*units),(3*units),(2*units));              stroke(random(0,255));
  line((5*units),(2*units),(7*units),(2*units));              stroke(random(0,255));
  line((11*units),(2*units),(13*units),(2*units));              stroke(random(0,255));
  line((15*units),(2*units),(16*units),(2*units));              stroke(random(0,255));
  //horz lines from top 3
  line((1*units),(3*units),(7*units),(3*units));              stroke(random(0,255));
  line((11*units),(3*units),(17*units),(3*units));              stroke(random(0,255));
  //horz lines from top 4
  line((0*units),(4*units),(2*units),(4*units));              stroke(random(0,255));
  line((5*units),(4*units),(6*units),(4*units));              stroke(random(0,255));
  line((7*units),(4*units),(8*units),(4*units));              stroke(random(0,255));
  line((10*units),(4*units),(11*units),(4*units));              stroke(random(0,255));
  line((12*units),(4*units),(13*units),(4*units));              stroke(random(0,255));
  line((16*units),(4*units),(18*units),(4*units));              stroke(random(0,255));
  //horz lines from top 5
  line((1*units),(5*units),(5*units),(5*units));              stroke(random(0,255));
  line((6*units),(5*units),(7*units),(5*units));              stroke(random(0,255));
  line((11*units),(5*units),(12*units),(5*units));              stroke(random(0,255));
  line((13*units),(5*units),(17*units),(5*units));              stroke(random(0,255));
  //horz lines from top 6
  line((1*units),(6*units),(5*units),(6*units));              stroke(random(0,255));
  line((13*units),(6*units),(17*units),(6*units));              stroke(random(0,255));
  //horz lines from top 7
  line((4*units),(7*units),(8*units),(7*units));              stroke(random(0,255));
  line((10*units),(7*units),(14*units),(7*units));              stroke(random(0,255));
  //horz lines from top 8
  line((1*units),(8*units),(2*units),(8*units));              stroke(random(0,255));
  line((5*units),(8*units),(6*units),(8*units));              stroke(random(0,255));
  line((7*units),(8*units),(8*units),(8*units));              stroke(random(0,255));
  line((10*units),(8*units),(11*units),(8*units));              stroke(random(0,255));
  line((12*units),(8*units),(13*units),(8*units));              stroke(random(0,255));
  line((16*units),(8*units),(17*units),(8*units));              stroke(random(0,255));
  //horz lines from top 9
  line((0*units),(9*units),(5*units),(9*units));              stroke(random(0,255));
  line((6*units),(9*units),(12*units),(9*units));              stroke(random(0,255));
  line((13*units),(9*units),(18*units),(9*units));              stroke(random(0,255));
  
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

