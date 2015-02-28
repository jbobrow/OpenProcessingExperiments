


///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
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
void style(){
  noFill();
  smooth();
  //strokeWeight(random(1,9));
  strokeWeight(17.5);
  stroke(random(80,220),30);
  strokeJoin(ROUND);
  strokeCap(ROUND);
}

float multiplier = 300/72;
float units = 2.779*multiplier;
void yourFunction(){
  //MAZE

  style();
  //vert lines from left  0
  line((0*units),(1*units),(0*units),(6*units));
  style();
  line((0*units),(8*units),(0*units),(9*units));
  style();
  //vert lines from left  1
  line((1*units),(3*units),(1*units),(6*units));
  style();
  //vert lines from left  2
  line((2*units),(4*units),(2*units),(5*units));
  style();
  line((2*units),(7*units),(2*units),(8*units));
  style();
  //vert lines from left  3
  line((3*units),(1*units),(3*units),(3*units));
  style();
  line((3*units),(4*units),(3*units),(7*units));
  style();
  line((3*units),(8*units),(3*units),(9*units));
  style();
  //vert lines from left  4
  line((4*units),(0*units),(4*units),(2*units));
  style();
  line((4*units),(3*units),(4*units),(4*units));
  style();
  line((4*units),(5*units),(4*units),(6*units));
  style();
  line((4*units),(7*units),(4*units),(8*units));
  style();
  //vert lines from left  5
  line((5*units),(4*units),(5*units),(7*units));
  style();
  line((5*units),(8*units),(5*units),(9*units));
  style();
  //vert lines from left  6
  line((6*units),(0*units),(6*units),(4*units));
  style();
  line((6*units),(5*units),(6*units),(7*units));
  style();
  //vert lines from left  7
  line((7*units),(4*units),(7*units),(6*units));
  style();
  line((7*units),(8*units),(7*units),(9*units));
  style();
  //vert lines from left  8
  line((8*units),(0*units),(8*units),(1*units));
  style();
  line((8*units),(2*units),(8*units),(3*units));
  style();
  line((8*units),(4*units),(8*units),(6*units));
  style();
  line((8*units),(8*units),(8*units),(9*units));
  style();
  //vert lines from left  9
  line((9*units),(1*units),(9*units),(6*units));
  style();
  line((9*units),(8*units),(9*units),(9*units));
  style();
  

  //horz lines from top 0
  line((1*units),(0*units),(4*units),(0*units));
  style();
  line((5*units),(0*units),(7*units),(0*units));
  style();
  line((8*units),(0*units),(9*units),(0*units));
  style();
  //horz lines from top 1
  line((1*units),(1*units),(3*units),(1*units));
  style();
  line((5*units),(1*units),(9*units),(1*units));
  style();
  //horz lines from top 2
  line((0*units),(2*units),(2*units),(2*units));
  style();
  line((4*units),(2*units),(5*units),(2*units));
  style();
  line((6*units),(2*units),(8*units),(2*units));
  style();
  //horz lines from top 3
  line((1*units),(3*units),(4*units),(3*units));
  style();
  line((5*units),(3*units),(6*units),(3*units));
  style();
  line((7*units),(3*units),(8*units),(3*units));
  style();
  //horz lines from top 4
  line((2*units),(4*units),(3*units),(4*units));
  style();
  line((4*units),(4*units),(5*units),(4*units));
  style();
  line((6*units),(4*units),(7*units),(4*units));
  style();
  //horz lines from top 5
  line((2*units),(5*units),(4*units),(5*units));
  style();
  //horz lines from top 6
  line((1*units),(6*units),(2*units),(6*units));
  style();
  line((3*units),(6*units),(4*units),(6*units));
  style();
  line((8*units),(6*units),(9*units),(6*units));
  style();
  //horz lines from top 7
  line((0*units),(7*units),(1*units),(7*units));
  style();
  line((2*units),(7*units),(3*units),(7*units));
  style();
  line((4*units),(7*units),(5*units),(7*units));
  style();
  line((6*units),(7*units),(9*units),(7*units));
  style();
  //horz lines from top 8
  line((1*units),(8*units),(2*units),(8*units));
  style();
  line((3*units),(8*units),(4*units),(8*units));
  style();
  line((5*units),(8*units),(7*units),(8*units));
  style();
  line((8*units),(8*units),(9*units),(8*units));
  style();
  //horz lines from top 8
  line((1*units),(8*units),(2*units),(8*units));
  style();
  line((3*units),(8*units),(4*units),(8*units));
  style();
  line((5*units),(8*units),(7*units),(8*units));
  style();
  line((8*units),(8*units),(9*units),(8*units));
  style();
  //horz lines from top 9
  line((1*units),(9*units),(4*units),(9*units));
  style();
  line((5*units),(9*units),(7*units),(9*units));
  style();
  line((8*units),(9*units),(9*units),(9*units));
  style();
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

