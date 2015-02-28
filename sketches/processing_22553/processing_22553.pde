
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////
 
 
//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;
 
 
void setup(){
  size(500,500);
   smooth();
  //the white box simply shows you the space your pattern gets drawn in
background(250,245,202);
   
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
   
noFill();
//strokeWeight(4);
ellipse(50,50,100,100);
fill(152,20,53);
ellipse(20,10,10,10);
ellipse(10,20,10,10);
//top left corner circles
ellipse(10,80,10,10);
ellipse(20,90,10,10);
//bottom left circles
ellipse(80,10,10,10);
ellipse(90,20,10,10);
//top right circles
ellipse(90,80,10,10);
ellipse(80,90,10,10);
//bottom right circles
//line(35,35,65,65);
//line(65,35,35,65);
noFill();
bezier(85, 20, 10, 10, 90, 90, 15, 80);
bezier(85,20,20,20,100,100,25,90);
bezier(85,20,30,30,100,100,35,100);
//stroke(255, 102, 0);
//int steps = 5;
//for (int i = 0; i <= steps; i++) {
  //float t = i / float(steps);
  //float x = bezierPoint(85, 10, 90, 15, t);
  //float y = bezierPoint(20, 10, 90, 80, t);
  //float tx = bezierTangent(85, 10, 90, 15, t);
  //float ty = bezierTangent(20, 10, 90, 80, t);
  //float a = atan2(ty, tx);
  //a -= HALF_PI;
  //line(x, y, cos(a)*8 + x, sin(a)*8 + y);
//}
//for (int i = 0; i <= steps; i++) {
  //float t = i / float(steps);
  //float x = bezierPoint(95, 20, 100, 25, t);
  //float y = bezierPoint(30, 20, 100, 90, t);
  //float tx = bezierTangent(95, 20, 100, 25, t);
  //float ty = bezierTangent(30, 20, 100, 90, t);
  //float a = atan2(ty, tx);
  //a -= HALF_PI;
  //line(x, y, cos(a)*10 + x, sin(a)*10 + y);
//}

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


