
//import processing.pdf.*;

void setup(){
  size(300,600);
  smooth();
  
  //noLoop();
 //beginRecord(PDF, "fourthdesign.pdf");
  
}
void draw(){
  background(255);
  strokeWeight(3);
  stroke(0);
  fill(0);
  rect(5,5,85,85);
  rect(95,125,85,85);
  rect(125,260,85,85);
  rect(95,390,85,85);
  rect(5,510,85,85);
  rect(0,120,17,50);
  rect(5,200,50,50);
  rect(50,280,50,50);
  rect(5,355,50,50);
  rect(0,435,17,50);


  
   //endRecord();
 
  
}

void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("third design");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}

